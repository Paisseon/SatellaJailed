import StoreKit

struct TransactionReceipt: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> Data?

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = sel_registerName("transactionReceipt")
    let replacement: T = { `self`, _ in
        Receipt.generate(
            for: `self`.payment.productIdentifier
        )
    }
}

