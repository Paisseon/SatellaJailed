import Jinx
import StoreKit

struct DelegateHook: Hook {
    typealias T = @convention(c) (AnyObject, Selector, SKProductsRequestDelegate) -> Void

    let cls: AnyClass? = SKProductsRequest.self
    let sel: Selector = sel_registerName("setDelegate:")
    let replace: T = { obj, sel, delegate in
        let tella: SatellaDelegate = .shared
        tella.delegates.append(delegate)
        orig(obj, sel, tella)
    }
}

