//
//  TwitterViewerAppDelegate.h
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterViewController.h"

@class TwitterViewController;

@interface TwitterViewerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
	TwitterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet TwitterViewController *viewController;

@end

