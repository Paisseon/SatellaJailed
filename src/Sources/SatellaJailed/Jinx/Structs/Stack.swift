import Foundation

struct Stack<T, U> {
    private var items: [String: T?] = [:]
    
    mutating func push(
        _ key: U,
        _ item: T?
    ) {
        if items["\(key)"] == nil {
            items["\(key)"] = item
        }
    }
    
    func pop(
        _ key: U
    ) -> T? {
        if let val: T? = items["\(key)"] {
            return val
        }
        
        return nil
    }
}

var hndlStack: Stack<UnsafeMutableRawPointer, String> = .init()
var impStack: Stack<IMP, Any.Type> = .init()
var voidStack: Stack<UnsafeMutableRawPointer, Any.Type> = .init()
