import SwiftUI
import UIKit

@available(iOS 14, *)
final class SatellaViewController: UIViewController {
    static let shared: SatellaViewController = .init()

    var model: SatellaViewModel = .init()
    var host: UIView = .init()
    var windows: [UIWindow] = []

    override func loadView() {
        view = PassthroughView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size: CGSize = UIScreen.main.bounds.size
        let geoX: Double = size.width * 0.85
        let geoY: Double = size.height * 0.5
        
        view.frame = CGRect(
            x: 0,
            y: 0,
            width: Int(size.width),
            height: Int(size.height)
        )
        
        let tellaVC: UIHostingController = .init(
            rootView: SatellaView(model: self.model)
        )
        let tapGest: UITapGestureRecognizer = .init(
            target: self,
            action: #selector(handleTap)
        )
        let panGest: UIPanGestureRecognizer = .init(
            target: self,
            action: #selector(handlePan)
        )
        
        host = UIView(
            frame: CGRect(
                x: geoX,
                y: geoY,
                width: 80,
                height: 80
            )
        )
        
        tellaVC.view.frame = CGRect(
            x: 0,
            y: 0,
            width: 80,
            height: 80
        )
        
        tellaVC.view.backgroundColor = .clear
        host.backgroundColor = .clear
        
        host.addGestureRecognizer(tapGest)
        host.addGestureRecognizer(panGest)
        
        host.addSubview(tellaVC.view)
        view.addSubview(host)
        
        IPC.shared.observe("tella.hideUntilNextLaunch") { _ in
            self.host.removeFromSuperview()
        }
    }
    
    @objc func handleTap() {
        model.isShowing.toggle()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        host.center = gesture.location(in: view)
    }
}
