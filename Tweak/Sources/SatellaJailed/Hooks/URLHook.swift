import Foundation
import Jinx

struct URLHook: Hook {
    typealias URLHandler = @Sendable (Data?, URLResponse?, Error?) -> Void
    typealias T = @convention(c) (URLSession, Selector, URLRequest, @escaping (URLHandler)) -> URLSessionDataTask

    let cls: AnyClass? = URLSession.self
    let sel: Selector = sel_registerName("dataTaskWithRequest:completionHandler:")
    let replace: T = { obj, sel, request, handler in
        if request.url?.absoluteString.hasSuffix("/verifyReceipt") == true {
            let newHandler: URLHandler = { (_, response, error) in
                let data: Data? = ReceiptGenerator.response(for: SatellaDelegate.shared.products.last?.productIdentifier ?? "")
                handler(data, response, error)
            }

            return orig(obj, sel, request, newHandler)
        }

        return orig(obj, sel, request, handler)
    }
}
