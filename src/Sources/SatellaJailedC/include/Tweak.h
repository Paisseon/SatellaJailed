#import <StoreKit/StoreKit.h>

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

