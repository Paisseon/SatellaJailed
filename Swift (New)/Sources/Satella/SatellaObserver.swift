import SatellaC
import StoreKit

class SatellaObserver: NSObject, SKPaymentTransactionObserver {
	static let shared = SatellaObserver()
	
	public var observer: SKPaymentTransactionObserver? = nil                      // real observer used by the app
	private var purchases                              = [SKPaymentTransaction]() // list of fake purchases made
	
	func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
		for transaction in transactions {                                         // loop through new transactions
			for purchase in purchases {                                           // loop through existing purchases
				if purchase === transaction {		                              // block duplicate transactions by checking memory addresses
					return
				}
			}
			
			switch transaction.transactionState {                                // check each possible state 
				case .purchased:
					purchases.append(transaction)                                // if the transaction is already marked as purchased, add it to 																					the list of purchases
					queue.finishTransaction(transaction)                         // tell the queue to finish processing this transaction
				case .restored:
					if let origTrans = transaction.original {                    // get the original transaction
						purchases.append(origTrans)                              // add it to the list of purchases
						queue.finishTransaction(transaction)                     // mark transaction as having completed
					} else {                                                     // if we can't find the original transaction for whatever reason, 																					just use the default response
						transaction._setTransactionState(.purchased)             // set the code as purchased
						transaction._setError(nil)                               // set the error as nil
						purchases.append(transaction)                            // add to the list
						queue.finishTransaction(transaction)                     // mark transaction as having completed
					}
				default:                                                         // handles all other states with the same code as the else-block 																						in .restored
					transaction._setTransactionState(.purchased)
					transaction._setError(nil)
					purchases.append(transaction)
					queue.finishTransaction(transaction)                         // mark transaction as having completed
			}
		}
		
		observer?.paymentQueue(queue, updatedTransactions: purchases)           // send our hacked list of purchases to the original observer
	}
	
	private override init() {
		super.init()                                                            // this is just overridden to make a proper singleton
	}
}