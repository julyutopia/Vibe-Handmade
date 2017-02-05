//
//  VibeSearchView.h
//  VIBE
//
//  Created by Li Haii on 2016/12/29.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeSearchBar.h"

#import "VibeSearchTagsView.h"

@protocol VibeSearchViewDelegate;

@interface VibeSearchView : UIView<VibeSearchBarDelegate, VibeSearchTagsViewDelegate>
{
    UIERealTimeBlurView  * _searchBlurBackView;
    
    float                 _maxSearchContentHeight;

    UIView              * _searchView;
        
    VibeSearchBar       * _searchBar;
    
    UIImageView         * _searchBtnImgView;
    
    UIView              * _searchCancleGapLine;
    UIButton            * _searchCancleBtn;
    
    UIScrollView        * _searchContentView;
    
    NSMutableArray      * _recentSearchArray;
    NSMutableArray      * _hotSearchArray;
    
    UILabel             * _recentSearchTitleLabel;
    UIButton            * _cleanRecentSearchBtn;
    
    VibeSearchTagsView  * _recentSearchTagView;
    
    UILabel             * _hotSearchTitleLabel;
    
    float                 _showHotSearchOriginY;
    float                 _showHotSearchContentHeight;
        
    VibeSearchTagsView  * _hotSearchTagView;
}

@property (weak, nonatomic) id<VibeSearchViewDelegate> delegateee;

-(void)showSearchView;
-(void)hideSearchView;

@end

@protocol VibeSearchViewDelegate <NSObject>

-(void)searchViewDidHide;

-(void)searchViewDidSearch:(NSString *)keyword;

@end
