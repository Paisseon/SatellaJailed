import UIKit

struct ReceiptGenerator {
    static func generateReceipt(
        for productID: String?
    ) -> Receipt {
        let now: Int64 = Int64(Date().timeIntervalSince1970) * 1000
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "69"
        let receiptID: Int = Int.random(in: 1...0x7151129)
        let adamID: Int64 = Int64.random(in: 1...0x7151129)
        let bundleID: String = Bundle.main.bundleIdentifier ?? "emt.paisseon.satella"
        let transID: String = UUID().uuidString
        let nowDate: String = "\(Date()) Europe/Copenhagen"
        let expDate: String = "\(Date(timeIntervalSince1970: 0xf2a52380)) Europe/Copenhagen"
        let expNow: Int64 = 0xf2a52380 * 1000
        
        let info: ReceiptInfo = .init(
            quantity: "1",
            productId: productID ?? bundleID,
            transactionId: transID,
            originalTransactionId: transID,
            purchaseDate: nowDate,
            purchaseDateMs: now.description,
            purchaseDatePst: nowDate,
            originalPurchaseDate: nowDate,
            originalPurchaseDateMs: nowDate,
            originalPurchaseDatePst: nowDate,
            expiresDate: expDate,
            expiresDateMs: expNow.description,
            expiresDatePst: expDate,
            isTrialPeriod: "false",
            isInIntroOfferPeriod: "false"
        )
        
        let receipt: Receipt = .init(
            receiptType: "Production",
            adamId: adamID,
            appItemId: adamID,
            bundleId: bundleID,
            applicationVersion: version,
            downloadId: receiptID,
            versionExternalIdentifier: 0,
            receiptCreationDate: nowDate,
            receiptCreationDateMs: now.description,
            receiptCreationDatePst: nowDate,
            requestDate: nowDate,
            requestDateMs: now.description,
            requestDatePst: nowDate,
            originalPurchaseDate: nowDate,
            originalPurchaseDateMs: now.description,
            originalPurchaseDatePst: nowDate,
            originalApplicationVersion: version,
            inApp: [info]
        )
        
        return receipt
    }
    
    static func generateResponse() -> Data? {
        let receipt: Receipt = generateReceipt(for: currentProductID)
        let encoder: JSONEncoder = .init()
        var base64: String = ""
        let productId: String = currentProductID ?? "emt.paisseon.satella.product"
        
        do {
            let receiptData: Data = try encoder.encode(receipt)
            base64 = receiptData.base64EncodedString()
        } catch {
            return nil
        }
        
        let renewal: RenewalInfo = .init(
            autoRenewProductId: productId,
            originalTransactionId: UUID().uuidString,
            productId: productId,
            autoRenewStatus: "1"
        )
        
        let response: ReceiptResponse = .init(
            status: 0,
            environment: "Production",
            receipt: receipt,
            latestReceiptInfo: receipt.inApp,
            lastReceipt: base64,
            pendingRenewalInfo: [renewal]
        )
        
        do {
            let responseData: Data = try encoder.encode(response)
            return responseData
        } catch {
            return nil
        }
    }
}
