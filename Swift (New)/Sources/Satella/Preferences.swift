import AVFoundation
import Orion
import SwiftUI
import UIKit

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}

func chibimilia() -> UIImage {
    if let imageUrl = Bundle.main.privateFrameworksURL?.appendingPathComponent("Orion.framework/Emilia/Emilia.png") {
        let data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: data)
        return image?.scalePreservingAspectRatio(targetSize: CGSize(width: 100, height: 133)) ?? UIImage()
    }
    
    return UIImage()
}

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
    @State private var touchesVal  = Preferences.shared.touches
    @State private var rotateVal   = 0.0
    @State private var liaTaps     = UserDefaults.standard.integer(forKey: "satella_taps")
    @State private var isApplying  = false
    @State private var isAppDB     = false
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
            
            VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
                .opacity(0.95)
                    
            ScrollView(showsIndicators: false) {
                VStack {
                    Button(action: {
                        gui.dismiss(animated: true)
                    }) {
                        Image(systemName: "xmark")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    if !isAppDB {
                        Image(uiImage: chibimilia())
                            .onTapGesture {
                                let rng = Int.random(in: 1...100)
                                liaTaps += 1
                                
                                if let audioUrl = Bundle.main.privateFrameworksURL?.appendingPathComponent("Orion.framework/Emilia/\((liaTaps % 25 == 0) ? 101 : rng).mp3") {
                                    var audioId: SystemSoundID = 0
                                    
                                    AudioServicesCreateSystemSoundID(audioUrl as CFURL, &audioId)
                                    AudioServicesPlaySystemSound(audioId);
                                }
                                
                                if liaTaps % 25 == 0 {
                                    rotateVal += 1440.0
                                }
                                
                                UserDefaults.standard.set(liaTaps, forKey: "satella_taps")
                            }
                            .rotationEffect(.degrees(rotateVal))
                            .animation(.linear(duration: 7.0))
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
                            Text("\(Int(touchesVal) == 0 ? 2 : Int(touchesVal)) Touches")
                                .foregroundColor(.white)
                                .padding()
                            Slider(value: $touchesVal, in: 2...5, step: 1.0)
                        }
                    }
                    
                    Button("\(isApplying ? "Applying..." : "Apply")") {
                        let defaults = UserDefaults.standard
                        
                        defaults.set(enabledVal, forKey: "satella_enabled")
                        defaults.set(receiptVal, forKey: "satella_receipts")
                        defaults.set(observerVal, forKey: "satella_observer")
                        defaults.set(touchesVal, forKey: "satella_touches")
                        
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
                }
            }
                .frame(maxWidth: 300)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

class Preferences {
	static let shared = Preferences()
	
	private(set) var enabled  = true
	private(set) var receipts = false
	private(set) var observer = false
    private(set) var touches  = 2.0
	
	private init() {
		let defaults = UserDefaults.standard
        
        // Clear old preferences
        
        if defaults.object(forKey: "Satella") != nil {
            for key in ["Satella", "SatellaEnabled", "SatellaReceipts", "SatellaObserver", "SatellaRevCat", "SatellaTouches", "SatellaTaps"] {
                defaults.removeObject(forKey: key)
            }
        }
        
        // If this is the first time, enable Core functionality
        
        if !defaults.bool(forKey: "satella_did_init") {
            defaults.set(true, forKey: "satella_enabled")
            defaults.set(true, forKey: "satella_did_init")
        }
        
        // Read the UserDefaults to prefs vars
        
        enabled  = defaults.bool(forKey: "satella_enabled")
        receipts = defaults.bool(forKey: "satella_receipts")
        observer = defaults.bool(forKey: "satella_observer")
        touches  = defaults.double(forKey: "satella_touches")
	}
}