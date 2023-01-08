import StoreKit

final class SatellaDelegate: NSObject, SKProductsRequestDelegate {
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
        
        let internalRequest: NSObject? = request.value(forKey: "_productsRequestInternal") as? NSObject
        let internalIdentifiers: Set<String>? = internalRequest?.value(forKey: "_productIdentifiers") as? Set<String>
        let identifiers: [String] = Array(internalIdentifiers ?? [])
        
        // Create an SKProduct for each identifier
        
        var products: [SKProduct] = []
        
        for identifier in identifiers {
            let locale: Locale = .init(identifier: "da_DK")
            let product: SKProduct = .init()
            let price: NSDecimalNumber = 0.01
            
            product.setValue(price, forKey: "price")
            product.setValue(locale, forKey: "priceLocale")
            product.setValue(identifier, forKey: "productIdentifier")
            product.setValue(identifier, forKey: "localizedDescription")
            product.setValue(identifier, forKey: "localizedTitle")
            
            products.append(product)
        }
        
        // Send an array of fake products to the real delegate, then clear the local array
        
        let fakeResponse: SKProductsResponse = .init()
        fakeResponse.setValue(products, forKey: "products")
        
        for delegate in delegates {
            delegate.productsRequest(request, didReceive: fakeResponse)
        }
    }
}
