import Jinx

struct DyldGetImageName: HookFunc {
    typealias T = @convention(c) (UInt32) -> UnsafePointer<Int8>?

    let function: String = "__dyld_get_image_name"
    let image: String? = nil
    let replacement: T = { index in
        let orig: T = PowPow.orig(DyldGetImageName.self)!
        let origVal: UnsafePointer<Int8>? = orig(index)
        
        guard let origVal,
              !String(cString: origVal).contains("Satella")
        else {
            return "/usr/lib/libcrane.dylib".withCString { $0 }
        }

        return origVal
    }
}
