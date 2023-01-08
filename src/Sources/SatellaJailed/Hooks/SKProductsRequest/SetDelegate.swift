import Jinx
import StoreKit

@available(iOS 13, *)
struct SetDelegate: Hook {
    typealias T = @convention(c) (
        SKProductsRequest,
        Selector,
        SKProductsRequestDelegate
    ) -> Void

    let `class`: AnyClass? = SKProductsRequest.self
    let selector: Selector = #selector(setter: SKProductsRequest.delegate)
    let replacement: T = { target, cmd, delegate in
        let orig: T = PowPow.orig(SetDelegate.self)!
        let tella: SatellaDelegate = .shared
        
        tella.delegates.append(delegate)
        orig(target, cmd, tella)
    }
}

