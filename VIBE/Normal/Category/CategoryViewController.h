//
//  CategoryViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "CategorySearchView.h"

#import "CategoryHotTableViewCell.h"
#import "CagoryInfoTopTableViewCell.h"
#import "CagoryCateTableViewCell.h"
#import "CategoryBottomTableViewCell.h"
#import "CategoryStoreTableViewCell.h"

#import "CategoryModal.h"
#import "CategoryHotModal.h"
#import "CategoryStoreModal.h"

#import "AllCategoryViewController.h"

@interface CategoryViewController : VibeViewController<CategorySearchViewDelegate, CategoryHotTableViewCellDelegate, CagoryCateTableViewCellDelegate, CategoryBottomTableViewCellDelegate, CategoryStoreTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIImageView * _headerView;
    
    CategorySearchView * _searchView;
    
    UITableView * _categoryTableView;
    
    NSMutableArray     * _categoryHotArray;
    NSMutableArray     * _categorysArray;
    NSMutableArray     * _categoryStoresArray;
    
    UIView             * _categoryFooterView;
}

@property(nonatomic, retain) UIViewController  *currentVC;


@end
