//
//  MineProfileModal.h
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MineProfileModal : JSONModel

@property (nonatomic, copy) NSNumber * userID;// 用户ID
@property (nonatomic, copy) NSString * userAvatarImgURL;//用户头像地址
@property (nonatomic, copy) NSString * userName;// 用户名
@property (nonatomic, copy) NSString * userDescribe; //用户签名
@property (nonatomic, copy) NSNumber * userFollowingNumber;//用户关注人数
@property (nonatomic, copy) NSNumber * userFollowedNumber;//用户被关注人数

@property (nonatomic, copy) NSMutableArray * userFavoredProductsArray;//用户收藏的产品
@property (nonatomic, copy) NSMutableArray * userFavoredStoresArray;//用户收藏的店铺
@property (nonatomic, copy) NSMutableArray * userFavoredTopicsArray;//用户收藏的专题


@end
