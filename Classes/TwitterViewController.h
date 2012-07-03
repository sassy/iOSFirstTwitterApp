//
//  TwitterViewController.h
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwitterViewController : UITableViewController {
	NSArray *array;
}

@property (retain, nonatomic) NSArray *array;

- (void)loadTweet;
- (void)loadDidEnd:(NSNotification *)notification;

@end
