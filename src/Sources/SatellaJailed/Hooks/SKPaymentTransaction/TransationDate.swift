import StoreKit

struct TransactionDate: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> Date

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = #selector(getter: SKPaymentTransaction.transactionDate)
    let replacement: T = { _, _ in
        Date()
    }
}
