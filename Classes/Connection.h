//
//  Connection.h
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Connection : NSObject {
	NSMutableData *receiveData;
	NSURLConnection *urlConnection;
}

@property (retain, nonatomic) NSMutableData *receiveData;
@property (retain, nonatomic) NSURLConnection *urlConnection;

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)getData;

@end
