#include "BBBPRootListController.h"
#import "SparkAppListTableViewController.h"

@implementation BBBPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)blacklistApps
{
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.popsicletreehouse.byebackgroundbreadcrumbsprefs" andKey:@"blacklistedApps"];

    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}
-(void)openReddit {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://reddit.com/u/PopsicleTreehouse"] options:@{} completionHandler:nil];
}
-(void)openTwitter {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/ahoynodnarb"] options:@{} completionHandler:nil];
}
-(void)openGithub {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/PopsicleTreehouse/ByeBackgroundBreadcrumbs"] options:@{} completionHandler:nil];
}
@end
