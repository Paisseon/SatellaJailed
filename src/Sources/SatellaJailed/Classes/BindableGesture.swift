import UIKit

final class BindableGesture: UITapGestureRecognizer {
    private var action: () -> Void
    
    init(
        action: @escaping () -> Void
    ) {
        self.action = action
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(execute))
    }
    
    @objc private func execute() {
        action()
    }
}
