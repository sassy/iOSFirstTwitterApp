//
//  TwitterViewerAppDelegate.m
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewerAppDelegate.h"
#import "TwitterViewController.h"

@implementation TwitterViewerAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	viewController = [[TwitterViewController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	[self.window addSubview:navigationController.view];
	[self.window makeKeyAndVisible];
}

- (void)dealloc {
	[viewController release];
    [window release];
    [super dealloc];
}


@end
