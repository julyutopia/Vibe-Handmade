//
//  VibeTopicModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface VibeTopicModal : JSONModel

@property (nonatomic, copy) NSString * topicTitle;  //标题
@property (nonatomic, copy) NSNumber * topicID;     //id
@property (nonatomic, assign)NSInteger topicType;   //打开类型
@property (nonatomic, copy) NSString * topicImgURL; //图片地址

@property (nonatomic, copy) NSArray  * topicTagsArray;   //专题标签

@property (nonatomic, copy) NSNumber * topicLookedNumber;//已查看专题人数
@property (nonatomic, copy) NSNumber * topicFavorNumber; //已喜欢专题人数

@property (nonatomic, copy) NSNumber * topicIsUserFavored;//用户是否已收藏该产品
@property (nonatomic, copy) NSArray  * topicDetailInfoArray;//详情的图文混排

@property (nonatomic, copy) NSArray  * topicRelatedProductArray;//专题相关的产品

@property (nonatomic, copy) NSArray  * topicDetailBottomInfoArray;//专题底部的图片信息

@end
