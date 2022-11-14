import Foundation.NSString

struct DyldGetImageName: HookFunc {
    typealias T = @convention(c) (
        UInt32
    ) -> UnsafePointer<Int8>?

    let function: String = "__dyld_get_image_name"
    let image: String? = nil
    let replacement: T = { dyldIndex in
        let orig: T = PowPow.unwrap(DyldGetImageName.self)!
        let origVal: UnsafePointer<Int8>? = orig(dyldIndex)
        let hidden: [String] = [
            "Crack",
            "FLEX",
            "Satella",
            "Substrate"
        ]

        for img in hidden {
            if String(cString: origVal!).contains(img) {
                return ("/usr/lib/\(UUID())" as NSString).utf8String
            }
        }

        return origVal
    }
}
