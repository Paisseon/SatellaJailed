import StoreKit

@available(iOS 13, *)
struct SetDelegate: Hook {
    typealias T = @convention(c) (
        SKProductsRequest,
        Selector,
        SKProductsRequestDelegate
    ) -> Void

    let `class`: AnyClass = SKProductsRequest.self
    let selector: Selector = #selector(setter: SKProductsRequest.delegate)
    let replacement: T = { `self`, cmd, delegate in
        let orig: T = PowPow.unwrap(SetDelegate.self)!
        let tella: SatellaDelegate = .shared
        
        tella.delegates.append(delegate)
        orig(`self`, cmd, tella)
    }
}

