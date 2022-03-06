#include <StoreKit/StoreKit.h>
#include <time.h>

@interface SKPaymentTransaction (Satella)
- (void) _setTransactionState: (SKPaymentTransactionState) arg0;
- (void) _setError: (NSError *) arg0;
@end

@interface SKProduct (Satella)
- (void) _setPrice: (NSDecimalNumber *) arg0;
- (void) _setProductIdentifier: (NSString *) arg0;
- (void) _setLocalizedTitle: (NSString *) arg0;
@end

@interface SKProductsResponse (Satella)
- (void) _setProducts: (NSArray *) arg0;
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