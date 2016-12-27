//
//  CategoryStoreModal.h
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CategoryStoreModal : JSONModel

@property (nonatomic, copy) NSNumber * storeID;//店铺ID

@property (nonatomic, copy) NSString * storeTitle;//店铺标题
@property (nonatomic, copy) NSString * storeOwnerName;// 店铺店主名字
@property (nonatomic, copy)NSString * storeIconImgURL;// 店铺图片地址

@property (nonatomic, copy) NSMutableArray * storeTagsArray;//店铺展示图片分类

@property (nonatomic, copy) NSString * storeSloganString;//店铺主题分类
@property (nonatomic, copy) NSMutableArray * storeTopProductsArray;//店铺展示图片分类

@property (nonatomic, assign) BOOL storeIsFavored;//用户是否已收藏该店铺

@end
