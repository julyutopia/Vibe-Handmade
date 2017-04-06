//
//  DiscoverTopicModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
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
                                                       @"image"         : @"discoverTopicImgUrl",
                                                       @"time"          : @"discoverTopicTimeStamp",
                                                       @"id"            : @"discoverTopicID",
                                                       }
            ];
}


@end
