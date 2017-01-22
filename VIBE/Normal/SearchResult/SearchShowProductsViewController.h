//
//  SearchShowProductsViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/1/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "SearchProductTableViewCell.h"

#import "ProductDetailViewController.h"

@interface SearchShowProductsViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, SearchProductTableViewCellDelegate>
{
    NSMutableArray      * _productsArray;
    UITableView         * _resultsTableView;
    
    UIView              * _sectionFooterView;
}

@property(retain, nonatomic)NSString * searchKeyword;


@end
