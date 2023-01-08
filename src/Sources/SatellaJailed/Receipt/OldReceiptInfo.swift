struct OldReceiptInfo: Encodable {
    let appItemID: String
    let bundleID: String
    let bundleVersion: String
    let externalVersion: String
    let itemID: String
    let originalPurchaseDate: String
    let originalPurchaseDateMs: String
    let originalPurchaseDatePst: String
    let originalTransactionID: String
    let productID: String
    let purchaseDate: String
    let purchaseDateMs: String
    let purchaseDatePst: String
    let quantity: String
    let transactionID: String
    let uniqueID: String
    let uniqueVendorID: String
    
    enum CodingKeys: String, CodingKey {
        case appItemID = "app-item-id"
        case bundleID = "bid"
        case bundleVersion = "bvrs"
        case externalVersion = "version-external-identifier"
        case itemID = "item-id"
        case originalPurchaseDate = "original-purchase-date"
        case originalPurchaseDateMs = "original-purchase-date-ms"
        case originalPurchaseDatePst = "original-purchase-date-pst"
        case originalTransactionID = "original-transaction-id"
        case productID = "product-id"
        case purchaseDate = "purchase-date"
        case purchaseDateMs = "purchase-date-ms"
        case purchaseDatePst = "purchase-date-pst"
        case quantity
        case transactionID = "transaction-id"
        case uniqueID = "unique-identifier"
        case uniqueVendorID = "unique-vendor-identifier"
    }
}
