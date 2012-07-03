//
//  XMLParser.h
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLParser : NSObject <NSXMLParserDelegate> {
	BOOL isStatuses;
	BOOL isStatus;
	BOOL isName;
	BOOL isText;
	NSMutableArray *statuses;
	NSMutableDictionary *currentStatus;
	NSMutableString *textNodeCharacters;
}

@property BOOL isStatuses;
@property BOOL isStatus;
@property BOOL isName;
@property BOOL isText;
@property (retain, nonatomic) NSMutableArray *statuses;
@property (retain, nonatomic) NSMutableDictionary *currentStatus;
@property (retain, nonatomic) NSMutableString *textNodeCharacters;

- (NSArray *)parseStatuses:(NSData *)xmlData;

@end
