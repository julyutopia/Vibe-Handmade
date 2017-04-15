//
//  RecommandCateModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandCateModal.h"

@implementation RecommandCateModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}





+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"            : @"categoryID",
                                                       @"title"         : @"categoryTitle",
                                                       @"eng_Title"     : @"categorySubtitle",
                                                       @"icon_img"      : @"categoryIconImgURL",
                                                       @"cover_img"     : @"categoryCoverImgURL",
                                                       @"set_Cate"      : @"categorySetArray"
                                                       }
            ];
}


@end
