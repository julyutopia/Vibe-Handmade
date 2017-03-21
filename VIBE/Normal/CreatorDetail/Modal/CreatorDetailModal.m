//
//  CreatorDetailModal.m
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDetailModal.h"

@implementation CreatorDetailModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

//@property (nonatomic, copy) NSString * creatorTitle;        //标题
//@property (nonatomic, copy) NSNumber * creatorID;           //id
//@property (nonatomic, assign)NSInteger creatorOpenType;     //打开类型
//
//@property (nonatomic, copy) NSString * creatorImgURL;       //图片地址
//@property (nonatomic, copy) NSString * creatorShopName;     //店铺名字
//
//@property (nonatomic, copy) NSNumber * creatorLookedNumber; //已查看专题人数
//@property (nonatomic, copy) NSNumber * creatorFavorNumber;  //已喜欢专题人数
//
//@property (nonatomic, copy) NSNumber * creatorDetailIsUserFavored;//用户是否已收藏该专题
//@property (nonatomic, copy) NSArray  * creatorDetailInfoArray;//详情的图文混排
//
//@property (nonatomic, copy) NSArray  * creatorRelatedProductArray;//专题相关的产品
//@property (nonatomic, copy) NSArray  * creatorDetailBottomInfoArray;//专题底部的图片信息


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"             : @"creatorTitle",
                                                       @"id"                : @"creatorID",
                                                       @"open_type"         : @"creatorOpenType",

                                                       @"img"               : @"creatorImgURL",
                                                       @"shop_name"         : @"creatorShopName",
                                                       
                                                       @"look_count"        : @"creatorLookedNumber",
                                                       @"favor_count"       : @"creatorFavorNumber",
                                                       
                                                       @"user_Favor"        :@"creatorDetailIsUserFavored",
                                                       
                                                       @"detail_Info"       :@"creatorDetailInfoArray",
                                                       
                                                       @"related_Products"  :@"creatorRelatedProductArray",
                                                       
                                                       @"bottom_Info"       :@"creatorDetailBottomInfoArray"

                                                       }
            ];
}

@end
