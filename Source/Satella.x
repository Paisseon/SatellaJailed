#import "Satella.h"

%hook SKPaymentTransaction
- (char) transactionState {
	if (%orig == 3) return 3;
	return 1;
}

- (void) _setTransactionState: (char) arg0 {
	if (arg0 == 3) %orig;
	else %orig(1);
}

- (void) _setError: (NSError*) arg0 {
	%orig(nil);
}

- (NSString*) matchingIdentifier {
	return [NSString stringWithFormat: @"satella-mId-%u", arc4random_uniform(999999)];
}

- (NSString*) transactionIdentifier {
	return [NSString stringWithFormat: @"satella-tId-%u", arc4random_uniform(999999)];
}

- (NSString*) _transactionIdentifier {
	return [NSString stringWithFormat: @"satella-_tId-%u", arc4random_uniform(999999)];
}

- (void) _setTransactionIdentifier: (NSString*) arg0 {
	%orig([NSString stringWithFormat: @"satella-_tId-%u", arc4random_uniform(999999)]);
}

- (NSDate*) transactionDate {
	return [NSDate date];
}

- (void) _setTransactionDate: (NSDate*) arg0 {
	%orig([NSDate date]);
}

- (NSData*) transactionReceipt {
	long long now          = time(NULL) * 1000;
	NSString *bvrs         = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
	uint32_t receiptId     = arc4random_uniform(999999);
	NSString *vendorId     = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
	NSString *bundleId     = [[NSBundle mainBundle] bundleIdentifier];

	NSString *purchaseInfo = [NSString stringWithFormat:@"{\n\t\"original-purchase-date-pst\" = \"2022-01-01 05:00:00 America/Los_Angeles\";\n\t\"purchase-date-ms\" = \"%lli\";\n\t\"unique-identifier\" = \"V2hlcmUgYXJlIHRoZSBrbml2ZXMuIC0gQ2hhcmEu\";\n\t\"original-transaction-id\" = \"440000267115041\";\n\t\"bvrs\" = \"%@\";\n\t\"app-item-id\" = \"1106936921\";\n\t\"transaction-id\" = \"%u\";\n\t\"quantity\" = \"1\";\n\t\"original-purchase-date-ms\" = \"%lli\";\n\t\"unique-vendor-identifier\" = \"%@\";\n\t\"item-id\" = \"1114015840\";\n\t\"version-external-identifier\" = \"07151129\";\n\t\"product-id\" = \"%@\";\n\t\"purchase-date\" = \"2022-01-01 12:00:00 Etc/GMT\";\n\t\"original-purchase-date\" = \"2022-01-01 12:00:00 Etc/GMT\";\n\t\"bid\" = \"%@\";\n\t\"purchase-date-pst\" = \"2022-01-01 05:00:00 America/Los_Angeles\";\n}", now, bvrs, receiptId, now, vendorId, self.payment.productIdentifier, bundleId];
	
	NSData *purchaseData   = [purchaseInfo dataUsingEncoding:NSUTF8StringEncoding];
	NSString *purchaseB64  = [[NSString alloc] initWithData: purchaseData encoding: NSUTF8StringEncoding];
	
	NSString *fullReceipt  = [NSString stringWithFormat: @"{\n\t\"signature\" = \"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\";\n\t\"purchase-info\" = \"%@\";\n\t\"pod\" = \"44\";\n\t\"signing-status\" = \"0\";\n}", purchaseB64];
	
	return [fullReceipt dataUsingEncoding: NSUTF8StringEncoding];
}
%end

%hook SKReceiptRefreshRequest
- (bool) _wantsRevoked {
	return false;
}

- (bool) _wantsExpired {
	return false;
}
%end

%hook SKPaymentQueue
- (bool) canMakePayments {
	return true;
}

- (void) addTransactionObserver: (id) arg0 {
	SatellaObserver *tellaObs = [[SatellaObserver sharedInstance] initWithObserver: arg0];
	%orig(tellaObs);
}
%end

%hook SKProductsRequest
- (void) setDelegate: (id) arg0 {
	SatellaDelegate *tellaDel = [[SatellaDelegate sharedInstance] initWithDelegate: arg0];
	%orig(tellaDel);
}
%end