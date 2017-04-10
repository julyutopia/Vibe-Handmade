//
//  ItemDetailModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ItemDetailModal : JSONModel

@property (nonatomic, copy) NSNumber * itemID;//产品ID

@property (nonatomic, copy) NSString * itemCoverImgURL;//封面图片地址

@property (nonatomic, copy) NSString * itemTitle;//产品标题

@property (nonatomic, copy) NSString * itemShopName;//店家名字

@property (nonatomic, copy) NSString * itemPrice;//价格

@property (nonatomic, copy) NSNumber * itemIsUserFavored;//用户是否已收藏该产品

@property (nonatomic, copy) NSArray  * itemMorePhotosUrlsArray;//更多图片地址数组

@property (nonatomic, copy) NSString * itemDetailInfo;//详情的描述文字

@property (nonatomic, copy) NSArray  * itemGuessArray;//猜你喜欢的产品

@end
