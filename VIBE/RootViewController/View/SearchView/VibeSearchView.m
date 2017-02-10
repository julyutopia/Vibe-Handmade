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
        
        _searchBlurBackView = [[UIERealTimeBlurView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_searchBlurBackView setAlpha:0.4f];
        [_searchBlurBackView setTintColor:RGBA(255, 255, 255, 10)];
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
        [_searchView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_searchView];

        CAGradientLayer * gradientViewLayer = [CAGradientLayer layer];
        gradientViewLayer.frame = CGRectMake(0, 0, kScreenWidth, _maxSearchContentHeight);
        gradientViewLayer.startPoint = CGPointMake(0.3, 0.0);
        gradientViewLayer.endPoint = CGPointMake(0.7, 1.0);
        gradientViewLayer.colors = @[
                                     (id)RGB(104, 208, 212).CGColor,
                                     (id)RGB(161, 253, 218).CGColor,
                                     ];
        [_searchView.layer addSublayer:gradientViewLayer];
        
        //设置阴影
        [_searchView.layer setShadowColor:RGBA(117, 184, 158, 80).CGColor];
        [_searchView.layer setShadowOffset:CGSizeMake(0, 1)];
        [_searchView.layer setShadowRadius:2.0f];
        [_searchView.layer setShadowOpacity:0.4f];
        
        
        _searchCancleGapLine = [[UIView alloc]initWithFrame:CGRectMake(15, _maxSearchContentHeight -38, kScreenWidth -30, 1)];
        [_searchCancleGapLine setBackgroundColor:RGBA(255, 255, 255, 80)];
        [_searchCancleGapLine.layer setCornerRadius:1];
        [_searchView addSubview:_searchCancleGapLine];
        
        _searchCancleBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -175)/2, _maxSearchContentHeight -30, 175, 25)];
        [_searchCancleBtn setBackgroundImage:[UIImage imageNamed:@"Search_Cancle"] forState:UIControlStateNormal];
        [_searchCancleBtn addTarget:self action:@selector(searchViewCancle:) forControlEvents:UIControlEventTouchUpInside];
        [_searchCancleBtn setAlpha:0.0f];
        [_searchView addSubview:_searchCancleBtn];
        
        
        _searchBar = [[VibeSearchBar alloc]initWithFrame:CGRectMake(15, 24, kScreenWidth -30, 33)];
        [_searchBar setDelegateee:self];
        [_searchView addSubview:_searchBar];
        
      
        _searchContentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 24 +33 +10, kScreenWidth, _maxSearchContentHeight -(24 +33 +30 +25))];
        [_searchContentView setBackgroundColor:[UIColor clearColor]];
        [_searchContentView setAlpha:0.0f];
        [_searchView addSubview:_searchContentView];
        
        
        _recentSearchTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 100, 18)];
        [_recentSearchTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_recentSearchTitleLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_recentSearchTitleLabel setText:@"历史搜索"];
        [_recentSearchTitleLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:13]];
        [_searchContentView addSubview:_recentSearchTitleLabel];
        
        
        _cleanRecentSearchBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -15 -41, 12, 42, 17)];
        [_cleanRecentSearchBtn setBackgroundImage:[UIImage imageNamed:@"Search_Clean"] forState:UIControlStateNormal];
        [_cleanRecentSearchBtn setBackgroundImage:[UIImage imageNamed:@"Search_Clean_Highlight"] forState:UIControlStateHighlighted];
        [_cleanRecentSearchBtn setHidden:YES];
        [_cleanRecentSearchBtn addTarget:self action:@selector(cleanRecentSearch) forControlEvents:UIControlEventTouchUpInside];
        [_searchContentView addSubview:_cleanRecentSearchBtn];
        
        //显示历史搜索词
        _recentSearchTagView = [[VibeSearchTagsView alloc]init];
        [_recentSearchTagView setDelegate:self];
        _recentSearchTagView.backgroundColor = [UIColor clearColor];
        [_recentSearchTagView setHidden:YES];
        [_searchContentView addSubview:_recentSearchTagView];
        
        
        _hotSearchTitleLabel = [[UILabel alloc]init];
         [_hotSearchTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_hotSearchTitleLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_hotSearchTitleLabel setText:@"热门搜索"];
        [_hotSearchTitleLabel setHidden:YES];
        [_hotSearchTitleLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:13]];
        [_searchContentView addSubview:_hotSearchTitleLabel];
        

        //显示热门搜索词
        _hotSearchTagView = [[VibeSearchTagsView alloc]init];
        [_hotSearchTagView setDelegate:self];
        _hotSearchTagView.backgroundColor = [UIColor clearColor];
        [_hotSearchTagView setHidden:YES];
        [_searchContentView addSubview:_hotSearchTagView];
    }
    
    return self;
}


-(void)showSearchView
{
    [self setHidden:NO];
    
    [self setDataContent];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

    [UIView animateWithDuration:0.20f animations:^{
        
        [_searchBlurBackView setAlpha:1.0f];
        [_searchView setFrame:CGRectMake(0, 0, kScreenWidth, _maxSearchContentHeight)];
        
    } completion:^(BOOL finished) {

        [_searchBar showSearchBar];

        [UIView animateWithDuration:0.15f animations:^{
            [_searchContentView setAlpha:1.0f];
        }completion:^(BOOL finished)
        {
            }];
        
        [_searchCancleBtn setAlpha:1.0f];
    }];
}

