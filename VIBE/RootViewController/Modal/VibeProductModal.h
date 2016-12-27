//
//  VibeProductModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface VibeProductModal : JSONModel

@property (nonatomic, copy) NSNumber * productID;//产品ID

@property (nonatomic, copy) NSString * productTitle;//产品标题
@property (nonatomic, copy) NSString * productImgURL;//图片地址

@property (nonatomic, copy) NSString * productShopHeader;//店家头像
@property (nonatomic, copy) NSString * productShopName;//店家名字
@property (nonatomic, copy) NSString * productShopAddress;//店铺地址

@property (nonatomic, copy) NSString * productPrice;//价格

@property (nonatomic, copy) NSNumber * productStock;

@property (nonatomic, copy) NSNumber * productFavorCount;//已有多少人喜欢
@property (nonatomic, copy) NSNumber * productIsUserFavored;//用户是否已收藏该产品

@property (nonatomic, copy) NSArray  * productTopImageUrlsArray;//顶部滚动的图片

@property (nonatomic, copy) NSArray  * productDetailInfoArray;//详情的图文混排

@property (nonatomic, copy) NSArray  * productGuessProductArray;//猜你喜欢的产品

@property (nonatomic, copy) NSArray  * productTagsArray;//产品的标签

@end
