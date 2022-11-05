import UIKit

@available(iOS 14, *)
final class PassthroughView: UIView {
    override func hitTest(
        _ point: CGPoint,
        with event: UIEvent?
    ) -> UIView? {
        let view: UIView? = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
