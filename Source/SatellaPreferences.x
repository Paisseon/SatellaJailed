#import "Satella.h"

// thanks to artem kasper for help writing the UITableViewController =)

@implementation SatellaPreferences
- (NSInteger) numberOfSectionsInTableView: (UITableView *) arg0 {
	return 1;
}

- (NSInteger) tableView: (UITableView *) arg0 numberOfRowsInSection: (NSInteger) arg1 {
	return 5;
}

- (UITableViewCell *) tableView: (UITableView *) arg0 cellForRowAtIndexPath: (NSIndexPath *) arg1 {
	static NSString *cellIdentifier = @"SatellaPreferencesCell";
	UITableViewCell *cell           = [arg0 dequeueReusableCellWithIdentifier: cellIdentifier];
	
	if (cell == nil) {
		cell                                     = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
		cell.textLabel.adjustsFontSizeToFitWidth = true;
		
		if (arg1.row == 0) {
			cell.textLabel.text          = @"💜 Satella Jailed 💜";
			cell.textLabel.textAlignment = NSTextAlignmentCenter;
			cell.selectionStyle          = UITableViewCellSelectionStyleNone;
		}
		
		if (arg1.row == 1) {
			cell.textLabel.text = @"Enable";
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			UISwitch *enable    = [[UISwitch alloc] initWithFrame: CGRectZero];
			[enable addTarget: self action: @selector(toggleEnable:) forControlEvents: UIControlEventValueChanged];
			enable.on           = [[NSUserDefaults standardUserDefaults] boolForKey: @"kSatellaEnabled"];
			cell.accessoryView  = enable;
		}
		
		if (arg1.row == 2) {
			cell.textLabel.text = @"Receipts";
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			UISwitch *receipts  = [[UISwitch alloc] initWithFrame: CGRectZero];
			[receipts addTarget: self action: @selector(toggleReceipt:) forControlEvents: UIControlEventValueChanged];
			receipts.on         = [[NSUserDefaults standardUserDefaults] boolForKey: @"kSatellaReceipt"];
			cell.accessoryView  = receipts;
		}
		
		if (arg1.row == 3) {
			cell.textLabel.text = @"Observer";
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			UISwitch *observer  = [[UISwitch alloc] initWithFrame: CGRectZero];
			[observer addTarget: self action: @selector(toggleObserver:) forControlEvents: UIControlEventValueChanged];
			observer.on         = [[NSUserDefaults standardUserDefaults] boolForKey: @"kSatellaObserver"];
			cell.accessoryView  = observer;
		}
		
		if (arg1.row == 4) {
			cell.textLabel.text = @"Apply";
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			UISwitch *apply     = [[UISwitch alloc] initWithFrame: CGRectZero];
			[apply addTarget: self action: @selector(applyChanges:) forControlEvents: UIControlEventValueChanged];
			apply.on            = false;
			cell.accessoryView  = apply;
		}
	}
	
	return cell;
}

- (UIView *) tableView: (UITableView *) arg0 viewForFooterInSection: (NSInteger) arg1 {        
	return [UIView new];
}

- (CGFloat) tableView: (UITableView *) arg0 heightForFooterInSection: (NSInteger) arg1 {
	return 10;
}
@end

@implementation SatellaPreferences (Private)
- (void) toggleEnable: (UISwitch *) sender {
	[[NSUserDefaults standardUserDefaults] setBool: [sender isOn] forKey: @"kSatellaEnabled"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) toggleReceipt: (UISwitch *) sender {
	[[NSUserDefaults standardUserDefaults] setBool: [sender isOn] forKey: @"kSatellaReceipt"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) toggleObserver: (UISwitch *) sender {
	[[NSUserDefaults standardUserDefaults] setBool: [sender isOn] forKey: @"kSatellaObserver"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) applyChanges: (UISwitch *) sender {
	[[NSUserDefaults standardUserDefaults] synchronize];
	[sender.superview.subviews[1].subviews[0] setText: @"Quitting app..."];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void) {
		abort();
	});
}
@end

%hook UIWindow
- (void) becomeKeyWindow {
	%orig;
	
	UILongPressGestureRecognizer *holdGesture = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(showSatellaPrefs:)];
	holdGesture.minimumPressDuration = 0.5;
	holdGesture.numberOfTouchesRequired = 2;
	[self addGestureRecognizer: holdGesture];
}

%new 
- (void) showSatellaPrefs: (id) sender {
	UIViewController      *rootVC          = [[UIApplication sharedApplication] keyWindow].rootViewController;
	UITableViewController *prefsController = [[SatellaPreferences alloc] init];
	prefsController.modalPresentationStyle = UIModalPresentationFormSheet;
	
	[rootVC presentViewController: prefsController animated: true completion: nil];
}
%end