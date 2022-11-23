struct RenewalInfo: Encodable {
    let autoRenewProductId: String
    let originalTransactionId: String
    let productId: String
    let autoRenewStatus: String
    
    enum CodingKeys: String, CodingKey {
        case autoRenewProductId = "auto_renew_product_id"
        case originalTransactionId = "original_transaction_id"
        case productId = "product_id"
        case autoRenewStatus = "auto_renew_status"
    }
}
