import Foundation

final class Preferences {
	static let shared = Preferences()
	
	private(set) var enabled  = true
	private(set) var receipts = true
	private(set) var observer = true
	
	private init() {
		let defaults = UserDefaults.standard
        
        // Read the UserDefaults to prefs vars
        
        enabled  = defaults.bool(forKey: "enabled")  ?? true
        receipts = defaults.bool(forKey: "receipts") ?? true
        observer = defaults.bool(forKey: "observer") ?? true
	}
}