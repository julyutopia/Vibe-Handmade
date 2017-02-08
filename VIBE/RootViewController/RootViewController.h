//
//  RootViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "RecommandTableView.h"
#import "RecommandBannerModal.h"
#import "RecommandCategoryModal.h"

#import "LUNSegmentedControl.h"

#import "VibeShowMoneyView.h"

#import "CreatorTableView.h"
#import "CreatorCoverModal.h"

#import "DiscoverTableView.h"
#import "DiscoverHotTagModal.h"
#import "DiscoverTopicModal.h"

#import "MineViewController.h"

#import "WebViewController.h"
#import "CategoryListViewController.h"
#import "TopicDetailViewController.h"
#import "ProductDetailViewController.h"
#import "NewProductDetailViewController.h"

#import "SearchResultViewController.h"

#import "VibeSearchView.h"

typedef enum
{
    recommand_state = 0,     //推荐页
    creator_state = 1,      //造物者说页
    discover_state = 2,     //探索发现页
} Selected_Tab_State;

@interface RootViewController : VibeViewController <UIScrollViewDelegate,RecommandTableViewDelegate, LUNSegmentedControlDataSource, LUNSegmentedControlDelegate, VibeSearchViewDelegate>
{    
    NSInteger             _selectedIndex;
    
    UIView              * _backView;
    UIScrollView        * _rootScrollView;
    
    UIView              * _naviView;
    
    LUNSegmentedControl * _naviSegmentControl;
    
    UIButton            * _profileBtn;
    UIButton            * _searchBtn;
    
//    UIView              * _naviBackView;
    
    VibeSearchView      * _searchView;
    
    UIView              * _recommandLayerView;
    UIView              * _creatorLayerView;
    UIView              * _discoverLayerView;
    
    //首页推荐
    UIView              * _recommandView;
    RecommandTableView  * _recommandTableView;
    NSMutableDictionary * _recommandInfoDict;
    
    //造物者说
    UIView              * _creatorView;
    CreatorTableView    * _creatorTableView;
    NSMutableArray      * _creatorArray;
    
    //探索发现
    UIView              * _discoverView;
    DiscoverTableView   * _discoverTableView;
    NSMutableDictionary        * _discoverContentDict;
}


@end


