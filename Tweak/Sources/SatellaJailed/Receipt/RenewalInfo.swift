struct RenewalInfo: Encodable {
    let autoRenewProductID: String
    let originalTransactionID: String
    let productID: String
    let autoRenewStatus: String
    
    enum CodingKeys: String, CodingKey {
        case autoRenewProductID = "auto_renew_product_id"
        case originalTransactionID = "original_transaction_id"
        case productID = "product_id"
        case autoRenewStatus = "auto_renew_status"
    }
}
