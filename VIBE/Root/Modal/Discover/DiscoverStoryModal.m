//
//  DiscoverStoryModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverStoryModal.h"

@implementation DiscoverStoryModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"discoverStoryTitle",
                                                       @"image"         : @"discoverStoryImgUrl",
                                                       @"time"          : @"discoverStoryTimeStamp",
                                                       @"id"            : @"discoverStoryID",
                                                       @"photos"        : @"discoverStoryContentPhotos",

                                                       }
            ];
}


@end
