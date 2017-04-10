//
//  ItemDetailModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailModal.h"

@implementation ItemDetailModal

//@property (nonatomic, copy) NSNumber * itemID;//产品ID
//@property (nonatomic, copy) NSString * itemCoverImgURL;//封面图片地址
//@property (nonatomic, copy) NSString * itemTitle;//产品标题
//@property (nonatomic, copy) NSString * itemShopName;//店家名字
//@property (nonatomic, copy) NSString * itemPrice;//价格
//@property (nonatomic, copy) NSNumber * itemIsUserFavored;//用户是否已收藏该产品
//@property (nonatomic, copy) NSArray  * itemMorePhotosUrlsArray;//更多图片地址数组
//@property (nonatomic, copy) NSString * itemDetailInfo;//详情的描述文字
//@property (nonatomic, copy) NSArray  * itemGuessArray;//猜你喜欢的产品


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
