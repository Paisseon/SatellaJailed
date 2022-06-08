
import Orion
import SwiftUI
import UIKit

@available(iOS 13, *)
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

@available(iOS 13, *)
struct SatellaPreferencesPanel: View {
    @State private var enabledVal  = Preferences.shared.enabled
    @State private var receiptVal  = Preferences.shared.receipts
    @State private var observerVal = Preferences.shared.observer
    @State private var revcatVal   = Preferences.shared.revcat
    @State private var isApplying  = false
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
            
            VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
                .opacity(0.95)
                    
            VStack {
                Button(action: {
                    gui.dismiss(animated: true)
                }) {
                    Text("×")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.white)
                }
                
                Image(uiImage: chibimilia())
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.youtube-nocookie.com/embed/Ekdo5Qc--sA?wmode=transparent&iv_load_policy=3&autoplay=1&html5=1&showinfo=0&rel=0&modestbranding=1&playsinline=0&theme=dark")!, options: [:], completionHandler: nil)
                    }
                
                Text("Satella Jailed")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom)
                
                HStack{
                    Text("Enabled")
                        .foregroundColor(.white)
                        .padding()
                    Toggle("", isOn: $enabledVal)
                }
                
                
                if enabledVal {
                    HStack{
                        Text("Receipt")
                            .foregroundColor(.white)
                            .padding()
                        Toggle("", isOn: $receiptVal)
                    }
                    
                    HStack{
                        Text("Observer")
                            .foregroundColor(.white)
                            .padding()
                        Toggle("", isOn: $observerVal)
                    }
                    
                    HStack{
                        Text("Revenue Cat")
                            .foregroundColor(.white)
                            .padding()
                        Toggle("", isOn: $revcatVal)
                    }
                }
                
                Button("\(isApplying ? "Applying..." : "Apply")") {
                    let defaults = UserDefaults.standard
                    
                    defaults.set(enabledVal, forKey: "SatellaEnabled")
                    defaults.set(receiptVal, forKey: "SatellaReceipts")
                    defaults.set(observerVal, forKey: "SatellaObserver")
                    defaults.set(revcatVal, forKey: "SatellaRevCat")
                    
                    isApplying = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        abort()
                    }
                }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.leading)
                    .padding(.trailing)
                    .background(RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(Color.purple))
                    .padding(.top)
                Spacer()
            }
                .frame(maxWidth: 300)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

class Preferences {
	static let shared         = Preferences()
	
	private(set) var enabled  = true
	private(set) var receipts = false
	private(set) var observer = false
    private(set) var revcat   = false
	
	private init() {
		let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "Satella") == nil {
            defaults.set("Emilia-tan Maji Tenshi!", forKey: "Satella")
            
            defaults.set(true, forKey: "SatellaEnabled")
            defaults.set(false, forKey: "SatellaReceipts")
            defaults.set(false, forKey: "SatellaObserver")
            defaults.set(false, forKey: "SatellaRevCat")
        }
        
        enabled  = defaults.bool(forKey: "SatellaEnabled")
        receipts = defaults.bool(forKey: "SatellaReceipts")
        observer = defaults.bool(forKey: "SatellaObserver")
        revcat   = defaults.bool(forKey: "SatellaRevCat")
	}
}