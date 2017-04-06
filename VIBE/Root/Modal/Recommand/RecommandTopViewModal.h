//
//  RecommandTopViewModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecommandTopViewModal : JSONModel

@property (nonatomic, copy) NSString * title;//标题
@property (nonatomic, copy) NSNumber * ID;//id
@property (nonatomic, assign) NSInteger openType;
@property (nonatomic, copy) NSString * imgURL;//图片地址
@property (nonatomic, copy) NSString * linkURL;//链接

@end