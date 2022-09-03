import SatellaC
import StoreKit

class SatellaObserver: NSObject, SKPaymentTransactionObserver {
    static let shared     = SatellaObserver()
    
    public var observers  = [SKPaymentTransactionObserver]()
    private var purchases = [SKPaymentTransaction]()
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        var current = [SKPaymentTransaction]()
        
        // Ensure that there are no duplicate purchases (i.e., purchases occupying the same memory)
        
        for transaction in transactions {
            for purchase in purchases {
                if purchase === transaction {
                    return
                }
            }
            
            purchases.append(transaction)
            current.append(transaction)
        }
        
        // Send the hacked list of purchases to the original payment queue for the app to process
        
        for observer in observers {
            observer.paymentQueue(queue, updatedTransactions: current)
        }
    }
    
    private override init() {
        super.init()
    }
}