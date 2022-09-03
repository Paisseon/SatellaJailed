#import <StoreKit/StoreKit.h>

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
    
    return (productIdentifiers) ? [productIdentifiers allObjects] : @[@"emt.paisseon.satella"];
}