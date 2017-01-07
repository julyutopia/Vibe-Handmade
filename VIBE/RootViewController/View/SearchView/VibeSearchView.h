//
//  VibeSearchView.h
//  VIBE
//
//  Created by Li Haii on 2016/12/29.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeSearchBar.h"

@protocol VibeSearchViewDelegate;

@interface VibeSearchView : UIView<VibeSearchBarDelegate>
{
    UIVisualEffectView  * _searchBlurBackView;
    
    float                 _maxSearchContentHeight;

    UIView              * _searchView;
    
    VibeSearchBar       * _searchBar;
    
    UIView              * _searchCancleGapLine;
    UIButton            * _searchCancleBtn;
    
    UIView              * _searchContentView;
    
    
}

@property (weak, nonatomic) id<VibeSearchViewDelegate> delegateee;

-(void)showSearchView;
-(void)hideSearchView;

@end

@protocol VibeSearchViewDelegate <NSObject>

-(void)searchViewDidHide;

-(void)searchViewDidSearch:(NSString *)keyword;

@end
