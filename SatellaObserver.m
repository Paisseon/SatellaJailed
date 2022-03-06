#import "Satella.h"

@implementation SatellaObserver
+ (instancetype) sharedInstance {
	static dispatch_once_t once;
	static id sharedInstance;
	dispatch_once(&once, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

- (id) initWithObserver: (id) arg0 {
	self = [super init];
	if (self) self->observer = arg0;
	self->purchases = [[NSMutableArray alloc] init];
	return self;
}

- (void) paymentQueue: (SKPaymentQueue *) queue updatedTransactions:(NSArray<SKPaymentTransaction *> *) transactions {
	for (SKPaymentTransaction *transaction in transactions) {
		
		for (SKPaymentTransaction *purchase in self->purchases) {
			if (purchase.payment == transaction.payment) return;
		}
		
		switch (transaction.transactionState) {
			
			case 1:
				[self->purchases addObject: transaction];
				[queue finishTransaction: transaction];
				break;
				
			case 3:
				if (transaction.originalTransaction) {
					[self->purchases addObject: transaction.originalTransaction];
					[queue finishTransaction: transaction.originalTransaction];
				}
			
			default:
				[transaction _setTransactionState: 1];
				[transaction _setError: nil];
				[self->purchases addObject: transaction];
		}
	}
	
	if (self->purchases) [self->observer paymentQueue: queue updatedTransactions: self->purchases];
}
@end