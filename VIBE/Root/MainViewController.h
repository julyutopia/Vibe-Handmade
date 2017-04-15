//
//  MainViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/5.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LUNSegmentedControl.h"

#import "NewRecommandTableView.h"
#import "NewDiscoverTableView.h"
#import "NewCreatorTableView.h"

#import "VibeSearchView.h"

#import "SearchResultViewController.h"
#import "ItemDetailViewController.h"
#import "CategoryListViewController.h"
#import "TagLIstViewController.h"

#import "TopicDetailViewController.h"

@interface MainViewController : UIViewController<UIScrollViewDelegate, LUNSegmentedControlDataSource, LUNSegmentedControlDelegate, NewRecommandTableViewDelegate, NewDiscoverTableViewDelegate, NewCreatorTableViewDelegate, VibeSearchViewDelegate>
{
    UIView                  * _backView;
    
    UIView                  * _navigationView;
    
    UIButton                * _profileBtn;
    UIButton                * _searchBtn;
    
    LUNSegmentedControl     * _naviSegmentControl;
    
    UIScrollView            * _rootScrollView;
    
    UIView                  * _recommandView;
    NewRecommandTableView   * _recommandTableView;
    
    UIView                  * _discoverView;
    NewDiscoverTableView    * _discoverTableView;
    
    UIView                  * _creatorView;
    NewCreatorTableView     * _creatorTableView;
    
    
    VibeSearchView          * _searchView;//搜索页面
    
}

@end


