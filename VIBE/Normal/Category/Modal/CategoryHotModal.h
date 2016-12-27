//
//  CategoryHotModal.h
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CategoryHotModal : JSONModel

@property (nonatomic, copy) NSString * categoryHotTitle;//标题
@property (nonatomic, copy) NSNumber * categoryHotID;//id
@property (nonatomic, assign)NSInteger categoryHotOpenType;
@property (nonatomic, copy) NSString * categoryHotImgURL;//图片地址
@property (nonatomic, copy) NSString * categoryLinkURL;//链接

@end
