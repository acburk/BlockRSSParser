//
//  RSSItem.h
//  RSSParser
//
//  Created by Thibaut LE LEVIER on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSItem : NSObject

@property (retain,nonatomic) NSString *title;
@property (retain,nonatomic) NSString *itunesAuthor;
@property (retain,nonatomic) NSURL *link;
@property (retain,nonatomic) NSString *itemDescripition;
@property (retain,nonatomic) NSString *itunesSubTitle;
@property (retain,nonatomic) NSString *itunesSummary;
@property (retain,nonatomic) NSDate *pubDate;
@property (retain,nonatomic) NSString *category;
@property (retain,nonatomic) NSString *itunesExplicit;
@property (retain,nonatomic) NSString *itunesKeywords;
@property (retain,nonatomic) NSString *guid;
@property (retain,nonatomic) NSString *itunesImage;
@property (retain,nonatomic) NSString *enclosureUrl;
@property (retain,nonatomic) NSString *enclosureLength;
@property (retain,nonatomic) NSString *enclosureType;


@property (retain,nonatomic) NSString *content;
@property (retain,nonatomic) NSURL *commentsLink;
@property (retain,nonatomic) NSURL *commentsFeed;
@property (retain,nonatomic) NSNumber *commentsCount;
@property (retain,nonatomic) NSString *author;


-(NSArray *)imagesFromItemDescription;
-(NSArray *)imagesFromContent;

@end
