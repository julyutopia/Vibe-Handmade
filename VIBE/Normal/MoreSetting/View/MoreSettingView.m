//
//  MoreSettingView.m
//  VIBE
//
//  Created by Li Haii on 2017/1/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "MoreSettingView.h"

@implementation MoreSettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setHidden:YES];
     
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [_backView setAlpha:0.0f];
        [self addSubview:_backView];
        
        if (iPhone4) {
            _singleSettingCellHeight = 40;
        }
        if (iPhone5) {
            _singleSettingCellHeight = 45;
        }
        if (iPhone6) {
            _singleSettingCellHeight = 52;
        }
        if (iPhone6plus) {
            _singleSettingCellHeight = 60;
        }
        
        //已登录，显示8条cell，最后一条为‘退出登录’
        if ([VibeAppTool isUserLogIn]) {
            _showCellNumbers = 8;
        }
        //未登录则不显示
        else{
            _showCellNumbers = 7;
        }
        
        _settingTableHeaderHeight = (kScreenHeight -_singleSettingCellHeight *_showCellNumbers)/2;
        
        
        float headerContentInset = (kScreenHeight -_singleSettingCellHeight *_showCellNumbers)/2;
        
        _settingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        [_settingTableView setBackgroundView:nil];
        [_settingTableView setBackgroundColor:[UIColor clearColor]];
        [_settingTableView setDelegate:self];
        [_settingTableView setDataSource:self];
        [_settingTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _settingTableView.contentInset = UIEdgeInsetsMake(headerContentInset, 0, 0, 0);
        _settingTableView.scrollIndicatorInsets = UIEdgeInsetsMake(headerContentInset, 0, 0, 0);
        [self addSubview:_settingTableView];
        
        
        //关闭按钮
        _cancleBtnWidth = 41;
        _cancleSettingBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -_cancleBtnWidth)/2, kScreenHeight -_cancleBtnWidth -(_settingTableHeaderHeight -_cancleBtnWidth)/2, _cancleBtnWidth, _cancleBtnWidth)];
        [_cancleSettingBtn setBackgroundImage:[UIImage imageNamed:@"Setting_Cancle"] forState:UIControlStateNormal];
        [_cancleSettingBtn addTarget:self action:@selector(clickToHideSetting) forControlEvents:UIControlEventTouchUpInside];
        [_cancleSettingBtn setAlpha:0.0f];
        [self addSubview:_cancleSettingBtn];
    }
    return self;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _showCellNumbers;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreSettingCellIdentifier"];
    if (cell == nil) {
        cell = [[MoreSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreSettingCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setBackgroundView:nil];
    }
    [cell setDelegate:self];
    
    [cell setMoreSettingCellWithIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _singleSettingCellHeight;
}

#pragma mark -显示和隐藏设置页面
-(void)showSettingView
{
    [self setHidden:NO];

    [UIView animateWithDuration:0.5f animations:^{
        
        [_backView setAlpha:1.0f];

        [_settingTableView setAlpha:1.0f];
        [_settingTableView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.15f animations:^{
            
            [_cancleSettingBtn setAlpha:1.0f];
            
        }];
        
    }];
}


#pragma mark -点击隐藏设置页面
-(void)clickToHideSetting
{
    [self hideSettingView];
    
    [self performSelector:@selector(operateDelegate) withObject:nil afterDelay:0.4f];
}

-(void)hideSettingView
{
    [UIView animateWithDuration:0.15f animations:^{
        
        [_cancleSettingBtn setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5f animations:^{
            
            [_backView setAlpha:0.0f];
            [_settingTableView setAlpha:0.0f];
            [_settingTableView setFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
            
        }completion:^(BOOL finished) {
            
            [self setHidden:YES];
            
        }];
        
    }];
}

-(void)operateDelegate
{
    if ([_delegateee respondsToSelector:@selector(moreSettingViewDidHide)]) {
        [_delegateee moreSettingViewDidHide];
    }
}

#pragma mark -SettingCell代理方法
-(void)moreSettingViewCellTapWithIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(moreSettingDidTapIndex:)]) {
        [_delegateee moreSettingDidTapIndex:index];
    }
}

-(void)moreSettingViewCellDidLogout
{
    NSLog(@"点击注销");
}

@end
