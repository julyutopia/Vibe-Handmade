//
//  DiscoverStoryModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverStoryModal : JSONModel

@property (nonatomic, copy) NSString * discoverStoryTitle;        //标题
@property (nonatomic, copy) NSString * discoverStoryImgUrl;       //图片链接
@property (nonatomic, copy) NSString * discoverStoryTimeStamp;    //时间戳
@property (nonatomic, copy) NSNumber * discoverStoryID;           //id

@property (nonatomic, copy) NSArray  * discoverStoryContentPhotos;//包含的图片链接数组

@end
