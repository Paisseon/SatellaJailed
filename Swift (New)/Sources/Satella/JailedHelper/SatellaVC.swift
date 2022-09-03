import Combine
import SwiftUI
import UIKit

// Present the floating SatellaView on SatellaWindow and handle gestures

@available(iOS 14, *)
final class SatellaVC: UIViewController {
    static let shared = SatellaVC()
    
    public var model = SatellaVM()
    public var host  = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoX    = UIScreen.main.bounds.size.width * 0.85
        let geoY    = UIScreen.main.bounds.size.height / 2
        
        let tellaVC = UIHostingController(rootView: SatellaView(model: self.model))
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan))
        host        = UIView(frame: CGRect(x: geoX, y: geoY, width: 80, height: 80))
        
        tellaVC.view.frame           = CGRect(x: 0, y: 0, width: 80, height: 80)
        tellaVC.view.backgroundColor = UIColor.clear
        host.backgroundColor         = UIColor.clear
        
        host.addGestureRecognizer(tapGest)
        host.addGestureRecognizer(panGest)
        
        host.addSubview(tellaVC.view)
        view.addSubview(host)
        
        IPC.shared.observe("tella.hideUntilNextLaunch") { name in
            self.host.removeFromSuperview()
        }
    }
    
    @objc func handleTap() {
        self.model.isShowing.toggle()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        self.host.center = gesture.location(in: self.view)
    }
}
