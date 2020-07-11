static BOOL appNotFound = YES;
static NSString *breadcrumbApp;

@interface FBProcessManager {
	FBApplicationProcess* _foregroundAppProcess;
}
-(id)processesForBundleIdentifier:(id)arg1;
@end
@interface SBAssistantController
+(id)sharedInstance;
+(BOOL)shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:(id)arg1;
@end
//gets the bundleid of breadcrumb app
%hook SBAssistantController
+(BOOL)shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:(id)arg1 {
	breadcrumbApp = arg1;
	return %orig;
}
%end
//checks if breadcrumb bundleid is still in the background/foreground
%hook FBProcessManager
-(id)init {
	NSArray *processes = [self processesForBundleIdentifier:breadcrumbApp];
	if(processes.count == 0){
		//app fully closed
		appNotFound = YES;
	} else {
		//app not closed
		appNotFound = NO;
	}
	return %orig;
}
%end
//rest of the stuff just removes breadcrumb very poorly but im too tired to do it well so stfu
%hook SBDeviceApplicationSceneStatusBarBreadcrumbProvider
+ (_Bool)_shouldAddBreadcrumbToActivatingSceneEntity:(id)arg1 sceneHandle:(id)arg2 withTransitionContext:(id)arg3{
	if(appNotFound) {
		return %orig;
	} else {
		return NO;
	}
}
%end