//
//  DiscoverTagModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscoverTagModal : JSONModel

@property (nonatomic, copy) NSString * discoverTagTitle;        //标题
@property (nonatomic, copy) NSString * discoverTagImgUrl;       //图片链接
@property (nonatomic, copy) NSNumber * discoverTagID;           //id

@end
