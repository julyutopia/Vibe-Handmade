//
//  StoryDetail.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface StoryDetailModal : JSONModel

@property (nonatomic, copy) NSNumber * storyID;         //id

@property (nonatomic, copy) NSString * sotryTitle;      //标题
@property (nonatomic, copy) NSString * timeStampTitle;  //时间戳

@property (nonatomic, copy) NSString * storyCoverImgURL; //图片地址

@property (nonatomic, copy) NSNumber * storyIsUserFavored;//用户是否已收藏该产品

@property (nonatomic, copy) NSArray  * storyDetailInfoArray; //专题详情的混排内容

@property (nonatomic, copy) NSArray  * storyDetailBottomInfoArray;//专题底部的图片信息

@end
