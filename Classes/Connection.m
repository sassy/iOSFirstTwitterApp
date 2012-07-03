//
//  Connection.m
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Connection.h"


@implementation Connection

@synthesize receiveData;
@synthesize urlConnection;

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
	[receiveData setLength:0];
}

- (void)connection:(NSURLConnection *)connection
	didReceiveData:(NSData *)data
{
	[receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:@"connectionDidFinishNotification"
				object:self];
}

- (void)connection:(NSURLConnection *)connection 
  didFailWithError:(NSError *)error
{
	NSLog(@"failer");
}

- (void)getData
{
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://twitter.com/status/user_timeline/sassy_watson.xml"]
											 cachePolicy:NSURLRequestUseProtocolCachePolicy
										 timeoutInterval:60.0];
	receiveData = [[NSMutableData data] retain];
	urlConnection = [[NSURLConnection alloc]initWithRequest:request
													delegate:self];
	
}

- (void)dealloc
{
	[urlConnection release];
	[receiveData release];
	[super dealloc];
}
@end
