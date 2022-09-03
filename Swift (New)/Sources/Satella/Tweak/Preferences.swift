import Foundation

final class Preferences {
	static let shared = Preferences()
	
	private(set) var enabled  = true
	private(set) var receipts = true
	private(set) var observer = true
	
	private init() {
		let defaults = UserDefaults.standard
        
        // If this is the first time, enable Core functionality
        
        if !defaults.bool(forKey: "satella_did_init") {
            defaults.set(true, forKey: "satella_enabled")
            defaults.set(true, forKey: "satella_receipts")
            defaults.set(true, forKey: "satella_observer")
            defaults.set(true, forKey: "satella_did_init")
        }
        
        // Read the UserDefaults to prefs vars
        
        enabled  = defaults.bool(forKey: "satella_enabled")
        receipts = defaults.bool(forKey: "satella_receipts")
        observer = defaults.bool(forKey: "satella_observer")
	}
}