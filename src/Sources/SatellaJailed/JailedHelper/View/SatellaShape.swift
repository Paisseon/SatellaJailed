import SwiftUI

// Good luck figuring out whatever the fuck this is

@available(iOS 14, *)
struct SatellaShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX + 178.05, y: rect.minY + 60.88))
        path.addCurve(to: CGPoint(x: rect.minX + 157.05, y: rect.minY + 122.8), control1: CGPoint(x: rect.minX + 166.66, y: rect.minY + 94.63), control2: CGPoint(x: rect.minX + 157.21, y: rect.minY + 122.5))
        path.addCurve(to: CGPoint(x: rect.minX + 124, y: rect.minY + 107.25), control1: CGPoint(x: rect.minX + 156.86, y: rect.minY + 123.15), control2: CGPoint(x: rect.minX + 144.52, y: rect.minY + 117.34))
        path.addCurve(to: CGPoint(x: rect.minX + 91.1, y: rect.minY + 91.27), control1: CGPoint(x: rect.minX + 105.99, y: rect.minY + 98.39), control2: CGPoint(x: rect.minX + 91.18, y: rect.minY + 91.2))
        path.addCurve(to: CGPoint(x: rect.minX + 107.23, y: rect.minY + 123.95), control1: CGPoint(x: rect.minX + 91.01, y: rect.minY + 91.33), control2: CGPoint(x: rect.minX + 98.27, y: rect.minY + 106.04))
        path.addCurve(to: CGPoint(x: rect.minX + 122.38, y: rect.minY + 156.93), control1: CGPoint(x: rect.minX + 122.93, y: rect.minY + 155.35), control2: CGPoint(x: rect.minX + 123.47, y: rect.minY + 156.53))
        path.addCurve(to: CGPoint(x: rect.minX + 60.62, y: rect.minY + 177.79), control1: CGPoint(x: rect.minX + 121.76, y: rect.minY + 157.15), control2: CGPoint(x: rect.minX + 93.97, y: rect.minY + 166.54))
        path.addCurve(to: CGPoint(x: rect.minX + 0, y: rect.minY + 198.5), control1: CGPoint(x: rect.minX + 27.28, y: rect.minY + 189.04), control2: CGPoint(x: rect.minX, y: rect.minY + 198.36))
        path.addCurve(to: CGPoint(x: rect.minX + 91.32, y: rect.minY + 229.6), control1: CGPoint(x: rect.minX + 0, y: rect.minY + 198.74), control2: CGPoint(x: rect.minX + 17.99, y: rect.minY + 204.86))
        path.addLine(to: CGPoint(x: rect.minX + 123.89, y: rect.minY + 240.59))
        path.addLine(to: CGPoint(x: rect.minX + 116.26, y: rect.minY + 256.17))
        path.addCurve(to: CGPoint(x: rect.minX + 100.1, y: rect.minY + 289.12), control1: CGPoint(x: rect.minX + 112.06, y: rect.minY + 264.74), control2: CGPoint(x: rect.minX + 104.79, y: rect.minY + 279.57))
        path.addCurve(to: CGPoint(x: rect.minX + 91.79, y: rect.minY + 306.5), control1: CGPoint(x: rect.minX + 95.41, y: rect.minY + 298.68), control2: CGPoint(x: rect.minX + 91.67, y: rect.minY + 306.5))
        path.addCurve(to: CGPoint(x: rect.minX + 124.51, y: rect.minY + 290.24), control1: CGPoint(x: rect.minX + 91.91, y: rect.minY + 306.5), control2: CGPoint(x: rect.minX + 106.63, y: rect.minY + 299.19))
        path.addCurve(to: CGPoint(x: rect.minX + 157.43, y: rect.minY + 275.12), control1: CGPoint(x: rect.minX + 155.86, y: rect.minY + 274.57), control2: CGPoint(x: rect.minX + 157.03, y: rect.minY + 274.03))
        path.addCurve(to: CGPoint(x: rect.minX + 178.04, y: rect.minY + 336.12), control1: CGPoint(x: rect.minX + 157.65, y: rect.minY + 275.74), control2: CGPoint(x: rect.minX + 166.93, y: rect.minY + 303.19))
        path.addCurve(to: CGPoint(x: rect.minX + 199, y: rect.minY + 396), control1: CGPoint(x: rect.minX + 192.87, y: rect.minY + 380.06), control2: CGPoint(x: rect.minX + 198.45, y: rect.minY + 396))
        path.addCurve(to: CGPoint(x: rect.minX + 220.2, y: rect.minY + 335.37), control1: CGPoint(x: rect.minX + 199.55, y: rect.minY + 396), control2: CGPoint(x: rect.minX + 205.21, y: rect.minY + 379.81))
        path.addCurve(to: CGPoint(x: rect.minX + 240.95, y: rect.minY + 274.2), control1: CGPoint(x: rect.minX + 231.45, y: rect.minY + 302.03), control2: CGPoint(x: rect.minX + 240.79, y: rect.minY + 274.5))
        path.addCurve(to: CGPoint(x: rect.minX + 274, y: rect.minY + 289.75), control1: CGPoint(x: rect.minX + 241.14, y: rect.minY + 273.86), control2: CGPoint(x: rect.minX + 253.58, y: rect.minY + 279.71))
        path.addCurve(to: CGPoint(x: rect.minX + 306.88, y: rect.minY + 305.75), control1: CGPoint(x: rect.minX + 292.01, y: rect.minY + 298.61), control2: CGPoint(x: rect.minX + 306.81, y: rect.minY + 305.81))
        path.addCurve(to: CGPoint(x: rect.minX + 290.98, y: rect.minY + 273.5), control1: CGPoint(x: rect.minX + 306.96, y: rect.minY + 305.69), control2: CGPoint(x: rect.minX + 299.8, y: rect.minY + 291.18))
        path.addCurve(to: CGPoint(x: rect.minX + 274.85, y: rect.minY + 240.89), control1: CGPoint(x: rect.minX + 282.17, y: rect.minY + 255.82), control2: CGPoint(x: rect.minX + 274.9, y: rect.minY + 241.14))
        path.addCurve(to: CGPoint(x: rect.minX + 317.5, y: rect.minY + 225.97), control1: CGPoint(x: rect.minX + 274.8, y: rect.minY + 240.63), control2: CGPoint(x: rect.minX + 293.99, y: rect.minY + 233.92))
        path.addCurve(to: CGPoint(x: rect.minX + 379.12, y: rect.minY + 205.13), control1: CGPoint(x: rect.minX + 341.01, y: rect.minY + 218.02), control2: CGPoint(x: rect.minX + 368.74, y: rect.minY + 208.64))
        path.addCurve(to: CGPoint(x: rect.minX + 398, y: rect.minY + 198.5), control1: CGPoint(x: rect.minX + 389.5, y: rect.minY + 201.62), control2: CGPoint(x: rect.minX + 397.99, y: rect.minY + 198.64))
        path.addCurve(to: CGPoint(x: rect.minX + 336.62, y: rect.minY + 177.54), control1: CGPoint(x: rect.minX + 398, y: rect.minY + 198.36), control2: CGPoint(x: rect.minX + 370.38, y: rect.minY + 188.93))
        path.addCurve(to: CGPoint(x: rect.minX + 274.69, y: rect.minY + 156.54), control1: CGPoint(x: rect.minX + 302.87, y: rect.minY + 166.16), control2: CGPoint(x: rect.minX + 275, y: rect.minY + 156.71))
        path.addCurve(to: CGPoint(x: rect.minX + 290.25, y: rect.minY + 123.5), control1: CGPoint(x: rect.minX + 274.34, y: rect.minY + 156.36), control2: CGPoint(x: rect.minX + 280.12, y: rect.minY + 144.09))
        path.addCurve(to: CGPoint(x: rect.minX + 306.21, y: rect.minY + 90.57), control1: CGPoint(x: rect.minX + 299.11, y: rect.minY + 105.49), control2: CGPoint(x: rect.minX + 306.29, y: rect.minY + 90.67))
        path.addCurve(to: CGPoint(x: rect.minX + 273.69, y: rect.minY + 106.71), control1: CGPoint(x: rect.minX + 306.13, y: rect.minY + 90.48), control2: CGPoint(x: rect.minX + 291.5, y: rect.minY + 97.74))
        path.addCurve(to: CGPoint(x: rect.minX + 240.98, y: rect.minY + 122.63), control1: CGPoint(x: rect.minX + 255.88, y: rect.minY + 115.68), control2: CGPoint(x: rect.minX + 241.16, y: rect.minY + 122.84))
        path.addCurve(to: CGPoint(x: rect.minX + 219.95, y: rect.minY + 60.88), control1: CGPoint(x: rect.minX + 240.8, y: rect.minY + 122.42), control2: CGPoint(x: rect.minX + 231.34, y: rect.minY + 94.63))
        path.addCurve(to: CGPoint(x: rect.minX + 199, y: rect.minY - 0.5), control1: CGPoint(x: rect.minX + 208.57, y: rect.minY + 27.12), control2: CGPoint(x: rect.minX + 199.14, y: rect.minY - 0.49))
        path.addCurve(to: CGPoint(x: rect.minX + 178.05, y: rect.minY + 60.88), control1: CGPoint(x: rect.minX + 198.86, y: rect.minY - 0.5), control2: CGPoint(x: rect.minX + 189.43, y: rect.minY + 27.12))
        path.move(to: CGPoint(x: rect.minX + 215.53, y: rect.minY + 94.73))
        path.addLine(to: CGPoint(x: rect.minX + 229.4, y: rect.minY + 135.7))
        path.addLine(to: CGPoint(x: rect.minX + 216.07, y: rect.minY + 150.46))
        path.addCurve(to: CGPoint(x: rect.minX + 201.89, y: rect.minY + 166.23), control1: CGPoint(x: rect.minX + 208.75, y: rect.minY + 158.57), control2: CGPoint(x: rect.minX + 202.36, y: rect.minY + 165.67))
        path.addCurve(to: CGPoint(x: rect.minX + 201.06, y: rect.minY + 109.75), control1: CGPoint(x: rect.minX + 201.08, y: rect.minY + 167.19), control2: CGPoint(x: rect.minX + 201.03, y: rect.minY + 164.15))
        path.addCurve(to: CGPoint(x: rect.minX + 201.37, y: rect.minY + 53), control1: CGPoint(x: rect.minX + 201.07, y: rect.minY + 78.12), control2: CGPoint(x: rect.minX + 201.21, y: rect.minY + 52.59))
        path.addCurve(to: CGPoint(x: rect.minX + 215.53, y: rect.minY + 94.73), control1: CGPoint(x: rect.minX + 201.53, y: rect.minY + 53.41), control2: CGPoint(x: rect.minX + 207.9, y: rect.minY + 72.19))
        path.move(to: CGPoint(x: rect.minX + 144.07, y: rect.minY + 179.62))
        path.addLine(to: CGPoint(x: rect.minX + 158.6, y: rect.minY + 192.75))
        path.addLine(to: CGPoint(x: rect.minX + 104.93, y: rect.minY + 193))
        path.addCurve(to: CGPoint(x: rect.minX + 51.04, y: rect.minY + 192.84), control1: CGPoint(x: rect.minX + 53.88, y: rect.minY + 193.24), control2: CGPoint(x: rect.minX + 50.54, y: rect.minY + 193.23))
        path.addCurve(to: CGPoint(x: rect.minX + 128.9, y: rect.minY + 166.53), control1: CGPoint(x: rect.minX + 51.45, y: rect.minY + 192.52), control2: CGPoint(x: rect.minX + 128.26, y: rect.minY + 166.56))
        path.addCurve(to: CGPoint(x: rect.minX + 144.07, y: rect.minY + 179.62), control1: CGPoint(x: rect.minX + 129.25, y: rect.minY + 166.51), control2: CGPoint(x: rect.minX + 136.08, y: rect.minY + 172.41))
        path.move(to: CGPoint(x: rect.minX + 350.95, y: rect.minY + 198.22))
        path.addCurve(to: CGPoint(x: rect.minX + 261.47, y: rect.minY + 228.5), control1: CGPoint(x: rect.minX + 350.68, y: rect.minY + 198.49), control2: CGPoint(x: rect.minX + 262, y: rect.minY + 228.5))
        path.addCurve(to: CGPoint(x: rect.minX + 227.78, y: rect.minY + 198.44), control1: CGPoint(x: rect.minX + 261.2, y: rect.minY + 228.5), control2: CGPoint(x: rect.minX + 236.3, y: rect.minY + 206.29))
        path.addCurve(to: CGPoint(x: rect.minX + 289.23, y: rect.minY + 198), control1: CGPoint(x: rect.minX + 227.5, y: rect.minY + 198.19), control2: CGPoint(x: rect.minX + 253.84, y: rect.minY + 198))
        path.addCurve(to: CGPoint(x: rect.minX + 350.95, y: rect.minY + 198.22), control1: CGPoint(x: rect.minX + 323.3, y: rect.minY + 198), control2: CGPoint(x: rect.minX + 351.07, y: rect.minY + 198.1))
        path.move(to: CGPoint(x: rect.minX + 197.75, y: rect.minY + 284.73))
        path.addCurve(to: CGPoint(x: rect.minX + 197.45, y: rect.minY + 345.1), control1: CGPoint(x: rect.minX + 197.75, y: rect.minY + 318.12), control2: CGPoint(x: rect.minX + 197.62, y: rect.minY + 345.29))
        path.addCurve(to: CGPoint(x: rect.minX + 182.3, y: rect.minY + 300.83), control1: CGPoint(x: rect.minX + 197.28, y: rect.minY + 344.91), control2: CGPoint(x: rect.minX + 190.47, y: rect.minY + 324.99))
        path.addLine(to: CGPoint(x: rect.minX + 167.46, y: rect.minY + 256.91))
        path.addLine(to: CGPoint(x: rect.minX + 169.35, y: rect.minY + 254.83))
        path.addCurve(to: CGPoint(x: rect.minX + 184.2, y: rect.minY + 238.37), control1: CGPoint(x: rect.minX + 170.4, y: rect.minY + 253.68), control2: CGPoint(x: rect.minX + 177.08, y: rect.minY + 246.28))
        path.addCurve(to: CGPoint(x: rect.minX + 197.45, y: rect.minY + 224), control1: CGPoint(x: rect.minX + 191.32, y: rect.minY + 230.47), control2: CGPoint(x: rect.minX + 197.29, y: rect.minY + 224))
        path.addCurve(to: CGPoint(x: rect.minX + 197.75, y: rect.minY + 284.73), control1: CGPoint(x: rect.minX + 197.62, y: rect.minY + 224), control2: CGPoint(x: rect.minX + 197.75, y: rect.minY + 251.33))

        return path
    }
}