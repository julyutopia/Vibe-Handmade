//
//  CategoryListViewController.h
//  VIBE
//
//  Created by Li Haii on 2016/12/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "CategoryModal.h"
#import "YUSegment.h"
#import "CategoryListFilterView.h"

#import "CategoryListProductTableViewCell.h"
#import "NewProductDetailViewController.h"

@interface CategoryListViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, CategoryListProductTableViewCellDelegate, CategoryListFilterViewDelegate>
{
    YUSegment               * _categorySetSegment;
    
    CategoryListFilterView  * _filterView;
    
    float                     _tableViewOffsetY;
    
    UITableView             * _categoryProductsListTable;
    
    CategoryModal           * _categoryDetailModal;
    
    NSMutableArray          * _categoryProductsArray;
    
    UIVisualEffectView      * _filterBlurBackView;
}


@end
