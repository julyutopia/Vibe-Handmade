//
//  RecommandCateModal.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecommandCateModal : JSONModel

@property (nonatomic, copy) NSString    * categoryTitle;//分类标题
@property (nonatomic, copy) NSString    * categorySubtitle;//分类副标题(英文)

@property (nonatomic, copy) NSNumber    * categoryID;//id

@property (nonatomic, copy) NSString    * categoryIconImgURL;//Icon图片地址
@property (nonatomic, copy) NSString    * categoryCoverImgURL;//封面图片地址

@property (nonatomic, copy) NSArray     * categorySetArray;//分类下的细类

@end
