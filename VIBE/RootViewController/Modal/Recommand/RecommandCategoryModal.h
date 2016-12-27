//
//  RecommandCategoryModal.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecommandCategoryModal : JSONModel

@property (nonatomic, copy) NSString * categoryTitle;//标题
@property (nonatomic, copy) NSNumber * categoryID;//id
@property (nonatomic, assign)NSInteger categoryOpenType;
@property (nonatomic, copy) NSString * categoryImgURL;//图片地址

@end
