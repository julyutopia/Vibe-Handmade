//
//  MineInfoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineInfoTableViewCell.h"

@implementation MineInfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
//        _backView = [[UIView alloc]initWithFrame:CGRectZero];
//        [_backView setUserInteractionEnabled:YES];
//        [_backView setBackgroundColor:[UIColor orangeColor]];
//        [self addSubview:_backView];
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

        _avatarBackView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_avatarBackView setFrame:CGRectMake( (kScreenWidth -73)/2, 30, 73, 73)];
        [_avatarBackView setAlpha:0.3f];
        [_avatarBackView.layer setCornerRadius:73/2];
        [_avatarBackView.layer setMasksToBounds:YES];
        [self addSubview:_avatarBackView];
        
        
        _avatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth -67)/2, 30 +3, 67, 67)];
        [_avatarImgView.layer setCornerRadius:67/2];
        [_avatarImgView.layer setMasksToBounds:YES];
        [_avatarImgView setContentMode:UIViewContentModeScaleToFill];
        [_avatarImgView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_avatarImgView];
        
        
        
        float msgBtnWidth = 22;
        float msgBtnHeight = 22;
        _messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 12, msgBtnWidth, msgBtnHeight)];
        [_messageBtn setBackgroundImage:[UIImage imageNamed:@"Mine_Message"] forState:UIControlStateNormal];
        [_messageBtn addTarget:self action:@selector(tapMessageBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_messageBtn];

        
        float settingBtnWidth = 22;
        float settingBtnHeight = 22;
        
        _settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -settingBtnWidth -12, 12, settingBtnWidth, settingBtnHeight)];
        [_settingBtn setBackgroundImage:[UIImage imageNamed:@"Mine_Setting"] forState:UIControlStateNormal];
        [_settingBtn addTarget:self action:@selector(tapSettingBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_settingBtn];
        
        
        NSString * userName = @"用户名";
        UIFont * userNameFont = [VibeFont fontWithName:Default_Font size:16];

        NSString * userSign = @"签名";
        UIFont * userSignFont = [VibeFont fontWithName:Default_Font size:12];
        
        CGSize nameSize = [userName getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 22) withFont:userNameFont];
        CGSize signSize = [userSign getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 22) withFont:userSignFont];
        
        
        _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 30 +73 +10, kScreenWidth -30, nameSize.height)];
        [_userNameLabel setBackgroundColor:[UIColor clearColor]];
        [_userNameLabel setTextAlignment:NSTextAlignmentCenter];
        [_userNameLabel setTextColor:[UIColor whiteColor]];
        [_userNameLabel setFont:userNameFont];
        [_userNameLabel.layer setShadowOffset:CGSizeMake(1, 1)];
        [_userNameLabel.layer setShadowColor:RGBA(2, 110, 91, 60).CGColor];
        [self addSubview:_userNameLabel];
       
        
        _userSignLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 30 +73 +10 +nameSize.height +10, kScreenWidth -30, signSize.height)];
        [_userSignLabel setBackgroundColor:[UIColor clearColor]];
        [_userSignLabel setTextAlignment:NSTextAlignmentCenter];
        [_userSignLabel setTextColor:RGB(244, 244, 244)];
        [_userSignLabel setFont:userSignFont];
        [_userSignLabel.layer setShadowOffset:CGSizeMake(1, 1)];
        [_userSignLabel.layer setShadowColor:RGBA(0, 0, 0, 60).CGColor];
        [self addSubview:_userSignLabel];
        
        
        _followInfoView = [[UIView alloc]initWithFrame:CGRectZero];
        [_followInfoView setBackgroundColor:[UIColor clearColor]];
        [_followInfoView setUserInteractionEnabled:YES];
        [self addSubview:_followInfoView];
        
        
        
        
        NSString * followCount = @"100";
        UIFont * font = [VibeFont fontWithName:Default_Number_Font size:18];
        
        CGSize followFontSize = [followCount getSizeWithLimitSize:CGSizeMake(100, 30) withFont:font];
        
        [_followInfoView setFrame:CGRectMake(0, 30 +73 +10 +nameSize.height +10 +signSize.height +20, kScreenWidth, followFontSize.height +4)];
        
        
        _followingNumberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_followingNumberLabel setBackgroundColor:[UIColor clearColor]];
        [_followingNumberLabel setFont:font];
        [_followingNumberLabel setTextColor:[UIColor whiteColor]];
        [_followingNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [_followInfoView addSubview:_followingNumberLabel];
        
        _followingImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [_followingImgView setImage:[UIImage imageNamed:@"Mine_Following"]];
        [_followingImgView setContentMode:UIViewContentModeScaleAspectFit];
        [_followInfoView addSubview:_followingImgView];
        
        
        _followGapLine = [[UIView alloc]initWithFrame:CGRectMake( (kScreenWidth -3)/2, 7, 1, followFontSize.height +4 -14)];
        [_followGapLine.layer setCornerRadius:2];
        [_followGapLine setBackgroundColor:RGBA(244, 244, 244, 90)];
        [_followInfoView addSubview:_followGapLine];
        
        
        _followedNumberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_followedNumberLabel setBackgroundColor:[UIColor clearColor]];
        [_followedNumberLabel setFont:font];
        [_followedNumberLabel setTextColor:[UIColor whiteColor]];
        [_followedNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [_followInfoView addSubview:_followedNumberLabel];
        
        _followedImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [_followedImgView setImage:[UIImage imageNamed:@"Mine_Fans"]];
        [_followInfoView addSubview:_followedImgView];
        
        
        
        UITapGestureRecognizer * followingTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(followingDidTap)];
        [_followingImgView setUserInteractionEnabled:YES];
        [_followingImgView addGestureRecognizer:followingTap];
        
        UITapGestureRecognizer * followingTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(followingDidTap)];
        [_followingNumberLabel setUserInteractionEnabled:YES];
        [_followingNumberLabel addGestureRecognizer:followingTap1];
        
        
        UITapGestureRecognizer * followedTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(followedDidTap)];
        [_followedNumberLabel setUserInteractionEnabled:YES];
        [_followedNumberLabel addGestureRecognizer:followedTap];
        
        UITapGestureRecognizer * followedTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(followedDidTap)];
        [_followedImgView setUserInteractionEnabled:YES];
        [_followedImgView addGestureRecognizer:followedTap1];
        
    }
    
    return self;
}