-(void)hideSearchView
{
    if ([_delegateee respondsToSelector:@selector(searchViewDidHide)]) {
        [_delegateee searchViewDidHide];
    }
    
    [_searchBar hideSearchBar];
    
    [UIView animateWithDuration:0.25f animations:^{
        
        [_searchBlurBackView setAlpha:0.0f];
        [_searchView setFrame:CGRectMake(0, -_maxSearchContentHeight, kScreenWidth, _maxSearchContentHeight)];
        
        [_searchCancleBtn setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        [_searchContentView setAlpha:0.0f];

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

#pragma mark - 搜索关键字
-(void)searchBarDidSearch:(NSString *)searchKeyword
{
    if ([_delegateee respondsToSelector:@selector(searchViewDidSearch:)]) {
        
        //缓存搜索关键字
        if (![[NSUserDefaults standardUserDefaults]objectForKey:RecentSearchWords]) {
            NSMutableArray * array = [[NSMutableArray alloc]init];
            [array addObject:searchKeyword];
            [[NSUserDefaults standardUserDefaults]setObject:array forKey:RecentSearchWords];
        }
        else{
            NSArray * localSearchHistoryArray = (NSArray *)[[NSUserDefaults standardUserDefaults]objectForKey:RecentSearchWords];
            
            NSMutableArray * arrayyy = [NSMutableArray arrayWithArray:localSearchHistoryArray];
            [arrayyy insertObject:searchKeyword atIndex:0];
            
            if (arrayyy.count >8) {
                arrayyy = (NSMutableArray *)[arrayyy subarrayWithRange:NSMakeRange(0, 8)];
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:arrayyy forKey:RecentSearchWords];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }

        [self hideSearchView];
        [_delegateee searchViewDidSearch:searchKeyword];
    }
}


#pragma mark -初始化数据
-(void)setDataContent
{
    //历史搜索关键词
    if (!_recentSearchArray) {
        _recentSearchArray = [[NSMutableArray alloc]init];
    }
    [_recentSearchArray removeAllObjects];

    if ([[NSUserDefaults standardUserDefaults]objectForKey:RecentSearchWords]) {
        NSArray * localSearchHistoryArray = (NSArray *)[[NSUserDefaults standardUserDefaults]objectForKey:RecentSearchWords];
        [_recentSearchArray addObjectsFromArray:localSearchHistoryArray];
    }
    
    [_recentSearchTagView setFrame:CGRectMake(15, 10 +18 +10, kScreenWidth - 30, 0)];
    
    //有历史记录
    if (_recentSearchArray.count) {
        
        [_cleanRecentSearchBtn setHidden:NO];
        
        [_recentSearchTagView setHidden:NO];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0; i < _recentSearchArray.count; i ++) {
            UIButton *button = [_recentSearchTagView creatSelectableButton:_recentSearchArray[i] gap:10];
            [tempArray addObject:button];
        }
        [_recentSearchTagView setupWithViewsArray:tempArray maxWidth:kScreenWidth - 30 hGap:15 vGap:15];
    }
    ///无历史记录
    else{
        [_cleanRecentSearchBtn setHidden:YES];
        [_recentSearchTagView setHidden:YES];
    }
    
    _showHotSearchOriginY = _recentSearchTagView.frame.origin.y +_recentSearchTagView.frame.size.height +10;
    
    [_hotSearchTitleLabel setFrame:CGRectMake(15, _showHotSearchOriginY, 100, 18)];
    [_hotSearchTitleLabel setHidden:NO];
    
    //热门搜索关键词
    if (!_hotSearchArray) {
        _hotSearchArray = [[NSMutableArray alloc]initWithObjects:@"手工家具",@"Macrame",@"嬉皮风格",@"异域风",@"水晶首饰",@"旅行", nil];
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < _hotSearchArray.count; i ++) {
        UIButton *button = [_hotSearchTagView creatSelectableButton:_hotSearchArray[i] gap:10];
        [tempArray addObject:button];
    }
    [_hotSearchTagView setFrame:CGRectMake(15, _showHotSearchOriginY +18 +10, kScreenWidth - 30, 0)];
    [_hotSearchTagView setupWithViewsArray:tempArray maxWidth:kScreenWidth - 30 hGap:15 vGap:15];
    [_hotSearchTagView setHidden:NO];

    float contentSizeHeight = _showHotSearchOriginY +18 +10 +_hotSearchTagView.frame.size.height +10;
    
    [_searchContentView setContentSize:CGSizeMake(kScreenWidth -30, contentSizeHeight +70)];
}


#pragma mark -点击清空历史记录
-(void)cleanRecentSearch
{
    [_cleanRecentSearchBtn setHidden:YES];
    
    _showHotSearchOriginY = _recentSearchTagView.frame.origin.y;
    
    //隐藏历史记录
    [UIView animateWithDuration:0.25 animations:^{
        
        [_recentSearchTagView setAlpha:0.0f];
        
    }completion:^(BOOL finished) {
        
        float contentSizeHeight = _showHotSearchOriginY +18 +10 +_hotSearchTagView.frame.size.height +10;
        [_searchContentView setContentSize:CGSizeMake(kScreenWidth -30, contentSizeHeight +70)];
        
        [UIView animateWithDuration:0.15 animations:^{
            
            [_hotSearchTitleLabel setFrame:CGRectMake(15, _showHotSearchOriginY, 100, 18)];
            [_hotSearchTagView setFrame:CGRectMake(15, _showHotSearchOriginY +18 +10, kScreenWidth - 30, _hotSearchTagView.frame.size.height)];
        }];
        
        [_recentSearchTagView setHidden:YES];
        [_recentSearchTagView setAlpha:1.0f];
    }];
    
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:RecentSearchWords];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

#pragma mark -点击SearchTagView的代理方法
-(void)didClickSearchKeyWord:(NSString *)searchWord
{
    [_searchBar resignSearchTextField];
    
    if ([_delegateee respondsToSelector:@selector(searchViewDidSearch:)]) {
        [_delegateee searchViewDidSearch:searchWord];
    }
    [self hideSearchView];
}


@end
