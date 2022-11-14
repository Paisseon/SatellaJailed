import Foundation

struct InitWithString: Hook {
    typealias T = @convention(c) (
        NSURL,
        Selector,
        String
    ) -> NSURL

    let `class`: AnyClass = NSURL.self
    let selector: Selector = sel_registerName("initWithString:")
    let replacement: T = { `self`, cmd, path in
        let orig: T = PowPow.unwrap(InitWithString.self)!
        let needle: String = "apple.com/verifyReceipt"
        let crackPath: String = "https://drm.cypwn.xyz/verifyReceipt.php"
        
        return orig(
            `self`,
            cmd,
            path.contains(needle) ? crackPath : path
        )
    }
}
