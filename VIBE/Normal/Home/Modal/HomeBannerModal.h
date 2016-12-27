//
//  HomeBannerModal.h
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HomeBannerModal : JSONModel

@property (nonatomic, copy) NSString * title;//标题
@property (nonatomic, copy) NSNumber * ID;//id
@property (nonatomic, assign) NSInteger openType;
@property (nonatomic, copy) NSString * imgURL;//图片地址
@property (nonatomic, copy) NSString * linkURL;//链接

@end
