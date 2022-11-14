protocol HookFunc {
    associatedtype T
    
    var function: String { get }
    var image: String? { get }
    var replacement: T { get }
}

extension HookFunc {
    @discardableResult
    func hook(
        onlyIf condition: Bool = true
    ) -> Bool {
        if !condition {
            return false
        }
        
        guard let replacementPtr: UnsafeMutableRawPointer = unsafeBitCast(
            replacement,
            to: UnsafeMutableRawPointer?.self
        ) else {
            return false
        }
        
        return PowPow.hookFunc(
            function,
            image,
            replacementPtr,
            type(of: self)
        )
    }
}
