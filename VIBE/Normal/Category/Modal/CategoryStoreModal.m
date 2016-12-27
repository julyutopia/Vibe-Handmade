//
//  CategoryStoreModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryStoreModal.h"

@implementation CategoryStoreModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{    
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"shop_id"       : @"storeID",
                                                       @"title"         : @"storeTitle",
                                                       @"owner_name"    : @"storeOwnerName",
                                                       @"image"         : @"storeIconImgURL",
                                                       @"slogan"          : @"storeSloganString",
                                                       @"is_favored"    : @"storeIsFavored",
                                                       
                                                       }
            ];
}



@end
