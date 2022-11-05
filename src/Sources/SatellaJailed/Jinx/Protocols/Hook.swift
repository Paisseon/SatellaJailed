import Foundation

protocol Hook {
    associatedtype T
    
    var `class`: AnyClass { get }
    var selector: Selector { get }
    var replacement: T { get }
}

extension Hook {
    @discardableResult
    func hook(
        onlyIf condition: Bool = true
    ) -> Bool {
        if !condition {
            return false
        }
        
        return PowPow.hook(
            `class`,
            selector,
            replacement,
            type(of: self)
        )
    }
}
