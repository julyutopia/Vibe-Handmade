//
//  CategoryListHeaderCollectionReusableView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/13.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryListHeaderCollectionReusableView : UICollectionReusableView
{
    float                     _topbarHeight;
    UIView                  * _topbarView;
    YUSegment               * _categorySetSegment;
}

-(void)setCategoryListHeaderViewWithSubcate:(NSArray *)subcateArray WithColorImage:(UIImage *)image;

@end
