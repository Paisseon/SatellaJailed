import StoreKit

struct AddTransactionObserver: Hook {
    typealias T = @convention(c) (
        SKPaymentQueue,
        Selector,
        SKPaymentTransactionObserver
    ) -> Void

    let `class`: AnyClass = SKPaymentQueue.self
    let selector: Selector = sel_registerName("addTransactionObserver:")
    let replacement: T = { `self`, cmd, observer in
        let orig: T = PowPow.unwrap(AddTransactionObserver.self)!
        let tella: SatellaObserver = .shared
        
        tella.observers.append(observer)
        orig(`self`, cmd, tella)
    }
}
