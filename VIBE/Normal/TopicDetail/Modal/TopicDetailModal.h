//
//  TopicDetailModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TopicDetailModal : JSONModel

@property (nonatomic, copy) NSNumber * topicID;         //id

@property (nonatomic, copy) NSString * topicTitle;      //标题
@property (nonatomic, copy) NSString * timeStampTitle;  //时间戳

@property (nonatomic, copy) NSString * topicCoverImgURL; //图片地址

@property (nonatomic, copy) NSNumber * topicIsUserFavored;//用户是否已收藏该产品

@property (nonatomic, copy) NSArray  * topicDetailInfoArray; //专题详情的混排内容

@property (nonatomic, copy) NSArray  * topicDetailBottomInfoArray;//专题底部的图片信息

@end
