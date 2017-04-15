//
//  DiscoverTagModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverTagModal : JSONModel

@property (nonatomic, copy) NSNumber * tagID;//标签ID

@property (nonatomic, copy) NSString * tagIconImgURL;//标签ICON地址

@property (nonatomic, copy) NSString * tagCoverImgURL;//标签封面图片地址

@property (nonatomic, copy) NSString * tagTitle;//标签标题

@property (nonatomic, copy) NSNumber * tagItemsCount;//标签下的商品数目

@property (nonatomic, copy) NSArray  * tagItemsArray;//标签下的商品

@end
