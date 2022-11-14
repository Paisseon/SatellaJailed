import StoreKit

struct MatchingIdentifier: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> String

    let `class`: AnyClass = SKPaymentTransaction.self
    let selector: Selector = sel_registerName("matchingIdentifier")
    let replacement: T = { _, _ in
        UUID().uuidString
    }
}
