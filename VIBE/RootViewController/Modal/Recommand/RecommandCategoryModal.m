//
//  RecommandCategoryModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandCategoryModal.h"

@implementation RecommandCategoryModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"categoryTitle",
                                                       @"img"           : @"categoryImgURL",
                                                       @"open_type"     : @"categoryOpenType",
                                                       @"id"            : @"categoryID",
                                                       }
            ];
}


@end
