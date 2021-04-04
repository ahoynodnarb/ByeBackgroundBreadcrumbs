#import "Breadcrumbs.h"

static void refreshPrefs() {
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.popsicletreehouse.byebackgroundbreadcrumbsprefs"];
	isEnabled = [bundleDefaults objectForKey:@"isEnabled"] ? [[bundleDefaults objectForKey:@"isEnabled"]boolValue] : YES;
}
static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    refreshPrefs();
}
%hook SBDeviceApplicationSceneStatusBarBreadcrumbProvider
-(NSString *)breadcrumbTitle {
	NSString *breadcrumbTitle = %orig;
	SBApplication *foregroundApp = (SBApplication *)[(SpringBoard *)[UIApplication sharedApplication] _accessibilityFrontMostApplication];
	if(!isEnabled || [%c(SparkAppList) doesIdentifier:@"com.popsicletreehouse.byebackgroundbreadcrumbsprefs" andKey:@"blacklistedApps" containBundleIdentifier:[foregroundApp bundleIdentifier]]) {
		return breadcrumbTitle;
	}
	for(FBProcess *process in [[%c(FBProcessManager) sharedInstance] allProcesses]) {
		if([[process name] isEqualToString:breadcrumbTitle]) {
			return breadcrumbTitle;
		}
	}
	return nil;
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.byebackgroundbreadcrumbs.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}