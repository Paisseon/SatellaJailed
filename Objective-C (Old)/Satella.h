#import <StoreKit/StoreKit.h>
#import <time.h>
#import <CoreGraphics/CoreGraphics.h>
#import <mach-o/dyld.h>

static bool SatellaEnabled;
static bool SatellaReceipt;
static bool SatellaObservr;

@interface SKPaymentTransaction (Satella)
- (void) _setTransactionState: (SKPaymentTransactionState) arg0;
- (void) _setError: (NSError *) arg0;
@end

@interface SKProduct (Satella)
- (void) _setPrice: (NSDecimalNumber *) arg0;
- (void) _setPriceLocale: (NSLocale *) arg0;
- (void) _setProductIdentifier: (NSString *) arg0;
- (void) _setLocalizedDescription: (NSString *) arg0;
- (void) _setLocalizedTitle: (NSString *) arg0;
@end

@interface SKProductsResponse (Satella)
- (void) _setProducts: (NSArray *) arg0;
@end

@interface UIWindow (Satella)
- (void) showSatellaPrefs: (id) sender;
@end

@interface SatellaObserver : NSObject<SKPaymentTransactionObserver> {
	id observer;
	NSMutableArray *purchases;
}
+ (instancetype) sharedInstance;
- (id) initWithObserver: (id) arg0;
@end

@interface SatellaDelegate : NSObject<SKProductsRequestDelegate> {
	id delegate;
	NSMutableArray *products;
}
+ (instancetype) sharedInstance;
- (id) initWithDelegate: (id) arg0;
@end

@interface SatellaPreferences : UITableViewController
@end