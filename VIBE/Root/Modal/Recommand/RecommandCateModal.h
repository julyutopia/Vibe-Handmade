//
//  RecommandCateModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecommandCateModal : JSONModel

@property (nonatomic, copy) NSString * categoryTitle;//标题
@property (nonatomic, copy) NSNumber * categoryID;//id
@property (nonatomic, copy) NSString * categoryImgURL;//图片地址

@end
