struct OldReceipt: Encodable {
    let signature: String
    let purchaseInfo: OldReceiptInfo
    let pod: String
    let signingStatus: String
    
    enum CodingKeys: String, CodingKey {
        case signature, pod
        case purchaseInfo = "purchase-info"
        case signingStatus = "signing-status"
    }
}
