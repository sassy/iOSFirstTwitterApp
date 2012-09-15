//
//  TwitterViewController.m
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewController.h"
#import "Connection.h"
#import "XMLParser.h"


@implementation TwitterViewController

@synthesize array;

- (id)init
{
	self = [super init];
	if (self != nil) {
	}
	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	NSLog(@"numberOfSectionsInTableView");
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	/*
	id obj;
	for (obj in array) {
		NSLog(@"%@", [obj description]);
	}
	NSLog(@"%d", [array count]);
	 */

	return [array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tweetText = [[self.array objectAtIndex:indexPath.row] valueForKey:@"text"];
    CGSize textSize = [tweetText sizeWithFont:[UIFont systemFontOfSize:14.0f]
                            constrainedToSize:CGSizeMake(floorf(self.tableView.frame.size.width * 0.6), INFINITY)];
    return textSize.height + 20.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

	static NSString *cellIentifier = @"Cell";
	UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:cellIentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				initWithStyle:UITableViewCellStyleValue2
				 reuseIdentifier:cellIentifier] autorelease];
	}
	int row = [indexPath row];
	NSString *text = [[array objectAtIndex:row] objectForKey:@"text"];
	NSString *name = [[array objectAtIndex:row] objectForKey:@"name"];
	cell.textLabel.font = [UIFont systemFontOfSize:16];
	cell.textLabel.text = name;
	
	cell.detailTextLabel.numberOfLines = 0;
	cell.detailTextLabel.font =  [UIFont systemFontOfSize:14];
	cell.detailTextLabel.text = text;
	return cell;
}

- (void)viewDidLoad
{
	[self loadTweet];
}


- (void)loadTweet
{
	Connection *con = [[[Connection alloc] init] autorelease];
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
		selector:@selector(loadDidEnd:)
			name:@"connectionDidFinishNotification"
		  object:con];
	
	[con getData];
}


- (void)loadDidEnd:(NSNotification *)notification
{
	Connection *con = (Connection *)[notification object];
	NSData *xml = con.receiveData;
	XMLParser *parser = [[[XMLParser alloc] init] autorelease];
	self.array = [parser parseStatuses:xml];
	NSLog(@"reload");
	[self.tableView reloadData];
}
@end
