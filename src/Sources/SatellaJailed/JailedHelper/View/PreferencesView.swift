import SwiftUI

@available(iOS 14, *)
struct PreferencesView: View {
    @AppStorage("TellaEnabled") var isEnabled: Bool = true
    @AppStorage("TellaGesture") var isGesture: Bool = true
    @AppStorage("TellaHidden") var isHidden: Bool = false
    @AppStorage("TellaObserver") var isObserver: Bool = true
    @AppStorage("TellaReceipt") var isReceipt: Bool = true
    @AppStorage("TellaStealth") var isStealth: Bool = false
    
    @State private var isShowingOptions: Bool = false
    @Binding var isShowing: Bool
    
    private let Lilac: Color = .init(red: 0.80, green: 0.63, blue: 0.87)
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button(action: {
                        if isHidden {
                            IPC.shared.post("tella.hideUntilNextLaunch")
                        }
                        
                        isShowing.toggle()
                    }) {
                        Image(systemName: "xmark.square.fill")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Lilac)
                            .padding()
                    }
                    
                    Lilac
                        .mask(
                            SatellaShape()
                                .scale(0.2)
                                .frame(width: 50, height: 50)
                        )
                        .frame(width: 50, height: 50)
                        .padding()
                        .padding(.bottom)
                        .actionSheet(isPresented: $isShowingOptions) {
                            ActionSheet(
                                title: Text(""),
                                buttons: [
                                    Alert.Button.default(Text("Nevermind")) {
                                        isShowingOptions.toggle()
                                    },
                                    
                                    Alert.Button.default(Text("Close App")) {
                                        abort()
                                    },
                                    
                                    Alert.Button.default(Text("Hide Satella")) {
                                        IPC.shared.post("tella.hideUntilNextLaunch")
                                        isShowing.toggle()
                                    },
                                    
                                    Alert.Button.default(Text("View Source Code / FAQ")) {
                                        UIApplication.shared.open(
                                            URL(string: "https://github.com/Paisseon/SatellaJailed")!,
                                            options: [:],
                                            completionHandler: nil
                                        )
                                    }
                                ]
                            )
                        }
                    
                    Text("Satella Jailed")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .padding(.bottom)
                    
                    Toggle(
                        "Enabled",
                        isOn: $isEnabled
                    )
                    .padding()
                    
                    if isEnabled {
                        Toggle(
                            "Observer",
                            isOn: $isObserver
                        )
                        .padding()
                        
                        Toggle(
                            "Receipts",
                            isOn: $isReceipt
                        )
                        .padding()
                        
                        Toggle(
                            "Stealth 🧪",
                            isOn: $isStealth
                        )
                        .padding()
                    }
                    
                    Toggle(
                        "Hide Forever",
                        isOn: $isHidden
                    )
                    .padding()
                    
                    Toggle(
                        "Enable Gesture",
                        isOn: $isGesture
                    )
                    .padding()
                    
                    HStack(alignment: .center) {
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
                            .fill(Lilac)
                        )
                        .padding(.top)
                    }
                }
            }
        }
    }
}

