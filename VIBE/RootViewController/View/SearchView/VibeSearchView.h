//
//  VibeSearchView.h
//  VIBE
//
//  Created by Li Haii on 2016/12/29.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VibeSearchViewDelegate;

@interface VibeSearchView : UIView
{
    UIVisualEffectView  * _searchBlurBackView;
    UIView              * _searchBarView;
    UIView              * _searchContentView;
}

@property (weak, nonatomic) id<VibeSearchViewDelegate> delegateee;

-(void)showSearchView;
-(void)hideSearchView;

@end

@protocol VibeSearchViewDelegate <NSObject>

-(void)searchViewDidHide;

@end
