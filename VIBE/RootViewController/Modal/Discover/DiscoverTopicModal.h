//
//  DiscoverModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/12.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverTopicModal : JSONModel

@property (nonatomic, copy) NSString * discoverTopicTitle;        //标题
@property (nonatomic, copy) NSNumber * discoverTopicID;           //id
@property (nonatomic, assign)NSInteger discoverTopicOpenType;     //打开类型
@property (nonatomic, copy)NSArray   * discoverTopicTagArray;     //专题标签
@property (nonatomic, copy) NSString * discoverTopicImgURL;       //图片地址
@property (nonatomic, copy) NSNumber * discoverTopicLookedNumber; //已查看专题人数
@property (nonatomic, copy) NSNumber * discoverTopicFavorNumber;  //已喜欢专题人数

@end
