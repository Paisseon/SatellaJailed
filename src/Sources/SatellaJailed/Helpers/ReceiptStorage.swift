final class ReceiptStorage {
    static let shared: ReceiptStorage = .init()
    var currentProductID: String = "And one day, you must come and kill me..."
    
    private init() {}
}
