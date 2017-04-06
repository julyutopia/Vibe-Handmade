//
//  DiscoverTopicModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverTopicModal : JSONModel

@property (nonatomic, copy) NSString * discoverTopicTitle;        //标题
@property (nonatomic, copy) NSString * discoverTopicImgUrl;       //图片链接
@property (nonatomic, copy) NSString * discoverTopicTimeStamp;       //时间戳
@property (nonatomic, copy) NSNumber * discoverTopicID;           //id

@end
