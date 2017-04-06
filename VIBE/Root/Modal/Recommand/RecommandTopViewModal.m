//
//  RecommandTopViewModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandTopViewModal.h"

@implementation RecommandTopViewModal


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
