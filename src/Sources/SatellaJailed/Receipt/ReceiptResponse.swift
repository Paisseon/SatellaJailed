struct ReceiptResponse: Encodable {
    let status: Int
    let environment: String
    let receipt: Receipt
    let latestReceiptInfo: [ReceiptInfo]
    let lastReceipt: String
    let pendingRenewalInfo: [RenewalInfo]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case environment = "environment"
        case receipt = "receipt"
        case latestReceiptInfo = "latest_receipt_info"
        case lastReceipt = "latest_receipt"
        case pendingRenewalInfo = "pending_renewal_info"
    }
}
