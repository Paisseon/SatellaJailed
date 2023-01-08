import Jinx
import StoreKit

struct AddTransactionObserver: Hook {
    typealias T = @convention(c) (
        SKPaymentQueue,
        Selector,
        SKPaymentTransactionObserver
    ) -> Void

    let `class`: AnyClass? = SKPaymentQueue.self
    let selector: Selector = sel_registerName("addTransactionObserver:")
    let replacement: T = { target, cmd, observer in
        let orig: T = PowPow.orig(AddTransactionObserver.self)!
        let tella: SatellaObserver = .shared
        
        tella.observers.append(observer)
        orig(target, cmd, tella)
    }
}
