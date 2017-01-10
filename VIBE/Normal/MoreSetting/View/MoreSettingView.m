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
     
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        [_backView setBackgroundColor:[UIColor redColor]];
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
        
        _settingTableHeaderHeight = (kScreenHeight -_singleSettingCellHeight *8)/2;
        
        
        _settingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_settingTableView setBackgroundView:nil];
        [_settingTableView setBackgroundColor:[UIColor clearColor]];
        [_settingTableView setDelegate:self];
        [_settingTableView setDataSource:self];
        [_settingTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _settingTableView.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
        _settingTableView.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
        [self addSubview:_settingTableView];
        
        
        float cancleBtnWidth = 41;
        _cancleSettingBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -cancleBtnWidth)/2, kScreenHeight -cancleBtnWidth -(_settingTableHeaderHeight -cancleBtnWidth)/2, cancleBtnWidth, cancleBtnWidth)];
        [_cancleSettingBtn setBackgroundImage:[UIImage imageNamed:@"Setting_Cancle"] forState:UIControlStateNormal];
        [_cancleSettingBtn addTarget:self action:@selector(cancleSettingBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_cancleSettingBtn];
        
    }
    return self;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreSettingCellIdentifier"];
    if (cell == nil) {
        cell = [[MoreSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreSettingCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
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

    [UIView animateWithDuration:0.8f animations:^{
        
        [_backView setAlpha:1.0f];
        [_backView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideSettingView
{
    [UIView animateWithDuration:0.8f animations:^{
        
        [_backView setAlpha:0.0f];
        [_backView setFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        
    } completion:^(BOOL finished) {
        
        [self setHidden:YES];
        
        if ([_delegateee respondsToSelector:@selector(moreSettingViewDidHide)]) {
            [_delegateee moreSettingViewDidHide];
        }
        
    }];
}


#pragma mark -点击取消
-(void)cancleSettingBtnClicked
{
    [self hideSettingView];
}


@end
