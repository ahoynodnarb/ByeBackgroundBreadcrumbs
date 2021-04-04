#import <SparkAppList.h>
#import <UIKit/UIKit.h>

@interface SpringBoard : UIApplication
-(UIApplication *)_accessibilityFrontMostApplication;
@end
@interface SBApplication
-(NSString *)bundleIdentifier;
@end
@interface FBProcessManager
+(id)sharedInstance;
-(id)allProcesses;
@end
@interface SBDeviceApplicationSceneStatusBarBreadcrumbProvider : NSObject
@property (nonatomic,copy,readonly) NSString *breadcrumbTitle; 
@end
@interface FBProcess : NSObject
-(NSString *)name;
@end
BOOL isEnabled;