//
//  XMLParser.m
//  TwitterViewer
//
//  Created by 渡辺 悟史 on 12/06/30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize isStatuses;
@synthesize isStatus;
@synthesize isText;
@synthesize isName;
@synthesize statuses;
@synthesize currentStatus;
@synthesize textNodeCharacters;

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	self.statuses = [[[NSMutableArray alloc] init] autorelease];
}

- (void) parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI 
  qualifiedName:(NSString *)qName
	 attributes:(NSDictionary *)attributeDict 
{
	self.textNodeCharacters = [[[NSMutableString alloc] init] autorelease];
	if ([elementName isEqual:@"statuses"]) {
		self.isStatuses = YES;
		return;
	}
	if (self.isStatuses == YES && [elementName isEqual:@"status"]) {
		self.isStatus = YES;
		self.currentStatus = [[[NSMutableDictionary alloc] init] autorelease];
		return;
	}
	if (self.isStatus == YES && [elementName isEqual:@"name"]) {
		self.isName = YES;
	} else if (self.isStatus == YES && [elementName isEqual:@"text"]) {
		self.isText = YES;
	}
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
	[self.textNodeCharacters appendString:string];
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
	NSString *textData = [self.textNodeCharacters stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if (self.isStatus == YES && [elementName isEqual:@"name"]) {
		[self.currentStatus setValue:textData forKey:@"name"];
		self.isName = NO;
	} else if (self.isStatus == YES && [elementName isEqual:@"text"]) {
		[self.currentStatus setValue:textData forKey:@"text"];
		self.isText = NO;
	} else if (self.isStatus == YES && [elementName isEqual:@"status"]) {
		[self.statuses addObject:self.currentStatus];
		self.currentStatus = nil;
		self.isStatus = NO;
	} else if (self.isStatuses == YES && [elementName isEqual:@"statuses"]) {
		self.isStatuses = NO;
	}
}

- (NSArray *)parseStatuses:(NSData *)xmlData {
	NSXMLParser *parser = [[[NSXMLParser alloc] initWithData:xmlData] autorelease];
	[parser setDelegate:self];
	[parser parse];

 	return self.statuses;
}

@end
