import Jinx
import StoreKit

struct ErrorGetter: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> Error?

    let `class`: AnyClass? = SKPaymentQueue.self
    let selector: Selector = #selector(getter: SKPaymentTransaction.error)
    let replacement: T = { _, _ in
        nil
    }
}
