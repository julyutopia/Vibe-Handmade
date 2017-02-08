//
//  MineViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.topNavView setHidden:YES];
    
    [self setNeedsStatusBarAppearanceUpdate];

    _backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_backImgView setImage:[UIImage imageNamed:@"Mine_Background_Image"]];
    [self.view addSubview:_backImgView];
    

    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:self.view.frame];
    [backView setEffect:blurEffect];
    [self.view addSubview:backView];
    
    
    _headerViewHeight = 147;
    
    float _headerViewOriginY = 0.0;
    if (iPhone4) {
        _headerViewOriginY = 50;
    }
    if (iPhone5) {
        _headerViewOriginY = 55;
    }
    if (iPhone6) {
        _headerViewOriginY = 70;
    }
    if (iPhone6plus) {
        _headerViewOriginY = 80;
    }
    
    float tableBackViewHeight = (float)_headerViewOriginY/2;
    
    _tableBackView = [[UIView alloc]initWithFrame:CGRectMake(10, _headerViewOriginY +_headerViewHeight, kScreenWidth -20, kScreenHeight -_headerViewOriginY -_headerViewHeight -tableBackViewHeight)];
    [_tableBackView setBackgroundColor:RGBA(255, 255, 255, 88)];
    [self.view addSubview:_tableBackView];
    
    UIBezierPath *tableMaskPath = [UIBezierPath bezierPathWithRoundedRect:_tableBackView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *tableMaskLayer = [[CAShapeLayer alloc] init];
    tableMaskLayer.frame = _tableBackView.bounds;
    tableMaskLayer.path = tableMaskPath.CGPath;
    _tableBackView.layer.mask = tableMaskLayer;
    
    
    //顶部固定的View
    _headerBackView = [[UIView alloc]initWithFrame:CGRectMake(10, _headerViewOriginY, kScreenWidth -20, _headerViewHeight)];
    [_headerBackView setBackgroundColor:RGBA(255, 255, 255, 93)];
    [self.view addSubview:_headerBackView];
    
    [_headerBackView.layer setShadowColor:RGBA(140, 188, 244, 20).CGColor];
    [_headerBackView.layer setShadowOffset:CGSizeMake(0, 2)];
    [_headerBackView.layer setShadowOpacity:0.8];
    [_headerBackView.layer setShadowRadius:8.0f];

    CGRect headerShadowBounds = CGRectMake(0, 0, _headerBackView.bounds.size.width,  _headerBackView.bounds.size.height +10);
    
    UIBezierPath *headerMaskPath = [UIBezierPath bezierPathWithRoundedRect:headerShadowBounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *headerMaskLayer = [[CAShapeLayer alloc] init];
    headerMaskLayer.frame = headerShadowBounds;
    headerMaskLayer.path = headerMaskPath.CGPath;
    _headerBackView.layer.mask = headerMaskLayer;
    
    
    
    //用户头像
    float avatarWidth = 0.0;
    if (iPhone4 || iPhone5) {
        avatarWidth = 50;
    }
    if (iPhone6) {
        avatarWidth = 65;
    }
    if (iPhone6plus) {
        avatarWidth = 80;
    }
    float avatarOriginY = _headerViewOriginY -avatarWidth/2;
    _avatarImgView = [[GLImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -avatarWidth)/2, avatarOriginY, avatarWidth, avatarWidth)];
    [_avatarImgView setBackgroundColor:RGBA(255, 255, 255, 98)];
    [_avatarImgView.layer setCornerRadius:avatarWidth/2];
    [_avatarImgView.layer setMasksToBounds:YES];
    [self.view addSubview:_avatarImgView];
    
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Cancle_White"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.backBtn];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setFrame:CGRectMake(kScreenWidth -15 -18, 30, 18, 18)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"More_Setting"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.rightButton];

    
    [self setContentData];
    
}




-(void)setContentData
{
    if (!_userProfileModal) {
        _userProfileModal = [[MineProfileModal alloc]init];
    }
    
    [_userProfileModal setUserAvatarImgURL:@"http://img.xiami.net/images/artistlogo/37/14701379266237_2.jpg"];
    [_userProfileModal setUserName:@"里海Lihaii"];
    [_userProfileModal setUserDescribe:@"每个不曾起舞的日子，都是对生命的辜负"];
}



-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
