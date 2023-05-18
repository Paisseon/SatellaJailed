import Jinx
import StoreKit

struct ProductHook: Hook {
    typealias T = @convention(c) (AnyObject, Selector) -> NSDecimalNumber

    let cls: AnyClass? = SKProduct.self
    let sel: Selector = #selector(getter: SKProduct.price)
    let replace: T = { _, _ in 0.01 }
}

