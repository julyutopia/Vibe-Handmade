//
//  DiscoverHotTagModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverHotTagModal : JSONModel

@property (nonatomic, copy) NSString * discoverHotTagTitle;        //标题
@property (nonatomic, copy) NSString * discoverHotTagImgUrl;       //图片链接
@property (nonatomic, copy) NSNumber * discoverHotTagID;           //id
@property (nonatomic, assign)NSInteger discoverHotTagOpenType;     //打开类型

@end
