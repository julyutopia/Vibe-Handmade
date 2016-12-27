//
//  CreatorCoverModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CreatorCoverModal : JSONModel

@property (nonatomic, copy) NSString * creatorTitle;        //标题
@property (nonatomic, copy) NSNumber * creatorID;           //id
@property (nonatomic, assign)NSInteger creatorOpenType;     //打开类型

@property (nonatomic, copy) NSString * creatorImgURL;       //图片地址
@property (nonatomic, copy) NSString * creatorShopName;     //店铺名字

@property (nonatomic, copy) NSNumber * creatorLookedNumber; //已查看专题人数
@property (nonatomic, copy) NSNumber * creatorFavorNumber;  //已喜欢专题人数

@end
