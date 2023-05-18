import StoreKit

final class SatellaObserver: NSObject, SKPaymentTransactionObserver {
    static let shared: SatellaObserver = .init()
    var observers: [SKPaymentTransactionObserver] = []

    func paymentQueue(
        _ queue: SKPaymentQueue,
        updatedTransactions transactions: [SKPaymentTransaction]
    ) {
        var current: [SKPaymentTransaction] = []
        
        // Prevent multiple purchases from occupying the same memory (fix some crash)
        
        for transaction in transactions {
            guard purchases.first(where: { $0 === transaction }) == nil else { return }
            current.append(transaction)
            purchases.append(transaction)
        }

        _ = observers.map { $0.paymentQueue(queue, updatedTransactions: current) }
    }

    private var purchases: [SKPaymentTransaction] = []
}
