import StoreKit

struct TransactionState: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> SKPaymentTransactionState

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = #selector(getter: SKPaymentTransaction.transactionState)
    let replacement: T = { _, _ in
            .purchased
        }
}
