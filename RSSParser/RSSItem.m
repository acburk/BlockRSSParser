//
//  RSSItem.m
//  RSSParser
//
//  Created by Thibaut LE LEVIER on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"

@interface RSSItem (Private)

-(NSArray *)imagesFromHTMLString:(NSString *)htmlstr;

@end

@implementation RSSItem

@synthesize title;
@synthesize itunesAuthor;
@synthesize link;
@synthesize itemDescripition;
@synthesize itunesSubTitle;
@synthesize itunesSummary;
@synthesize pubDate;
@synthesize category;
@synthesize itunesExplicit;
@synthesize itunesKeywords;
@synthesize guid;
@synthesize itunesImage;
@synthesize enclosureUrl;
@synthesize enclosureLength;
@synthesize enclosureType;

@synthesize content;
@synthesize commentsLink;
@synthesize commentsFeed;
@synthesize commentsCount;
@synthesize author;

- (void)dealloc {
    [title            release]; title            = nil;
    [itunesAuthor     release]; itunesAuthor     = nil;
    [link             release]; link             = nil;
    [itemDescripition release]; itemDescripition = nil;
    [itunesSubTitle   release]; itunesSubTitle   = nil;
    [itunesSummary    release]; itunesSummary    = nil;
    [pubDate          release]; pubDate          = nil;
    [category         release]; category         = nil;
    [itunesExplicit   release]; itunesExplicit   = nil;
    [itunesKeywords   release]; itunesKeywords   = nil;
    [guid             release]; guid             = nil;
    [itunesImage      release]; itunesImage      = nil;
    [enclosureUrl     release]; enclosureUrl     = nil;
    [enclosureLength  release]; enclosureLength  = nil;
    [enclosureType    release]; enclosureType    = nil;

    [content          release]; content          = nil;
    [commentsLink     release]; commentsLink     = nil;
    [commentsFeed     release]; commentsFeed     = nil;
    [commentsCount    release]; commentsCount    = nil;
    [author           release]; author           = nil;

    [super dealloc];
}

-(NSArray *)imagesFromItemDescription
{
    if (self.itemDescripition) {
        return [self imagesFromHTMLString:self.itemDescripition];
    }
    
    return nil;
}

-(NSArray *)imagesFromContent
{
    if (self.content) {
        return [self imagesFromHTMLString:self.content];
    }
    
    return nil;
}

#pragma mark - retrieve images from html string using regexp (private methode)

-(NSArray *)imagesFromHTMLString:(NSString *)htmlstr
{
    NSMutableArray *imagesURLStringArray = [[NSMutableArray alloc] init];
    
    NSError *error;
    
    NSRegularExpression *regex = [NSRegularExpression         
                                  regularExpressionWithPattern:@"(https?)\\S*(png|jpg|jpeg|gif)"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    
    [regex enumerateMatchesInString:htmlstr 
                            options:0 
                              range:NSMakeRange(0, htmlstr.length) 
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             [imagesURLStringArray addObject:[htmlstr substringWithRange:result.range]];
                         }];    
    
    return [NSArray arrayWithArray:imagesURLStringArray];
}

@end
