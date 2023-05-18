import Jinx
import UIKit

@available(iOS 15, *)
struct WindowHook: Hook {
    typealias T = @convention(c) (UIWindow, Selector) -> Void
    
    let cls: AnyClass? = UIWindow.self
    let sel: Selector = #selector(UIWindow.becomeKey)
    let replace: T = { obj, sel in
        orig(obj, sel)
        
        guard !SatellaController.shared.windows.contains(obj) else {
            return
        }
        
        let gesture = BindableGesture {
            guard !Preferences.isHidden else {
                return
            }
            
            let rootVC: UIViewController? = obj.windowScene?.windows.first(where: { $0.isKeyWindow })?.rootViewController
            rootVC?.add(SatellaController.shared)
        }
        
        gesture.numberOfTouchesRequired = 3
        obj.addGestureRecognizer(gesture)
        
        SatellaController.shared.windows.append(obj)
    }
}
