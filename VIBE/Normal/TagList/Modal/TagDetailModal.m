//
//  TagDetailModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TagDetailModal.h"

@implementation TagDetailModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       
                                                       @"id"                : @"tagID",
                                                       @"tag_icon"          : @"tagIconImgURL",
                                                       @"tag_cover"         : @"tagCoverImgURL",
                                                       @"tag_title"         : @"tagTitle",
                                                       @"tag_items_count"   : @"tagItemsCount",
                                                       @"tag_items"         : @"tagItemsArray"
                                                       
                                                       }
            ];
}


@end
