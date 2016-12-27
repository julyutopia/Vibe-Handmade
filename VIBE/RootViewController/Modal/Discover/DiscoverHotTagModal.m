//
//  DiscoverHotTagModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverHotTagModal.h"

@implementation DiscoverHotTagModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"discoverHotTagTitle",
                                                       @"image"         : @"discoverHotTagImgUrl",
                                                       @"id"            : @"discoverHotTagID",
                                                       @"open_type"     : @"discoverHotTagOpenType",
                                                       }
            ];
}


@end
