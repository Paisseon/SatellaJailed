import SatellaC
import StoreKit

class SatellaDelegate: NSObject, SKProductsRequestDelegate {
    static let shared    = SatellaDelegate()
    
    public var delegates = [SKProductsRequestDelegate]()
    private var products = [SKProduct]()
    
    func productsRequest(_ arg0: SKProductsRequest, didReceive arg1: SKProductsResponse) {
        
        // If the products is not empty, that means the app is not sideloaded so we should just let iOS handle it normally
        
        if arg1.products.count > 0 {
            for delegate in delegates {
                delegate.productsRequest(arg0, didReceive: arg1)
            }
            
            return
        }
        
        // Create a blank response and a list of identifier names. Refer to SatellaC/include/Tweak.h
        
        let response           = SKProductsResponse()
        let productIdentifiers = productIdentifiers(arg0)
        
        guard let productIdentifiers = productIdentifiers else {
            return
        }
        
        // Create an actual SKProduct for each identifier code
        
        for identifier in productIdentifiers {
            let locale  = Locale(identifier: "da_DK")
            let product = SKProduct()
            
            product._setPrice(0)
            product._setPriceLocale(locale)
            product._setProductIdentifier(identifier)
            product._setLocalizedDescription(identifier)
            product._setLocalizedTitle(identifier)
            
            products.append(product)
        }
        
        // Send the list of product abstractions to the app
        
        response._setProducts(products)
        
        for delegate in delegates {
            delegate.productsRequest(arg0, didReceive: response)
        }
    }
    
    private override init() {
        super.init()
    }
}