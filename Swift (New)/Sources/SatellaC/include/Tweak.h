#import <objc/runtime.h>
#import <StoreKit/StoreKit.h>

@interface RCEntitlementInfo : NSObject
@property (readonly) NSString *identifier;
@property (readonly) bool isActive;
@property (readonly) bool willRenew;
@property (readonly) NSDate *latestPurchaseDate;
@property (readonly) NSDate *originalPurchaseDate;
@property (readonly) NSDate *expirationDate;
@property (readonly) NSString *productIdentifier;
@property (readonly) bool isSandbox;
- (void) setIdentifier: (NSString *) arg0;
- (void) setIsActive: (bool) arg0;
- (void) setWillRenew: (bool) arg0;
- (void) setExpirationDate: (NSDate *) arg0;
- (void) setOriginalPurchaseDate: (NSDate *) arg0;
- (void) setLatestPurchaseDate: (NSDate *) arg0;
- (void) setIsSandbox: (bool) arg0;
@end

@interface RCEntitlementInfos : NSObject
@property (readonly) NSDictionary *active;
@property (readonly) NSDictionary *all;
- (void) setAll: (NSDictionary *) arg0;
@end

@interface RCPurchaserInfo : NSObject
- (void) setEntitlements: (RCEntitlementInfos *) arg0;
@end

@interface NSObject (SatellaRevCat)
- (void) setIdentifier: (NSString *) arg0;
- (void) setIsActive: (bool) arg0;
- (void) setWillRenew: (bool) arg0;
- (void) setExpirationDate: (NSDate *) arg0;
- (void) setOriginalPurchaseDate: (NSDate *) arg0;
- (void) setLatestPurchaseDate: (NSDate *) arg0;
- (void) setIsSandbox: (bool) arg0;
@end

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

NSArray<NSString *> *productIdentifiers(SKProductsRequest *arg0) {
	id internalRequest        = [arg0 valueForKey: @"_productsRequestInternal"];
	NSSet *productIdentifiers = [internalRequest valueForKey: @"_productIdentifiers"];
    
	return (productIdentifiers != nil) ? [productIdentifiers allObjects] : @[@"emt.paisseon.satella"];
}

RCEntitlementInfo *blank_entitlement() {
    return [[objc_getClass("RCEntitlementInfo") alloc] init];
}