import UIKit

// Window on which to host SatellaVC

@available(iOS 14, *)
final class SatellaWindow: UIWindow {
    static let shared = SatellaWindow(frame: UIScreen.main.bounds)
    
    private var model = SatellaVM()
    private var host  = UIView()
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// Prevent touches from being blocked, except when PreferencesView 
    /// is presented or the button is being dragged/pressed
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let controller: SatellaVC = rootViewController as! SatellaVC
        let viewRect: CGRect      = controller.host.frame
        
        return viewRect.contains(point) || controller.model.isShowing
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let rootVC = SatellaVC.shared
        rootVC.view.backgroundColor = UIColor.clear
        self.rootViewController = rootVC
    }
}
