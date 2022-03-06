#import "Satella.h"

@implementation SatellaDelegate
+ (instancetype) sharedInstance {
	static dispatch_once_t once;
	static id sharedInstance;
	dispatch_once(&once, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

- (id) initWithDelegate: (id) arg0 {
	self = [super init];
	if (self) self->delegate = arg0;
	self->products = [[NSMutableArray alloc] init];
	return self;
}

- (void) productsRequest: (SKProductsRequest *) arg0 didReceiveResponse: (SKProductsResponse *) arg1 {
	if (arg1.products.count > 0) {
		[self->delegate productsRequest: arg0 didReceiveResponse: arg1];
		return;
	}
	
	SKProductsResponse *response            = [[SKProductsResponse alloc] init];
	id internalRequest                      = [arg0 valueForKey: @"_productsRequestInternal"];
	NSArray<NSString *> *productIdentifiers = [[internalRequest valueForKey: @"_productIdentifiers"] allObjects];
	
	for (NSString *identifier in productIdentifiers) {
		SKProduct *product = [[SKProduct alloc] init];
		
		[product _setPrice: [NSDecimalNumber decimalNumberWithString: @"0"]]; // returns nil if set without a string
		[product _setProductIdentifier: identifier];
		[product _setLocalizedTitle: identifier];
		
		[self->products addObject: product];
	}
	
	[response _setProducts: self->products];
	[self->delegate productsRequest: arg0 didReceiveResponse: response];
}
@end