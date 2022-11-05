import MachO

// MARK: - FishBones

struct FishBones {
    // MARK: Internal

    mutating func hook(
        _ _symbol: String,
        _ _image: String?,
        _ _replacement: UnsafeRawPointer,
        _ _orig: inout UnsafeMutableRawPointer?
    ) -> Bool {
        symbol = _symbol
        replacement = _replacement
        orig = _orig
        
        for i in 0 ..< _dyld_image_count() {
            if _image == nil || String(cString: _dyld_get_image_name(i)) == _image! {
                guard let header: UnsafePointer<mach_header> = _dyld_get_image_header(i) else {
                    continue
                }
                
                let machHeader: UnsafePointer<mach_header_64> = header.withMemoryRebound(
                    to: mach_header_64.self,
                    capacity: 1
                ) { $0 }
                let slide: Int = _dyld_get_image_vmaddr_slide(i)
                
                let ret: Bool = hookImage(
                    machHeader,
                    slide
                )
                
                _orig = orig
                
                return ret
            }
        }
        
        return false
    }

    // MARK: Private

    private var symbol: String!
    private var replacement: UnsafeRawPointer!
    private var orig: UnsafeMutableRawPointer?

    private mutating func hookImage(
        _ header: UnsafePointer<mach_header_64>,
        _ slide: Int
    ) -> Bool {
        guard var loadCommand: UnsafeMutableRawPointer = .init(
            bitPattern: UInt(bitPattern: header) + UInt(MemoryLayout<mach_header_64>.size)
        ) else {
            return false
        }
        
        var segmentCommand: UnsafeMutablePointer<segment_command_64>
        var linkeditCommand: UnsafeMutablePointer<segment_command_64>?
        var symbolTableCommand: UnsafeMutablePointer<symtab_command>?
        var dySymTableCommand: UnsafeMutablePointer<dysymtab_command>?
        
        for _: UInt32 in 0 ..< header.pointee.ncmds {
            segmentCommand = loadCommand.assumingMemoryBound(to: segment_command_64.self)
            
            if segmentCommand.pointee.cmd == LC_SEGMENT_64 {
                if strcmp(&segmentCommand.pointee.segname, SEG_LINKEDIT) == 0 {
                    linkeditCommand = segmentCommand
                }
            } else if segmentCommand.pointee.cmd == LC_SYMTAB {
                symbolTableCommand = .init(OpaquePointer(segmentCommand))
            } else if segmentCommand.pointee.cmd == LC_DYSYMTAB {
                dySymTableCommand = .init(OpaquePointer(segmentCommand))
            }
            
            loadCommand += Int(segmentCommand.pointee.cmdsize)
        }
        
        guard let linkeditCommand = linkeditCommand,
              let symbolTableCommand = symbolTableCommand,
              let dySymTableCommand = dySymTableCommand
        else {
            return false
        }
        
        let linkeditBase: Int = slide + Int(linkeditCommand.pointee.vmaddr - linkeditCommand.pointee.fileoff)
        
        guard
            let symbolTable: UnsafeMutablePointer<nlist_64> = .init(
                bitPattern: linkeditBase + Int(symbolTableCommand.pointee.symoff)
            ),
            let stringTable: UnsafeMutablePointer<UInt8> = .init(
                bitPattern: linkeditBase + Int(symbolTableCommand.pointee.stroff)
            ),
            let indirectSymbolTable: UnsafeMutablePointer<UInt32> = .init(
                bitPattern: linkeditBase + Int(dySymTableCommand.pointee.indirectsymoff)
            )
        else {
            return false
        }
        
        guard var loadCommand: UnsafeMutableRawPointer = .init(
            bitPattern: UInt(bitPattern: header) + UInt(MemoryLayout<mach_header_64>.size)
        ) else {
            return false
        }
        
        for _: UInt32 in 0 ..< header.pointee.ncmds {
            segmentCommand = loadCommand.assumingMemoryBound(to: segment_command_64.self)
            
            if segmentCommand.pointee.cmd == LC_SEGMENT_64 {
                let nameOffset: Int = MemoryLayout.size(
                    ofValue: segmentCommand.pointee.cmd
                ) + MemoryLayout.size(
                    ofValue: segmentCommand.pointee.cmdsize
                )
                let namePointer: UnsafePointer<Int8> = UnsafeRawPointer(segmentCommand)
                    .advanced(by: nameOffset).assumingMemoryBound(to: Int8.self)
                let name: String = .init(cString: namePointer)
                
                if name != "__DATA",
                   name != "__DATA_CONST"
                {
                    loadCommand += Int(segmentCommand.pointee.cmdsize)
                    continue
                }
                
                for i: UInt32 in 0 ..< segmentCommand.pointee.nsects {
                    let section: UnsafeMutablePointer<section_64> = UnsafeMutableRawPointer(
                        loadCommand + MemoryLayout<segment_command_64>.size
                    )
                    .advanced(by: Int(i))
                    .assumingMemoryBound(to: section_64.self)
                    
                    if (Int32(section.pointee.flags) & SECTION_TYPE) == S_LAZY_SYMBOL_POINTERS ||
                        (Int32(section.pointee.flags) & SECTION_TYPE) == S_NON_LAZY_SYMBOL_POINTERS
                    {
                        return replace(
                            slide,
                            section,
                            symbolTable,
                            stringTable,
                            indirectSymbolTable
                        )
                    }
                }
            }
            
            loadCommand += Int(segmentCommand.pointee.cmdsize)
        }
        
        return false
    }
    
    private mutating func replace(
        _ slide: Int,
        _ section: UnsafeMutablePointer<section_64>,
        _ symbolTable: UnsafeMutablePointer<nlist_64>,
        _ stringTable: UnsafeMutablePointer<UInt8>,
        _ indirectSymbolTable: UnsafeMutablePointer<UInt32>
    ) -> Bool {
        let indices: UnsafeMutablePointer<UInt32> = indirectSymbolTable
            .advanced(by: Int(section.pointee.reserved1))
        
        guard let bindings: UnsafeMutablePointer<UnsafeMutableRawPointer> = .init(
            bitPattern: slide + Int(section.pointee.addr)
        )
        else {
            return false
        }
        
        guard vm_protect(
            mach_task_self_,
            vm_address_t(slide + Int(section.pointee.addr)),
            vm_size_t(section.pointee.size),
            0,
            VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY
        ) == KERN_SUCCESS
        else {
            return false
        }
        
        for i: Int in 0 ..< Int(section.pointee.size) / MemoryLayout<UnsafeMutableRawPointer>.size {
            let indirectSymbol: UnsafeMutablePointer<UInt32> = indices.advanced(by: i)
            
            if indirectSymbol.pointee == INDIRECT_SYMBOL_ABS ||
                indirectSymbol.pointee == INDIRECT_SYMBOL_LOCAL ||
                indirectSymbol.pointee == (INDIRECT_SYMBOL_LOCAL | UInt32(INDIRECT_SYMBOL_ABS))
            {
                continue
            }
            
            let stringTableOffset: UInt32 = symbolTable
                .advanced(by: Int(indirectSymbol.pointee))
                .pointee
                .n_un
                .n_strx
            let symbolNamePointer: UnsafeMutablePointer<UInt8> = stringTable
                .advanced(by: Int(stringTableOffset))
            let symbolName: String = .init(cString: symbolNamePointer)
            
            if symbolName == symbol {
                orig = bindings.advanced(by: i).pointee
                bindings
                    .advanced(by: i)
                    .initialize(to: UnsafeMutableRawPointer(mutating: replacement))
                
                return true
            }
        }
        
        return false
    }
}
