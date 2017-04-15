//
//  CategoryListViewController.h
//  VIBE
//
//  Created by Li Haii on 2016/12/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "RecommandCateModal.h"
#import "RecommandItemModal.h"

#import "UIImage+MostColor.h"

#import "HMSegmentedControl.h"
#import "YUSegment.h"

#import "CategoryListHeaderCollectionReusableView.h"
#import "CategoryListItemCollectionViewCell.h"

#import "CategoryListFilterView.h"

#import "ItemDetailViewController.h"

@interface CategoryListViewController : BasicViewController<UICollectionViewDelegate, UICollectionViewDataSource, CategoryListItemCollectionViewCellDelegate, CategoryListFilterViewDelegate>
{
    
    BOOL                    _didRecordAutoScroll;
    
    RecommandCateModal     * _cateModal;
    
    float                     _newNaviHeight;
    
    UIImageView             * _backBlurImgView;
    UIImageView             * _naviImgView;
    
    CategoryListFilterView  * _filterView;
    
    UILabel                 * _naviTitleLabel;
    UILabel                 * _naviSubtitleLabel;
    
    float                     _topbarHeight;
    UIView                  * _topbarView;
    YUSegment               * _categorySetSegment;

//    HMSegmentedControl      * _cateSubcateSegment;
    
    NSMutableArray          * _subCateArray;
    
    UICollectionView        * _categoryListCollectionView;
    
    NSMutableArray          * _categoryItemsArray;
}


-(id)initWithCateModal:(RecommandCateModal *)modal;


@end






