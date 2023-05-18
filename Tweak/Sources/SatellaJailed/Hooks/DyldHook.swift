import Jinx

struct DyldHook: HookFunc {
    typealias T = @convention(c) (UInt32) -> UnsafePointer<Int8>?
    
    let name: String = "_dyld_get_image_name"
    let replace: T = { index in
        let crane: UnsafePointer<Int8> = "/usr/lib/libcrane.dylib".withCString { $0 }
        let origVal: UnsafePointer<Int8>? = orig(index)

        if let origVal, !String(cString: origVal).hasSuffix("SatellaJailed.dylib") {
            return origVal
        }
        
        return crane
    }
}
