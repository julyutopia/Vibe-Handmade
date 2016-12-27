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

@interface CategoryListViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    YUSegment           * _categorySetSegment;
    
    UITableView         * _categoryProductsListTable;
    
    CategoryModal       * _categoryDetailModal;
    
    NSMutableArray      * _categoryProductsArray;
}


@end
