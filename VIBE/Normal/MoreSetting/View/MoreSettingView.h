//
//  MoreSettingView.h
//  VIBE
//
//  Created by Li Haii on 2017/1/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MoreSettingTableViewCell.h"

@protocol MoreSettingViewDelegate;

@interface MoreSettingView : UIView<UITableViewDelegate, UITableViewDataSource, MoreSettingTableViewCellDelegate>
{
    float         _singleSettingCellHeight;
    
    float         _settingTableHeaderHeight;
    
    float         _cancleBtnWidth;

    NSInteger     _showCellNumbers;//显示设置的cell数量
    
    UIView      * _backView;
    UITableView * _settingTableView;
    UIButton    * _cancleSettingBtn;
}

@property (weak, nonatomic) id<MoreSettingViewDelegate> delegateee;

-(void)showSettingView;

-(void)hideSettingView;

@end

@protocol MoreSettingViewDelegate <NSObject>

-(void)moreSettingViewDidHide;

-(void)moreSettingDidTapIndex:(NSInteger )index;

@end
