import CoreFoundation
import Jinx

struct ObjcGetClass: HookFunc {
    typealias T = @convention(c) (
        UnsafePointer<Int8>
    ) -> Any?

    let function: String = "_objc_getClass"
    let image: String? = nil
    let replacement: T = { name in
        if strcasestr(name, "Satella") != nil {
            return nil
        }
        
        let orig: T = PowPow.orig(ObjcGetClass.self)!
        return orig(name)
    }
}
