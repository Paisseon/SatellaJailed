import SatellaJailedC
import StoreKit

final class SatellaDelegate: NSObject, SKProductsRequestDelegate {
    // MARK: Lifecycle

    override private init() {
        super.init()
    }

    // MARK: Public

    public var delegates: [SKProductsRequestDelegate] = []

    // MARK: Internal

    static let shared: SatellaDelegate = .init()

    func productsRequest(
        _ request: SKProductsRequest,
        didReceive response: SKProductsResponse
    ) {
        // If the response contains products, the app is not sideloaded, so we should treat it normally
        
        if !response.products.isEmpty {
            for delegate in delegates {
                delegate.productsRequest(request, didReceive: response)
            }
            
            return
        }
        
        // Get the list of identifier names
        
        let internalRequest: Any? = request
            .value(forKey: "_productsRequestInternal")
        let internalIdentifiers: Set<String> = (internalRequest as? NSObject)?
            .value(forKey: "_productIdentifiers") as! Set<String>
        let identifiers: [String] = Array(internalIdentifiers)
        
        // Create an SKProduct for each identifier
        
        var products: [SKProduct] = []
        
        for identifier in identifiers {
            let locale = Locale(identifier: "da_DK")
            let product = SKProduct()
            
            product._setPrice(0.00)
            product._setPriceLocale(locale)
            product._setProductIdentifier(identifier)
            product._setLocalizedDescription(identifier)
            product._setLocalizedTitle("\(identifier)")
            
            products.append(product)
        }
        
        // Send an array of fake products to the real delegate, then clear the local array
        
        let fakeResponse = SKProductsResponse()
        
        fakeResponse._setProducts(products)
        
        for delegate in delegates {
            delegate.productsRequest(request, didReceive: fakeResponse)
        }
    }
}

