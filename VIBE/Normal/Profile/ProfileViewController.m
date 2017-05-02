//
//  ProfileViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/5/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

    _profileModal = [VibeAppTool sharedInstance].userInfoModal;
    
    [self initTopView];
    
    [self initNaviView];

}


-(void)initNaviView
{
    [self.rightBtn setHidden:NO];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"More_Setting_Black_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"More_Setting_Black_Highlight"] forState:UIControlStateHighlighted];
    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_Black_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_Black_Highlight"] forState:UIControlStateHighlighted];
    
    [self.view bringSubviewToFront:self.leftBtn];
    [self.view bringSubviewToFront:self.rightBtn];
}


-(void)initTopView
{
    _showFavorViewHeight = kScreenHeight * 0.618 +50;
    _topViewHeight = kScreenHeight - _showFavorViewHeight;
    
    //显示顶部的View
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _topViewHeight)];
    [topView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:topView];
    
    
    float avatarWidth = 70;
    
    
    _backBlurAvatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(60 +5, (_topViewHeight -avatarWidth)/2 +5, avatarWidth -6, avatarWidth -6)];
    [_backBlurAvatarImgView setHidden:YES];
    [_backBlurAvatarImgView setBackgroundColor:[UIColor whiteColor]];
    [_backBlurAvatarImgView.layer setShadowColor:RGBA(100, 100, 100, 40).CGColor];
    [_backBlurAvatarImgView.layer setShadowOffset:CGSizeMake(6, 6)];
    [_backBlurAvatarImgView.layer setShadowOpacity:1.0f];
    [_backBlurAvatarImgView.layer setShadowRadius:8.0f];
    [topView addSubview:_backBlurAvatarImgView];

    _avatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, (_topViewHeight -avatarWidth)/2, avatarWidth, avatarWidth)];
    [_avatarImgView.layer setCornerRadius:4.0f];
    [_avatarImgView.layer setMasksToBounds:YES];
    [_avatarImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:_profileModal.userAvatarImgURL] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [_backBlurAvatarImgView setHidden:YES];
        [_backBlurAvatarImgView setImage:image];
    }];
    
    [topView addSubview:_avatarImgView];
    
    float textWidth = kScreenWidth -avatarWidth -60 -10 -20;

    _showTextView = [[UIView alloc]initWithFrame:CGRectMake(60 +avatarWidth +10, (_topViewHeight -avatarWidth)/2, textWidth, avatarWidth)];
    [_showTextView setBackgroundColor:[UIColor clearColor]];
    [topView addSubview:_showTextView];
    
    UIFont * userNameFont = [VibeFont fontWithName:Font_Chinese_Regular size:18];
    UIFont * signatureFont = [VibeFont fontWithName:Font_Chinese_Regular size:13];
    
    _userNameLabel = [[UILabel alloc]init];
    [_userNameLabel setTextAlignment:NSTextAlignmentLeft];
    [_userNameLabel setTextColor:Default_Text_Dark_Color_90];
    [_userNameLabel setFont:userNameFont];
    [_showTextView addSubview:_userNameLabel];
    
    _signatureLabel = [[UILabel alloc]init];
    [_signatureLabel setTextAlignment:NSTextAlignmentLeft];
    [_signatureLabel setTextColor:Default_Text_Gray_Color];
    [_signatureLabel setFont:signatureFont];
    [_signatureLabel setNumberOfLines:0];
    [_showTextView addSubview:_signatureLabel];

    NSString * userName = _profileModal.userName;
    NSString * signature = _profileModal.userSignature;
    
    [_userNameLabel setText:userName];
    [_signatureLabel setText:signature];
    
    //没有签名
    if (signature.length == 0) {
        
        [_userNameLabel setFrame:CGRectMake(0, 0, textWidth, avatarWidth)];
    }
    else{
        
        float userNameHeight = [userName getSizeWithLimitSize:CGSizeMake(textWidth, 100) withFont:userNameFont].height;
        float signaureHeight = [signature getSizeWithLimitSize:CGSizeMake(textWidth, 100) withFont:signatureFont].height;
        
        //签名超过一行
        if (signaureHeight >20) {
            [[VibeAppTool sharedInstance] setLabelSpace:_signatureLabel withText:signature withFont:signatureFont withLineSpacing:5.0f];
            signaureHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:signature withFont:_signatureLabel.font withWidth:textWidth withLineSpacing:5.0] +2.0f;
        }
        [_userNameLabel setFrame:CGRectMake(0, (avatarWidth -userNameHeight -10 -signaureHeight)/2, textWidth, userNameHeight)];
        [_signatureLabel setFrame:CGRectMake(0, _userNameLabel.frame.origin.y +userNameHeight +10, textWidth, signaureHeight)];
    }
    
    
    _sectionView = [[UIView alloc]initWithFrame:CGRectMake(60, _topViewHeight -50, kScreenWidth -60 -20, 50)];
    [_sectionView setBackgroundColor:[UIColor clearColor]];
    [topView addSubview:_sectionView];
    
    
    NSString * btnText = @"商品";
    UIFont * btnFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
    
    float btnWidth = [btnText getSizeWithLimitSize:CGSizeMake(100, 30) withFont:btnFont].width +20;
    
    float btnGap = (kScreenWidth -60 -20 -btnWidth *4)/3;
    
    for (int i =0; i <4; i ++) {
        
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake( (btnWidth +btnGap) *i , 0, btnWidth, 30)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:Default_Text_Dark_Color_70 forState:UIControlStateNormal];
        [btn setTitleColor:Default_Text_Dark_Color_50 forState:UIControlStateHighlighted];
        [btn setTitleColor:Default_Text_Dark_Color_90 forState:UIControlStateSelected];
        [btn.titleLabel setFont:btnFont];
        [btn setTag:1000 +i];
        [btn addTarget:self action:@selector(sectionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_sectionView addSubview:btn];
        
        switch (i) {
            case 0:
                [btn setTitle:@"商品" forState:UIControlStateNormal];
                [btn setSelected:YES];
               
                _productsBtn = btn;
                _selectedInex = 0;
                
                break;
            case 1:
                [btn setTitle:@"专题" forState:UIControlStateNormal];
                _topicsBtn = btn;
                break;
            case 2:
                [btn setTitle:@"故事" forState:UIControlStateNormal];
                _storiesBtn = btn;
                break;
            case 3:
                [btn setTitle:@"店铺" forState:UIControlStateNormal];
                _shopsBtn = btn;
                break;
            default:
                break;
        }
    }
    
    
    _gapLine = [[UIView alloc]initWithFrame:CGRectMake(0, _sectionView.frame.size.height -10 -0.5, _sectionView.frame.size.width, 0.5)];
    [_gapLine setBackgroundColor:RGBA(211, 211, 211, 30)];
    [_sectionView addSubview:_gapLine];
    
    _slideView = [[UIView alloc]initWithFrame:CGRectMake(0, _sectionView.frame.size.height -10 -4, btnWidth, 4)];
    [_slideView setBackgroundColor:DefaultGreen];
    [_sectionView addSubview:_slideView];
    
}




