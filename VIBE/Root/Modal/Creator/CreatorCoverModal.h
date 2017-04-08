//
//  CreatorCoverModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/8.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CreatorCoverModal : JSONModel

@property (nonatomic, copy) NSString * CreatorCoverUrl;        //封图
@property (nonatomic, copy) NSString * CreatorShopTitle;      //标题
@property (nonatomic, copy) NSString * CreatorSloganTitle;   //图片链接
@property (nonatomic, copy) NSNumber * CreatorID;           //id

@property (nonatomic, copy) NSArray  * CreatorContentPhotos;//包含的图片链接数组

@end
