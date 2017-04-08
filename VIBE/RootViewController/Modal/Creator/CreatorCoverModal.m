//
//  CreatorCoverModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CreatorCoverrrrModal.h"

@implementation CreatorCoverrrrModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"creatorTitle",
                                                       @"id"            : @"creatorID",
                                                       @"open_type"     : @"creatorOpenType",

                                                       @"img"           : @"topicImgURL",
                                                       @"shop_name"     : @"creatorShopName",
                                                       
                                                       @"look_count"    : @"creatorLookedNumber",
                                                       @"favor_count"   : @"creatorFavorNumber",
                                                       }
            ];
}


@end
