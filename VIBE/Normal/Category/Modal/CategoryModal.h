//
//  CategoryModal.h
//  VIBE
//
//  Created by Li Haii on 16/8/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CategoryModal : JSONModel


@property (nonatomic, copy) NSString * categoryTitle;//标题
@property (nonatomic, copy) NSNumber * categoryID;//id
@property (nonatomic, assign)NSInteger categoryOpenType;

@property (nonatomic, copy) NSString * categoryIconUrl;//ICON地址

@property (nonatomic, copy) NSString * categoryImgURL;//图片地址
@property (nonatomic, copy) NSString * categoryImgName;//本地图片名字
@property (nonatomic, copy) NSString * categoryLinkURL;//链接

@property (nonatomic, copy) NSArray  * categorySetArray;//分类下的 细类数组

@end
