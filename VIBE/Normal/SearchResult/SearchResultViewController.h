//
//  SearchResultViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/1/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "VibeSearchView.h"

@interface SearchResultViewController : VibeViewController<VibeSearchViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    VibeSearchView      * _searchView;
    
    NSMutableArray      * _productsArray;
    NSMutableArray      * _topicsArray;

    UITableView         * _resultsTableView;
    
    UIView              * _topicHeaderView;
}

@property(retain, nonatomic)NSString * searchKeyword;

@end
