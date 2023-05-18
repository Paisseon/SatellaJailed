import SwiftUI

@available(iOS 15, *)
struct SatellaShapeView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = SatellaShape(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

@available(iOS 15, *)
struct SatellaView: View {
    @StateObject var model: SatellaModel = .shared
    
    var body: some View {
        Button {
            model.isShowing.toggle()
        } label: {
            Color(red: 0.80, green: 0.63, blue: 0.87)
                .mask {
                    SatellaShapeView()
                }
        }
        .frame(width: 33, height: 33)
        .sheet(isPresented: $model.isShowing) {
            PreferencesView(isShowing: $model.isShowing)
        }
    }
}
