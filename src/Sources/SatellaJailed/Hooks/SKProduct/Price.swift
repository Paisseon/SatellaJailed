import StoreKit

struct Price: Hook {
    typealias T = @convention(c) (
        SKProduct,
        Selector
    ) -> NSDecimalNumber

    let `class`: AnyClass = SKProduct.self
    let selector: Selector = #selector(getter: SKProduct.price)
    let replacement: T = { _, _ in
        0.00
    }
}

