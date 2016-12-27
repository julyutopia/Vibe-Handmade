//
//  HomeProductModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeProductModal.h"

@implementation HomeProductModal

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
                                                       
                                                       @"guess_Products": @"productGuessProductArray"
                                                       
                                                       }
            ];
}


@end
