import UIKit

@available(iOS 15, *)
final class SatellaShape: UIView {
    override func draw(_ rect: CGRect) {
        let size: CGSize = rect.size
        let trSparkPath: UIBezierPath = .init()
        let brSparkPath: UIBezierPath = .init()
        let tlSparkPath: UIBezierPath = .init()
        let blSparkPath: UIBezierPath = .init()
        let starPath: UIBezierPath = .init()
        
        trSparkPath.move(to: CGPoint(x: size.width * 0.705, y: size.height * 0.295))
        trSparkPath.addLine(to: CGPoint(x: size.width * 0.655, y: size.height * 0.195))
        trSparkPath.addLine(to: CGPoint(x: size.width * 0.955, y: size.height * 0.045))
        trSparkPath.addCurve(to: CGPoint(x: size.width * 0.805, y: size.height * 0.355), controlPoint1: CGPoint(x: size.width * 0.955, y: size.height * 0.045), controlPoint2: CGPoint(x: size.width * 0.805, y: size.height * 0.365))
        trSparkPath.addCurve(to: CGPoint(x: size.width * 0.705, y: size.height * 0.295), controlPoint1: CGPoint(x: size.width * 0.805, y: size.height * 0.345), controlPoint2: CGPoint(x: size.width * 0.705, y: size.height * 0.295))
        trSparkPath.close()
        trSparkPath.fill()

        brSparkPath.move(to: CGPoint(x: size.width * 0.705, y: size.height * 0.705))
        brSparkPath.addLine(to: CGPoint(x: size.width * 0.655, y: size.height * 0.805))
        brSparkPath.addLine(to: CGPoint(x: size.width * 0.955, y: size.height * 0.955))
        brSparkPath.addCurve(to: CGPoint(x: size.width * 0.805, y: size.height * 0.645), controlPoint1: CGPoint(x: size.width * 0.955, y: size.height * 0.955), controlPoint2: CGPoint(x: size.width * 0.805, y: size.height * 0.645))
        brSparkPath.addCurve(to: CGPoint(x: size.width * 0.705, y: size.height * 0.705), controlPoint1: CGPoint(x: size.width * 0.805, y: size.height * 0.655), controlPoint2: CGPoint(x: size.width * 0.705, y: size.height * 0.705))
        brSparkPath.close()
        brSparkPath.fill()

        tlSparkPath.move(to: CGPoint(x: size.width * 0.315, y: size.height * 0.295))
        tlSparkPath.addLine(to: CGPoint(x: size.width * 0.365, y: size.height * 0.195))
        tlSparkPath.addLine(to: CGPoint(x: size.width * 0.065, y: size.height * 0.045))
        tlSparkPath.addCurve(to: CGPoint(x: size.width * 0.215, y: size.height * 0.355), controlPoint1: CGPoint(x: size.width * 0.065, y: size.height * 0.045), controlPoint2: CGPoint(x: size.width * 0.215, y: size.height * 0.365))
        tlSparkPath.addCurve(to: CGPoint(x: size.width * 0.315, y: size.height * 0.295), controlPoint1: CGPoint(x: size.width * 0.215, y: size.height * 0.345), controlPoint2: CGPoint(x: size.width * 0.315, y: size.height * 0.295))
        tlSparkPath.close()
        tlSparkPath.fill()

        blSparkPath.move(to: CGPoint(x: size.width * 0.315, y: size.height * 0.705))
        blSparkPath.addLine(to: CGPoint(x: size.width * 0.365, y: size.height * 0.805))
        blSparkPath.addLine(to: CGPoint(x: size.width * 0.065, y: size.height * 0.955))
        blSparkPath.addCurve(to: CGPoint(x: size.width * 0.215, y: size.height * 0.645), controlPoint1: CGPoint(x: size.width * 0.065, y: size.height * 0.955), controlPoint2: CGPoint(x: size.width * 0.215, y: size.height * 0.645))
        blSparkPath.addCurve(to: CGPoint(x: size.width * 0.315, y: size.height * 0.705), controlPoint1: CGPoint(x: size.width * 0.215, y: size.height * 0.655), controlPoint2: CGPoint(x: size.width * 0.315, y: size.height * 0.705))
        blSparkPath.close()
        blSparkPath.fill()

        starPath.move(to: CGPoint(x: size.width * 0.515, y: size.height * 0.000))
        starPath.addLine(to: CGPoint(x: size.width * 0.655, y: size.height * 0.345))
        starPath.addLine(to: CGPoint(x: size.width * 1.005, y: size.height * 0.495))
        starPath.addLine(to: CGPoint(x: size.width * 0.655, y: size.height * 0.645))
        starPath.addLine(to: CGPoint(x: size.width * 0.505, y: size.height * 0.995))
        starPath.addLine(to: CGPoint(x: size.width * 0.355, y: size.height * 0.645))
        starPath.addLine(to: CGPoint(x: size.width * 0.005, y: size.height * 0.495))
        starPath.addLine(to: CGPoint(x: size.width * 0.355, y: size.height * 0.345))
        starPath.addLine(to: CGPoint(x: size.width * 0.515, y: size.height * 0.000))
        starPath.fill()
    }
}
