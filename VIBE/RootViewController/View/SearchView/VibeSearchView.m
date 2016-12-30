//
//  VibeSearchView.m
//  VIBE
//
//  Created by Li Haii on 2016/12/29.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeSearchView.h"

@implementation VibeSearchView

- (instancetype)initWithFrame:(CGRect)frame WithSingleItemHeight:(float )singleHeight;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setHidden:YES];
        
        [self setUserInteractionEnabled:YES];
        
        UIBlurEffect * filterBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _searchBlurBackView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, height_headerview, kScreenWidth, kScreenHeight - height_headerview)];
        [_searchBlurBackView setEffect:filterBlurEffect];
        [_searchBlurBackView setAlpha:0.0f];
        _searchBlurBackView.userInteractionEnabled = YES;
        UITapGestureRecognizer * searchBlurTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapSearchBlurView:)];
        [_searchBlurBackView addGestureRecognizer:searchBlurTap];
        [self addSubview:_searchBlurBackView];
        
        _searchBarView = [[UIView alloc]initWithFrame:CGRectMake(15, -33, kScreenWidth -30, 33)];
        [_searchBarView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_searchBarView];
        
    }
    return self;
}

-(void)showSearchView
{
    [self setHidden:NO];
    
    [UIView animateWithDuration:0.15f animations:^{
        
        [_searchBlurBackView setAlpha:1.0f];
        [_searchBarView setFrame:CGRectMake(15, 24, kScreenWidth -30, 33)];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideSearchView
{
    [UIView animateWithDuration:0.15f animations:^{
        
        [_searchBlurBackView setAlpha:0.0f];
        [_searchBarView setFrame:CGRectMake(15, -33, kScreenWidth -30, 33)];
        
    } completion:^(BOOL finished) {
        
        [self setHidden:YES];
        
        if ([_delegateee respondsToSelector:@selector(searchViewDidHide)]) {
            [_delegateee searchViewDidHide];
        }
        
    }];
}

#pragma mark - 点击毛玻璃背景
-(void)didTapSearchBlurView:(UITapGestureRecognizer *)tappp
{
    [self hideSearchView];
}






@end
