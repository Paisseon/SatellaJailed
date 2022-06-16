import Cephei
import Orion
import SatellaC
import StoreKit
import UIKit
import SwiftUI

struct Main     : HookGroup {}
struct Receipt  : HookGroup {}
struct Observer : HookGroup {}
struct Sideload : HookGroup {}
struct RevCat   : HookGroup {}

@available(iOS 13, *)
let gui = UIHostingController(rootView: SatellaPreferencesPanel())

class TransactionHook: ClassHook<SKPaymentTransaction> {
	typealias Group = Main

	func transactionState() -> SKPaymentTransactionState {
        return target.original != nil ? .restored : .purchased
	}
	
	func _setTransactionState(_ arg0: SKPaymentTransactionState) {
		arg0 == .restored ? orig._setTransactionState(.restored) : orig._setTransactionState(.purchased)
	}
	
	func _setError(_ arg0: NSError?) {
		orig._setError(nil)
	}
	
	func matchingIdentifier() -> String {
		"satella-mId-\(Int.random(in: 1...999999))"
	}
	
	func transactionIdentifier() -> String {
		"satella-tId-\(Int.random(in: 1...999999))"
	}
	
	func _transactionIdentifier() -> String {
		"satella-_tId-\(Int.random(in: 1...999999))"
	}
	
	func _setTransactionIdentifier(_ arg0: String) {
		orig._setTransactionIdentifier("satella-_tId-\(Int.random(in: 1...999999))")
	}
	
	func transactionDate() -> NSDate {
		NSDate()
	}
	
	func _setTransactionDate(_ arg0: NSDate) {
		orig._setTransactionDate(NSDate())
	}
}

class QueueHook: ClassHook<SKPaymentQueue> {
	typealias Group = Main
	
	class func canMakePayments() -> Bool {
		true
	}
}

class RefreshHook: ClassHook<SKReceiptRefreshRequest> {
	typealias Group = Receipt
	
	func _wantsRevoked() -> Bool {
		false
	}
	
	func _wantsExpired() -> Bool {
		false
	}
}

class ObserverHook: ClassHook<SKPaymentQueue> {
	typealias Group = Observer
	
	func addTransactionObserver(_ arg0: SKPaymentTransactionObserver) {
		let tellaObserver      = SatellaObserver.shared
		tellaObserver.observer = arg0
		
		orig.addTransactionObserver(tellaObserver)
	}
}

class RequestHook: ClassHook<SKProductsRequest> {
	typealias Group = Sideload
	
	func setDelegate(_ arg0: SKProductsRequestDelegate) {
		let tellaDelegate      = SatellaDelegate.shared
		tellaDelegate.delegate = arg0
		
		orig.setDelegate(tellaDelegate)
	}
}

class VerifyHook: ClassHook<NSURL> {
	typealias Group = Receipt
	
	func initWithString(_ arg0: String) -> NSURL {
		if arg0.contains("itunes.apple.com/verifyReceipt") {
			return orig.initWithString("https://drm.cypwn.xyz/verifyReceipt")
		}
		
		return orig.initWithString(arg0)
	}
	
	class func URLWithString(_ arg0: String) -> NSURL {
		if arg0.contains("itunes.apple.com/verifyReceipt") {
			return orig.URLWithString("https://drm.cypwn.xyz/verifyReceipt")
		}
		
		return orig.URLWithString(arg0)
	}
}

class EntitlementHook: ClassHook<NSObject> {
    typealias Group       = RevCat
    static let targetName = "RCEntitlementInfo"
    
    func isActive() -> Bool {
        target.setIsActive(true)
        target.setWillRenew(true)
        target.setExpirationDate(nil)
        target.setLatestPurchaseDate(Date())
        target.setOriginalPurchaseDate(Date())
        target.setIsSandbox(false)
        
        return true
    }
}

class EntitlementsHook: ClassHook<NSObject> {
    typealias Group       = RevCat
    static let targetName = "RCEntitlementInfos"
    
    func all() -> NSDictionary {
        let info = blank_entitlement() as Any
        
        return [
            "annual"              : info,
            "lifetime"            : info,
            "monthly"             : info,
            "premium"             : info,
            "PremiumAnnualWidget" : info,
            "pro"                 : info,
            "subscriber"          : info,
            "subscription"        : info,
            "vip"                 : info
        ] as NSDictionary
    }
}

class Satella: Tweak {
	required init() {
        IPC.shared.addObserver(as: "emt.paisseon.satella.preferences") { name in
            if #available(iOS 13, *) {
                gui.view.backgroundColor   = UIColor.clear
                gui.modalPresentationStyle = .formSheet
                gui.view.layer.cornerCurve = .continuous
                
                if UIApplication.shared.windows.filter ({$0.isKeyWindow}).first?.rootViewController?.presentedViewController !== gui {
                    UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(gui, animated: true)
                }
            }
        }
        
        if Preferences.shared.enabled {
            Main().activate()
            Sideload().activate()
            
            if Preferences.shared.receipts {
                Receipt().activate()
            }
            
            if Preferences.shared.observer {
                Observer().activate()
            }
            
            if Preferences.shared.revcat && objc_getClass("RCEntitlementInfo") != nil {
                RevCat().activate()
            }
        }
	}
}