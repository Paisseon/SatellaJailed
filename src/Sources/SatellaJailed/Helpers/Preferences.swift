import Foundation

final class Preferences {
    // MARK: Lifecycle

    private init() {
        let defaults = UserDefaults.standard

        if defaults.object(forKey: "TellaInit") == nil {
            defaults.set(true, forKey: "TellaEnabled")
            defaults.set(true, forKey: "TellaGesture")
            defaults.set(false, forKey: "TellaHidden")
            defaults.set("EMT!", forKey: "TellaInit")
            defaults.set(true, forKey: "TellaObserver")
            defaults.set(true, forKey: "TellaReceipt")
            defaults.set(false, forKey: "TellaStealth")
        }

        isEnabled = defaults.bool(forKey: "TellaEnabled")
        isGesture = defaults.bool(forKey: "TellaGesture")
        isHidden = defaults.bool(forKey: "TellaHidden")
        isObserver = defaults.bool(forKey: "TellaObserver")
        isReceipt = defaults.bool(forKey: "TellaReceipt")
        isStealth = defaults.bool(forKey: "TellaStealth")
    }

    // MARK: Internal

    static let shared = Preferences()

    private(set) var isEnabled: Bool = true
    private(set) var isGesture: Bool = true
    private(set) var isHidden: Bool = false
    private(set) var isObserver: Bool = true
    private(set) var isReceipt: Bool = true
    private(set) var isStealth: Bool = true
}
