import SwiftUI

@available(iOS 15, *)
struct PreferencesView: View {
    @AppStorage("tella_isEnabled") private var isEnabled: Bool = true
    @AppStorage("tella_isGesture") private var isGesture: Bool = true
    @AppStorage("tella_isHidden") private var isHidden: Bool = false
    @AppStorage("tella_isObserver") private var isObserver: Bool = false
    @AppStorage("tella_isPriceZero") private var isPriceZero: Bool = false
    @AppStorage("tella_isReceipt") private var isReceipt: Bool = false
    @AppStorage("tella_isStealth") private var isStealth: Bool = false
    
    @Binding var isShowing: Bool
    @State private var isShowingOptions: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                Button {
                    isShowing.toggle()
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
                
                Color(red: 0.80, green: 0.63, blue: 0.87)
                    .mask { SatellaShapeView() }
                    .frame(width: 50, height: 50)
                    .padding()
                    .padding(.bottom)
                    .alert("Select an action", isPresented: $isShowingOptions) {
                        Button("Apply Changes (Close App)") {
                            abort()
                        }
                        
                        Button("Hide Satella") {
                            isShowing.toggle()
                            SatellaController.shared.host.removeFromSuperview()
                        }
                        
                        Button("View Source Code / FAQ") {
                            UIApplication.shared.open(
                                URL(string: "https://github.com/Paisseon/SatellaJailed")!,
                                options: [:],
                                completionHandler: nil
                            )
                        }
                        
                        Button("Cancel") {
                            isShowingOptions.toggle()
                        }
                    }
                
                VStack {
                    Toggle("Enabled", isOn: $isEnabled)
                    Toggle("3-Finger Gesture", isOn: $isGesture)
                    Toggle("Hide Permanently", isOn: $isHidden)
                    Toggle("Observer", isOn: $isObserver)
                    Toggle("0,00 Price", isOn: $isPriceZero)
                    Toggle("Receipt", isOn: $isReceipt)
                    Toggle("Stealth", isOn: $isStealth)
                }
                .padding()
                .padding(.horizontal, 10)
                
                Button("Apply") {
                    isShowingOptions.toggle()
                }
                    .foregroundColor(.white)
                    .padding()
                    .padding([.leading, .trailing])
                    .background(
                        RoundedRectangle(
                            cornerRadius: 13,
                            style: .continuous
                        )
                        .fill(Color(red: 0.80, green: 0.63, blue: 0.87))
                    )
                    .padding(.top)
            }
            .tint(Color(red: 0.80, green: 0.63, blue: 0.87))
        }
    }
}
