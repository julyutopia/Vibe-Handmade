//
//  CreatorDetailModal.h
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CreatorDetailModal : JSONModel

@property (nonatomic, copy) NSString * creatorTitle;        //标题
@property (nonatomic, copy) NSNumber * creatorID;           //id
@property (nonatomic, assign)NSInteger creatorOpenType;     //打开类型

@property (nonatomic, copy) NSString * creatorImgURL;       //图片地址
@property (nonatomic, copy) NSString * creatorShopName;     //店铺名字

@property (nonatomic, copy) NSNumber * creatorLookedNumber; //已查看专题人数
@property (nonatomic, copy) NSNumber * creatorFavorNumber;  //已喜欢专题人数

@property (nonatomic, copy) NSNumber * creatorDetailIsUserFavored;//用户是否已收藏该专题
@property (nonatomic, copy) NSArray  * creatorDetailInfoArray;//详情的图文混排

@property (nonatomic, copy) NSArray  * creatorRelatedProductArray;//专题相关的产品
@property (nonatomic, copy) NSArray  * creatorDetailBottomInfoArray;//专题底部的图片信息

@end