-(void)setMineInfoCellWithModal:(MineProfileModal *)modal
{
    [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:modal.userAvatarImgURL] placeholderImage:nil];
    [_userNameLabel setText:modal.userName];
    [_userSignLabel setText:modal.userDescribe];

    
    float followingImgSizeRate = (float )138/51;
    
    UIFont * font = [VibeFont fontWithName:Default_Number_Font size:18];
    
    NSString * followingNumber = [NSString stringWithFormat:@"%@",modal.userFollowingNumber];
    CGSize followingSize = [followingNumber getSizeWithLimitSize:CGSizeMake(200, 30) withFont:font];
    
    float followInfoViewHeight = followingSize.height +4;

    float imgHeight = followingSize.height - 3 *2;
    float imgWidth = imgHeight *followingImgSizeRate;
    
    float followingLeftOrigin = (kScreenWidth/2 -1 - (imgWidth + 2 +followingSize.width))/2;
    
    [_followingImgView setFrame:CGRectMake(followingLeftOrigin, (followInfoViewHeight -imgHeight)/2, imgWidth, imgHeight)];
    [_followingNumberLabel setFrame:CGRectMake(followingLeftOrigin +imgWidth +2, 1, followingSize.width, followingSize.height)];
    [_followingNumberLabel setText:followingNumber];
    
    
    
    NSString * followedNumber = [NSString stringWithFormat:@"%@",modal.userFollowedNumber];
    CGSize followedSize = [followedNumber getSizeWithLimitSize:CGSizeMake(200, 30) withFont:font];

    float followedImgHeight = followedSize.height - 3 *2;
    float followedImgWidth = followedImgHeight *followingImgSizeRate;
    
    
    float followedLeftOrigin = kScreenWidth/2 +(kScreenWidth/2 -1 - (followedImgWidth + 2 +followedSize.width))/2;

    [_followedImgView setFrame:CGRectMake(followedLeftOrigin, (followInfoViewHeight -followedImgHeight)/2, followedImgWidth, followedImgHeight)];
    [_followedNumberLabel setFrame:CGRectMake(followedLeftOrigin +followedImgWidth +2, 1, followedSize.width, followedSize.height)];
    [_followedNumberLabel setText:followedNumber];

}


//点击消息
-(void)tapMessageBtn
{
    if ([_delegate respondsToSelector:@selector(mineInfoCellClickMessage)]) {
        [_delegate mineInfoCellClickMessage];
    }
}

//点击设置
-(void)tapSettingBtn
{
    if ([_delegate respondsToSelector:@selector(mineInfoCellClickSetting)]) {
        [_delegate mineInfoCellClickSetting];
    }
}


//点击已关注
-(void)followingDidTap
{
    if ([_delegate respondsToSelector:@selector(mineInfoCellClickFollowing)]) {
        [_delegate mineInfoCellClickFollowing];
    }
}

//点击被关注
-(void)followedDidTap
{
    if ([_delegate respondsToSelector:@selector(mineInfoCellClickFans)]) {
        [_delegate mineInfoCellClickFans];
    }
}



@end










