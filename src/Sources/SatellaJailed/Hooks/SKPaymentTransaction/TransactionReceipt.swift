import StoreKit

var currentProductID: String? = nil

struct TransactionReceipt: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> Data?

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = sel_registerName("transactionReceipt")
    let replacement: T = { `self`, _ in
        let receipt: Receipt = ReceiptGenerator.generateReceipt(
            for: `self`.payment.productIdentifier
        )
        
        let encoder: JSONEncoder = .init()
        currentProductID = `self`.payment.productIdentifier
        
        do {
            let receiptData: Data = try encoder.encode(receipt)
            return receiptData
        } catch {
            return nil
        }
    }
}

