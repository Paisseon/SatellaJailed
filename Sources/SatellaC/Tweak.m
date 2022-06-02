#import <Orion/Orion.h>
#import <substrate.h>
#import <UIKit/UIKit.h>

void (*orig_becomeKeyWindow)(UIWindow *self, SEL _cmd);

@interface UIWindow (Satella)
- (void) showPreferences;
@end

void override_becomeKeyWindow(UIWindow *self, SEL _cmd) {
    orig_becomeKeyWindow(self, _cmd);
    
    UILongPressGestureRecognizer *holdGesture = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(showSatellaPrefs:)];
    holdGesture.minimumPressDuration = 0.5;
    holdGesture.numberOfTouchesRequired = 2;
    [self addGestureRecognizer: holdGesture];
}

void new_showSatellaPrefs(UIWindow *self, SEL _cmd) {
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("emt.paisseon.satella.preferences"), NULL, NULL, true);
}

__attribute__((constructor)) static void init() {
    MSHookMessageEx(objc_getClass("UIWindow"), @selector(becomeKeyWindow), (IMP)&override_becomeKeyWindow, (IMP *)&orig_becomeKeyWindow);
    class_addMethod(objc_getClass("UIWindow"), @selector(showSatellaPrefs:), (IMP)&new_showSatellaPrefs, "v@:@");
    
	orion_init();
}