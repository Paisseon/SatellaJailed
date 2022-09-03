import SwiftUI

// A floating Satella button over the app
// Drag it to move around, or tap it to open preferences

@available(iOS 14, *)
struct SatellaView: View {
    @StateObject var model: SatellaVM
    
    var body: some View {
        ZStack {
            Button(action: self.performAction) {
                Color(red: 0.80, green: 0.63, blue: 0.87)
                    .mask(
                        SatellaShape()
                            .scale(0.2)
                            .padding(.leading, -30)
                            .padding(.top, -30)
                    )
                    .padding()
            }
            .frame(width: 50, height: 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $model.isShowing) {
            PreferencesView(isShowing: $model.isShowing)
        }
    }

    func performAction() {
        model.isShowing.toggle()
    }
}
