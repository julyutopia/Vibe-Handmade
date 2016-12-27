//
//  HomeTopicModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeTopicModal.h"

@implementation HomeTopicModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"title",
                                                       @"img"           : @"imgURL",
                                                       @"url"           : @"linkURL",
                                                       @"open_type"     : @"openType",
                                                       @"id"            : @"ID",
                                                       
                                                       }
            ];
}


@end
