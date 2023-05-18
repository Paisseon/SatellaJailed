struct Receipt: Encodable {
    let receiptType: String
    let adamID: Int64
    let appItemID: Int64
    let bundleID: String
    let applicationVersion: String
    let downloadID: Int
    let versionExternalIDentifier: Int
    let receiptCreationDate: String
    let receiptCreationDateMs: String
    let receiptCreationDatePst: String
    let requestDate: String
    let requestDateMs: String
    let requestDatePst: String
    let originalPurchaseDate: String
    let originalPurchaseDateMs: String
    let originalPurchaseDatePst: String
    let originalApplicationVersion: String
    let inApp: [ReceiptInfo]
    
    enum CodingKeys: String, CodingKey {
        case receiptType = "receipt_type"
        case adamID = "adam_id"
        case appItemID = "app_item_id"
        case bundleID = "bundle_id"
        case applicationVersion = "application_version"
        case downloadID = "download_id"
        case versionExternalIDentifier = "version_external_identifier"
        case receiptCreationDate = "receipt_creation_date"
        case receiptCreationDateMs = "receipt_creation_date_ms"
        case receiptCreationDatePst = "receipt_creation_date_pst"
        case requestDate = "request_date"
        case requestDateMs = "request_date_ms"
        case requestDatePst = "request_date_pst"
        case originalPurchaseDate = "original_purchase_date"
        case originalPurchaseDateMs = "original_purchase_date_ms"
        case originalPurchaseDatePst = "original_purchase_date_pst"
        case originalApplicationVersion = "original_application_version"
        case inApp = "in_app"
    }
}
