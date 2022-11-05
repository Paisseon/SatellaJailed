import StoreKit

struct CanMakePayments: Hook {
    typealias T = @convention(c) (
        SKPaymentQueue,
        Selector
    ) -> Bool

    let `class`: AnyClass = SKPaymentQueue.self
    let selector: Selector = #selector(SKPaymentQueue.canMakePayments)
    let replacement: T = { _, _ in
        true
    }
}

