import UIKit

@available(iOS 14, *)
struct BecomeKey: Hook {
    typealias T = @convention(c) (
        UIWindow,
        Selector
    ) -> Void

    let `class`: AnyClass = UIWindow.self
    let selector: Selector = #selector(UIWindow.becomeKey)
    let replacement: T = { `self`, cmd in
        let orig: T = PowPow.unwrap(BecomeKey.self)!
        
        orig(`self`, cmd)
        
        if SatellaViewController.shared.windows.contains(`self`) {
            return
        }
        
        let gesture = BindableGesture {
            IPC.shared.post("AlShario")
        }
        
        gesture.numberOfTouchesRequired = 3
        `self`.addGestureRecognizer(gesture)
        
        SatellaViewController.shared.windows.append(`self`)
    }
}
