//
//  VibeProductModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeProductModal.h"

@implementation VibeProductModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"pid"           : @"productID",
                                                       @"title"         : @"productTitle",
                                                       @"img"           : @"productImgURL",
                                                       
                                                       @"shop_Header"   : @"productShopHeader",
                                                       @"shop_Name"     : @"productShopName",
                                                       @"shop_Address"  : @"productShopAddress",
                                                       
                                                       @"price"         : @"productPrice",
                                                       
                                                       @"stock"         : @"productStock",
                                                       
                                                       @"favorPeople"   : @"productFavorCount",
                                                       @"user_Favor"    : @"productIsUserFavored",
                                                       
                                                       @"top_Images"    : @"productTopImageUrlsArray",
                                                       
                                                       @"detail_Info"   : @"productDetailInfoArray",
                                                       
                                                       @"guess_Products": @"productGuessProductArray",
                                                       
                                                       @"tags"          : @"productTagsArray"
                                                       }
            ];
}

@end
