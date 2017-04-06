//
//  RecommandItemModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecommandItemModal : JSONModel

@property (nonatomic, copy) NSNumber * productID;//产品ID

@property (nonatomic, copy) NSString * productTitle;//产品标题

@property (nonatomic, copy) NSString * productInfoTitle;//产品副标题

@property (nonatomic, copy) NSString * productImgURL;//图片地址
@property (nonatomic, copy) NSArray  * productDetailImgUrlArray;//顶部滚动的图片

@property (nonatomic, copy) NSString * productShopHeader;//店家头像
@property (nonatomic, copy) NSString * productShopName;//店家名字

@property (nonatomic, copy) NSString * productPrice;//价格

@property (nonatomic, copy) NSNumber * productIsUserFavored;//用户是否已收藏该产品

@property (nonatomic, copy) NSString * productDetailString;//文字详情

@property (nonatomic, copy) NSArray  * productGuessProductArray;//猜你喜欢的产品


@end
