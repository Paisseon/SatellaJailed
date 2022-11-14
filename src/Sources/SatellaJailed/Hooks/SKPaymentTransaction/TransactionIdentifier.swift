import StoreKit

struct TransactionIdentifier: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> String

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = #selector(getter: SKPaymentTransaction.transactionIdentifier)
    let replacement: T = { _, _ in
        UUID().uuidString
    }
}
