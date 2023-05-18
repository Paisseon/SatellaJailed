import Jinx
import StoreKit

struct ReceiptHook: Hook {
    typealias T = @convention(c) (SKPaymentTransaction, Selector) -> Data

    let cls: AnyClass? = SKPaymentTransaction.self
    let sel: Selector = sel_registerName("transactionReceipt")
    let replace: T = { obj, _ in
        let receipt: OldReceipt = ReceiptGenerator.old(for: obj.payment.productIdentifier)
        let data: Data = (try? JSONEncoder().encode(receipt)) ?? Data()
        
        return data
    }
}