#pragma mark -点击切换分类
-(void)sectionBtnClicked:(UIButton *)btn
{
    float slideViewWidth = btn.frame.size.width;
    
    float slideViewGap = (_sectionView.frame.size.width -slideViewWidth *4)/3;
    
    NSInteger tagIndex = btn.tag -1000;
    
    if (_selectedInex == tagIndex) {
        return;
    }
    
    
    UIFont * normalFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
    UIFont * selectedFont = [VibeFont fontWithName:Font_Chinese_Regular size:16];
    
    if (_selectedInex == 0) {
        [_productsBtn setSelected:NO];
        [_productsBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 1) {
        [_topicsBtn setSelected:NO];
        [_topicsBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 2) {
        [_storiesBtn setSelected:NO];
        [_storiesBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 3) {
        [_shopsBtn setSelected:NO];
        [_shopsBtn.titleLabel setFont:normalFont];
    }
    
    //之前点击的按钮与现在的差
    NSInteger betweenIndex = _selectedInex -tagIndex;
    if (betweenIndex <0) {
        betweenIndex = -betweenIndex;
    }
    
    _selectedInex = tagIndex;
    

    if (tagIndex == 0) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            [_slideView setFrame:CGRectMake(0, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
        } completion:^(BOOL finished) {
            [_productsBtn setSelected:YES];
            [_productsBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 1) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) , _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
        } completion:^(BOOL finished) {
            [_topicsBtn setSelected:YES];
            [_topicsBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 2) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) *2, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
        } completion:^(BOOL finished) {
            [_storiesBtn setSelected:YES];
            [_storiesBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 3) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) *3, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
        } completion:^(BOOL finished) {
            [_shopsBtn setSelected:YES];
            [_shopsBtn.titleLabel setFont:selectedFont];
        }];
    }
    
}


-(void)rightBtnClicked:(id)sender
{
    
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}


@end




