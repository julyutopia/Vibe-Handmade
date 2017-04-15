//
//  ItemDetailModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailModal.h"

@implementation ItemDetailModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       
                                                       @"id"            : @"itemID",
                                                       @"cover_image"   : @"itemCoverImgURL",
                                                       @"title"         : @"itemTitle",
                                                       @"shop_name"     : @"itemShopName",
                                                       @"price"         : @"itemPrice",
                                                       @"favored"       : @"itemIsUserFavored",
                                                       @"more_photo"    : @"itemMorePhotosUrlsArray",
                                                       @"detail_info"   : @"itemDetailInfo",
                                                       @"guess"         : @"itemGuessArray"
                                                       
                                                       }
            ];
}



@end
