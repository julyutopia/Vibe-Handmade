//
//  CreatorDetailModal.h
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CreatorDetailModal : JSONModel

@property (nonatomic, copy) NSNumber * creatorID;               //店铺id

@property (nonatomic, copy) NSString * creatorName;            //店铺标题
@property (nonatomic, copy) NSString * creatorSlogan;           //店铺SLOGAN副标题

@property (nonatomic, copy) NSString * creatorCoverImgURL;      //封面图片地址

@property (nonatomic, copy) NSNumber * creatorIsUserFavored;    //用户是否已收藏该产品

@property (nonatomic, copy) NSArray  * creatorDetailInfoArray;  //专题详情的混排内容

@property (nonatomic, copy) NSArray  * creatorDetailBottomInfoArray;//专题底部的图片信息


@end
