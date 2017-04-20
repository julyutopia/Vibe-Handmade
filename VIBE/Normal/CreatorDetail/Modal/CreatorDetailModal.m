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


//@property (nonatomic, copy) NSNumber * creatorID;               //店铺id
//@property (nonatomic, copy) NSString * creatorTitle;            //店铺标题
//@property (nonatomic, copy) NSString * creatorSlogan;           //店铺SLOGAN副标题
//@property (nonatomic, copy) NSString * creatorCoverImgURL;      //封面图片地址
//@property (nonatomic, copy) NSNumber * creatorIsUserFavored;    //用户是否已收藏该产品
//@property (nonatomic, copy) NSArray  * creatorDetailInfoArray;  //专题详情的混排内容
//@property (nonatomic, copy) NSArray  * creatorDetailBottomInfoArray;//专题底部的图片信息



+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       
                                                       @"id"              : @"creatorID",
                                                       @"creator_title"   : @"creatorName",
                                                       @"creator_time"    : @"creatorSlogan",
                                                       @"creator_cover"   : @"creatorCoverImgURL",
                                                       @"creator_favored" : @"creatorIsUserFavored",
                                                       @"creator_detail"  : @"creatorDetailInfoArray",
                                                       @"creator_bottom"  : @"creatorDetailBottomInfoArray",
                                                       
                                                       }
            ];
    
}


@end
