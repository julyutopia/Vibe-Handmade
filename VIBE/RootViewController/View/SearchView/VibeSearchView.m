//
//  VibeSearchView.m
//  VIBE
//
//  Created by Li Haii on 2016/12/29.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeSearchView.h"

@implementation VibeSearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setHidden:YES];
        
        [self setUserInteractionEnabled:YES];
        
        UIBlurEffect * filterBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        _searchBlurBackView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_searchBlurBackView setEffect:filterBlurEffect];
        [_searchBlurBackView setAlpha:0.0f];
        [self addSubview:_searchBlurBackView];
        
        //根据设备取得键盘高度
        float maxKeyBoardHeight;
        if (iPhone5) {
            maxKeyBoardHeight = 253;
        }
        else if (iPhone6){
            maxKeyBoardHeight = 258;
        }
        else if (iPhone6plus){
            maxKeyBoardHeight = 271;
        }
        
        _maxSearchContentHeight = kScreenHeight - maxKeyBoardHeight -60;
        
        
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, -_maxSearchContentHeight, kScreenWidth, _maxSearchContentHeight)];
        [_searchView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_searchView];
        
        _searchCancleGapLine = [[UIView alloc]initWithFrame:CGRectMake(40, _maxSearchContentHeight -38, kScreenWidth -80, 2)];
        [_searchCancleGapLine setBackgroundColor:RGBA(243, 243, 243, 20)];
        [_searchCancleGapLine.layer setCornerRadius:1];
        [_searchView addSubview:_searchCancleGapLine];
        
        _searchCancleBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -175)/2, _maxSearchContentHeight -30, 175, 25)];
        [_searchCancleBtn setBackgroundImage:[UIImage imageNamed:@"Search_Cancle"] forState:UIControlStateNormal];
        [_searchCancleBtn addTarget:self action:@selector(searchViewCancle:) forControlEvents:UIControlEventTouchUpInside];
        [_searchCancleBtn setAlpha:0.0f];
        [_searchView addSubview:_searchCancleBtn];
        
        _searchBar = [[VibeSearchBar alloc]initWithFrame:CGRectMake(15, 24, kScreenWidth -30, 33)];
        [_searchBar setDelegateee:self];
        [self addSubview:_searchBar];
        
    }
    return self;
}

-(void)showSearchView
{
    [self setHidden:NO];
    
    [UIView animateWithDuration:0.35f animations:^{
        
        [_searchBlurBackView setAlpha:1.0f];
        [_searchView setFrame:CGRectMake(0, 0, kScreenWidth, _maxSearchContentHeight)];
        
        [_searchBar showSearchBar];
      
        [_searchCancleBtn setAlpha:1.0f];
        
    } completion:^(BOOL finished) {

    }];
}

-(void)hideSearchView
{
    if ([_delegateee respondsToSelector:@selector(searchViewDidHide)]) {
        [_delegateee searchViewDidHide];
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        
        [_searchBlurBackView setAlpha:0.0f];
        [_searchView setFrame:CGRectMake(0, -_maxSearchContentHeight, kScreenWidth, _maxSearchContentHeight)];
        
        [_searchCancleBtn setAlpha:0.0f];
        
        [_searchBar hideSearchBar];

    } completion:^(BOOL finished) {
        
        [self setHidden:YES];
    }];
    
}



-(void)showBackViewShadow
{
    [_searchView.layer setShadowColor:RGBA(0, 0, 0, 18).CGColor];
    [_searchView.layer setShadowOffset:CGSizeMake(0, 1)];
    [_searchView.layer setShadowOpacity:0.6f];
    [_searchView.layer setShadowRadius:4.0f];
}

-(void)hideBackViewShadow
{
    [_searchView.layer setShadowColor:[UIColor clearColor].CGColor];
    [_searchView.layer setShadowOffset:CGSizeMake(0, 0)];
    [_searchView.layer setShadowOpacity:0.0f];
    [_searchView.layer setShadowRadius:4.0f];
}


#pragma mark -点击 退出搜索
-(void)searchViewCancle:(UIButton *)btn
{
    [self hideSearchView];
}

#pragma mark - 点击搜索关键字
-(void)searchBarDidSearch:(NSString *)searchKeyword
{
    if ([_delegateee respondsToSelector:@selector(searchViewDidSearch:)]) {
        
        [self hideSearchView];
        [_delegateee searchViewDidSearch:searchKeyword];
    }
}





@end
