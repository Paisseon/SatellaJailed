struct ReceiptInfo: Encodable {
    let quantity: String
    let productId: String
    let transactionId: String
    let originalTransactionId: String
    let purchaseDate: String
    let purchaseDateMs: String
    let purchaseDatePst: String
    let originalPurchaseDate: String
    let originalPurchaseDateMs: String
    let originalPurchaseDatePst: String
    let expiresDate: String
    let expiresDateMs: String
    let expiresDatePst: String
    let isTrialPeriod: String
    let isInIntroOfferPeriod: String
    
    enum CodingKeys: String, CodingKey {
        case quantity = "quantity"
        case productId = "product_id"
        case transactionId = "transaction_id"
        case originalTransactionId = "original_transaction_id"
        case purchaseDate = "purchase_date"
        case purchaseDateMs = "purchase_date_ms"
        case purchaseDatePst = "purchase_date_pst"
        case originalPurchaseDate = "original_purchase_date"
        case originalPurchaseDateMs = "original_purchase_date_ms"
        case originalPurchaseDatePst = "original_purchase_date_pst"
        case expiresDate = "expires_date"
        case expiresDateMs = "expires_date_ms"
        case expiresDatePst = "expires_date_pst"
        case isTrialPeriod = "is_trial_period"
        case isInIntroOfferPeriod = "is_in_intro_offer_period"
    }
    
}
