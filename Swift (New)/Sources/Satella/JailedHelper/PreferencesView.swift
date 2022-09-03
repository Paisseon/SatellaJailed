import SwiftUI

// Show the preferences view in the centre of the screen
// The toggles automatically save to UserDefaults

@available(iOS 14, *)
struct PreferencesView: View {
    @AppStorage("enabled") var isEnabled: Bool = true
    @AppStorage("receipt") var receipts: Bool  = true
    @AppStorage("observer") var observer: Bool = true
    @State private var isShowingOptions: Bool  = false
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    Button(action: {
                        isShowing.toggle()
                    }) {
                        Image(systemName: "xmark.square.fill")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                    
                    Color(red: 0.80, green: 0.63, blue: 0.87)
                        .mask(
                            SatellaShape()
                                .scale(0.2)
                                .padding(.leading, -57)
                                .padding(.top, -57)
                                .frame(width: 50, height: 50)
                        )
                        .frame(width: 50, height: 50)
                        .padding()
                        .padding(.bottom)
                    
                    Text("Satella Jailed")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .padding(.bottom)
                    
                    HStack {
                        Text("Enabled")
                            .padding()
                        Toggle("", isOn: $isEnabled)
                    }
                    .padding([.leading, .trailing])
                    
                    if isEnabled {
                        HStack {
                            Text("Observer")
                                .padding()
                            Toggle("", isOn: $observer)
                        }
                        .padding([.leading, .trailing])
                        
                        HStack {
                            Text("Receipts")
                                .padding()
                            Toggle("", isOn: $receipts)
                        }
                        .padding([.leading, .trailing, .bottom])
                    }
                    
                    HStack(alignment: .center) {
                        Button("Apply") {
                            isShowingOptions.toggle()
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing])
                        .background(RoundedRectangle(cornerRadius: 13, style: .continuous)
                                        .fill(Color(red: 0.80, green: 0.63, blue: 0.87)))
                        .padding(.top)
                    }
                }
            }
        }
        .actionSheet(isPresented: $isShowingOptions) { ActionSheet(
                        title: Text("Apply Button Popup"),
                        message: Text("It is such a quiet thing, to fall. But far more terrible is to admit it."),
                        buttons: [
                            Alert.Button.default(Text("Hide Satella")) {
                                IPC.shared.post("tella.hideUntilNextLaunch")
                                isShowing.toggle()
                            },
                            
                            Alert.Button.default(Text("Close App")) {
                                abort()
                            },
                            
                            Alert.Button.default(Text("View Source Code")) {
                                UIApplication.shared.open(URL(string: "https://github.com/Paisseon/SatellaJailed")!,
                                                          options: [:],
                                                          completionHandler: nil)
                            },
                            
                            Alert.Button.default(Text("Cancel")) {}
                        ])}
    }
}