//
//  DiscoverModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/12.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverTopicModal.h"

@implementation DiscoverTopicModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"discoverTopicTitle",
                                                       @"id"            : @"discoverTopicID",
                                                       @"open_type"     : @"discoverTopicOpenType",
                                                       @"tags"          : @"discoverTopicTagArray",
                                                       @"img"           : @"discoverTopicImgURL",
                                                       @"look_count"    : @"discoverTopicLookedNumber",
                                                       @"favor_count"   : @"discoverTopicFavorNumber",
                                                       }
            ];
}

@end


