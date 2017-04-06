//
//  DiscoverTagModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverTagModal.h"

@implementation DiscoverTagModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"discoverTagTitle",
                                                       @"image"         : @"discoverTagImgUrl",
                                                       @"id"            : @"discoverTagID",
                                                       }
            ];
}

@end
