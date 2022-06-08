import SatellaC
import StoreKit

class SatellaDelegate: NSObject, SKProductsRequestDelegate {
	static let shared                               = SatellaDelegate()
    
	public var delegate: SKProductsRequestDelegate? = nil           // the real delegate used by the app
	private var products                            = [SKProduct]() // list of abstractions for products
	
	func productsRequest(_ arg0: SKProductsRequest, didReceive arg1: SKProductsResponse) {
		if arg1.products.count > 0 {
			delegate?.productsRequest(arg0, didReceive: arg1)       // if we are not in a sideloaded app, use the normal response
			return
		}
		
		let response           = SKProductsResponse()               // create an empty response
		let productIdentifiers = productIdentifiers(arg0)           // get the identifiers used by the app (see Tweak.h)
		
		guard let productIdentifiers = productIdentifiers else {
			return
		}
		
		for identifier in productIdentifiers {                      // create an abstraction for each real product
			let locale  = Locale(identifier: "da_DK")               // price says 0 always, locale doesn't matter except for crash fixing
			let product = SKProduct()
            
			product._setPrice(0)
			product._setPriceLocale(locale)
			product._setProductIdentifier(identifier)
			product._setLocalizedDescription(identifier)
			product._setLocalizedTitle(identifier)
			
			products.append(product)                                // add to our hacked product list
		}
		
		response._setProducts(products)                             // fill the response with hacked products
		delegate?.productsRequest(arg0, didReceive: response)       // and send it to the app, which will now think it has connected to iTunes
	}
	
	private override init() {
		super.init()
	}
}