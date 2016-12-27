//
//  CategoryModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryModal.h"

@implementation CategoryModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"categoryTitle",
                                                       @"icon"          : @"categoryIconUrl",
                                                       @"img"           : @"categoryImgURL",
                                                       @"url"           : @"categoryLinkURL",
                                                       @"open_type"     : @"categoryOpenType",
                                                       @"id"            : @"categoryID",
                                                       @"category_set"  : @"categorySetArray"
                                                       }
            ];
}


@end
