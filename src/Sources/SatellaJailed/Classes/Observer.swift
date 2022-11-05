import StoreKit

final class SatellaObserver: NSObject, SKPaymentTransactionObserver {
    // MARK: Lifecycle

    override private init() {
        super.init()
    }

    // MARK: Internal

    static let shared: SatellaObserver = .init()
    var observers: [SKPaymentTransactionObserver] = []

    func paymentQueue(
        _ queue: SKPaymentQueue,
        updatedTransactions transactions: [SKPaymentTransaction]
    ) {
        var current: [SKPaymentTransaction] = []

        // Ensure that the current transaction is unique to avoid bugs when two purchases occupy the same memory

        for transaction in transactions {
            for purchase in purchases {
                if purchase === transaction {
                    return
                }
            }

            current.append(transaction)
            purchases.append(transaction)
        }

        for observer in observers {
            observer.paymentQueue(queue, updatedTransactions: current)
        }
    }

    // MARK: Private

    private var purchases: [SKPaymentTransaction] = []
}
