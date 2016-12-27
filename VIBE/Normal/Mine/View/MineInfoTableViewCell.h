//
//  MineInfoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MineProfileModal.h"

@protocol MineInfoTableViewCellDelegate;

@interface MineInfoTableViewCell : UITableViewCell
{
    UIView      * _backView;
    
    UIView      * _avatarBackView;
    UIImageView * _avatarImgView;

    UIButton    * _messageBtn;
    UIButton    * _settingBtn;
    
    UILabel     * _userNameLabel;
    UILabel     * _userSignLabel;
    
    UIView      * _followInfoView;
    
    UIImageView * _followingImgView;
    UILabel     * _followingNumberLabel;
    
    UIView      * _followGapLine;
    
    UIImageView * _followedImgView;
    UILabel     * _followedNumberLabel;
}

@property (weak, nonatomic) id<MineInfoTableViewCellDelegate> delegate;

-(void)setMineInfoCellWithModal:(MineProfileModal *)modal;

@end

@protocol MineInfoTableViewCellDelegate <NSObject>

//点击进入消息
-(void)mineInfoCellClickMessage;

//点击进入设置
-(void)mineInfoCellClickSetting;

//点击显示全部关注
-(void)mineInfoCellClickFollowing;

//点击显示全部粉丝
-(void)mineInfoCellClickFans;


@end








