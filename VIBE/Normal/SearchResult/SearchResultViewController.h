//
//  SearchResultViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/1/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "VibeSearchView.h"

#import "SearchProductsHeaderTableViewCell.h"
#import "SearchTopicHeaderTableViewCell.h"

#import "ProductDetailViewController.h"
#import "TopicDetailViewController.h"

#import "SearchShowProductsViewController.h"
#import "SearchShowTopicsViewController.h"

@interface SearchResultViewController : VibeViewController<VibeSearchViewDelegate, UITableViewDelegate, UITableViewDataSource, SearchProductTableViewCellDelegate, SearchProductsAllTableViewCellDelegate, SearchTopicTableViewCellDelegate, SearchTopicAllTableViewCellDelegate>
{
    VibeSearchView      * _searchView;
    
    NSMutableArray      * _productsArray;
    NSMutableArray      * _topicsArray;

    UITableView         * _resultsTableView;
    
    UIView              * _sectionFooterView;
}

@property(retain, nonatomic)NSString * searchKeyword;

@end
