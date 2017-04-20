//
//  VibeLogInViewController.m
//  VIBE
//
//  Created by Li Haii on 16/10/15.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeLogInViewController.h"

@interface VibeLogInViewController ()

@end

@implementation VibeLogInViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.topNavView setHidden:YES];
    
    _backgroundGifView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [_backgroundGifView setBackgroundColor:[UIColor redColor]];
    _backgroundGifView.contentMode = UIViewContentModeScaleAspectFill;
    _backgroundGifView.image = [UIImage imageNamed:@"Log_In_Gif.gif"];
    [self.view addSubview:_backgroundGifView];

    _maskView = [[UIView alloc]initWithFrame:self.view.frame];
    [_maskView setBackgroundColor:RGBA(0, 0, 0, 20)];
    [self.view addSubview:_maskView];
    
    
    _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight -64)];
    [_backScrollView setShowsVerticalScrollIndicator:NO];
    [_backScrollView setContentSize:CGSizeMake(kScreenWidth, kScreenHeight -60)];
    [_backScrollView setPagingEnabled:NO];
    [_backScrollView setDelegate:self];
    [self.view addSubview:_backScrollView];
    
    
    UITapGestureRecognizer * tapppp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTap:)];
    [_backScrollView addGestureRecognizer:tapppp];
    
    
    _contentWidth = 297;
    
    _showContentView = [[UIView alloc]initWithFrame:CGRectMake( (kScreenWidth -_contentWidth)/2, (kScreenHeight -270 -64)/2 -20, _contentWidth, 270)];
    [_showContentView setBackgroundColor:[UIColor clearColor]];
    [_backScrollView addSubview:_showContentView];
    
    _infoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _contentWidth, 97)];
    [_infoView setBackgroundColor:[UIColor whiteColor]];
    [_infoView.layer setCornerRadius:4.0f];
    [_infoView.layer setMasksToBounds:YES];
    _infoView.layer.shadowColor = RGBA(80, 80, 80, 70).CGColor;
    _infoView.layer.shadowOffset = CGSizeMake(0,2);
    _infoView.layer.shadowOpacity = 0.4;
    _infoView.layer.shadowRadius = 14;
    [_showContentView addSubview:_infoView];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(15, 48, _contentWidth -30, 1)];
    [lineView setBackgroundColor:RGBA(234, 234, 234, 90)];
    [_infoView addSubview:lineView];
    
    _userNameView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _contentWidth, 48)];
    [_userNameView setBackgroundColor:[UIColor clearColor]];
    [_infoView addSubview:_userNameView];
    
    float iconWidth = 20;
    
    _userNameImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, (48 -iconWidth)/2, iconWidth, iconWidth)];
    [_userNameImgView setImage:[UIImage imageNamed:@"LogIn_User_Name"]];
    [_userNameView addSubview:_userNameImgView];
    
    //用户电话
    _userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, _contentWidth -40 -15, 48)];
    [_userNameTextField setDelegate:self];
    [_userNameTextField setBackgroundColor:[UIColor clearColor]];
    [_userNameTextField setTextAlignment:NSTextAlignmentLeft];
    [_userNameTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_userNameTextField setTextColor:DefaultQYTextColor70];
    [_userNameTextField setFont:[VibeFont fontWithName:Default_Font size:15]];
    [_userNameTextField setPlaceholder:@"输入已绑定手机号码"];
    [_userNameTextField setValue:DefaultQYTextColor20 forKeyPath:@"_placeholderLabel.textColor"];
    [_userNameTextField setValue:[VibeFont fontWithName:Default_Font size:14] forKeyPath:@"_placeholderLabel.font"];
    
    [_userNameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [_userNameView addSubview:_userNameTextField];

    
    _passwordView = [[UIView alloc]initWithFrame:CGRectMake(0, 48 +1, _contentWidth, 48)];
    [_passwordView setBackgroundColor:[UIColor clearColor]];
    [_infoView addSubview:_passwordView];
    
    _passwordImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, (48 -iconWidth)/2, iconWidth, iconWidth)];
    [_passwordImgView setImage:[UIImage imageNamed:@"LogIn_Password"]];
    [_passwordView addSubview:_passwordImgView];
    
    //登录密码
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, _contentWidth -40 -15, 48)];
    [_passwordTextField setDelegate:self];
    [_passwordTextField setBackgroundColor:[UIColor clearColor]];
    [_passwordTextField setSecureTextEntry:YES];
    [_passwordTextField setTextAlignment:NSTextAlignmentLeft];
    [_passwordTextField setTextColor:DefaultQYTextColor70];
    [_passwordTextField setFont:[VibeFont fontWithName:Default_Font size:13]];
    [_passwordTextField setPlaceholder:@"输入密码"];
    [_passwordTextField setValue:DefaultQYTextColor20 forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTextField setValue:[VibeFont fontWithName:Default_Font size:14] forKeyPath:@"_placeholderLabel.font"];
    [_passwordView addSubview:_passwordTextField];

    
    
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake( -11, 97 +20, 319, 74)];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Btn"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Btn_Highlight"] forState:UIControlStateHighlighted];
    [_loginBtn addTarget:self action:@selector(loginBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [_showContentView addSubview:_loginBtn];
    
    
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 97 +20 +70, 65, 27)];
    [_registerBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Register"] forState:UIControlStateNormal];
    [_registerBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Register_Highlight"] forState:UIControlStateHighlighted];
    [_registerBtn addTarget:self action:@selector(registerBtnDidTap) forControlEvents:UIControlEventTouchUpInside];
    [_showContentView addSubview:_registerBtn];
    
    _forgetPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(_contentWidth -65 -2, 97 +20 +70, 65, 27)];
    [_forgetPasswordBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Forget"] forState:UIControlStateNormal];
    [_forgetPasswordBtn setBackgroundImage:[UIImage imageNamed:@"LogIn_Forget_Highlight"] forState:UIControlStateHighlighted];
    [_forgetPasswordBtn addTarget:self action:@selector(forgetBtnDidTap) forControlEvents:UIControlEventTouchUpInside];
    [_showContentView addSubview:_forgetPasswordBtn];

    float wechatWidth = 126;
    float wechatHeight = 22;
    
    _wechatLogInBtn = [[UIButton alloc]initWithFrame:CGRectMake( (_contentWidth -wechatWidth)/2,  97 +20 +70 +27 +30, wechatWidth, wechatHeight)];
    [_wechatLogInBtn setBackgroundImage:[UIImage imageNamed:@"Login_Wechat_Normal"] forState:UIControlStateNormal];
    [_wechatLogInBtn setBackgroundImage:[UIImage imageNamed:@"Login_Wechat_Highlight"] forState:UIControlStateHighlighted];
    [_showContentView addSubview:_wechatLogInBtn];
    
    UIView * line1 = [[UIView alloc]initWithFrame:CGRectMake(10, 97 +20 +70 +27 +30 +10.5, (_contentWidth -wechatWidth)/2 -20, 1)];
    [line1 setBackgroundColor:[UIColor whiteColor]];
    [line1.layer setCornerRadius:0.5];
    [_showContentView addSubview:line1];
    
    UIView * line2 = [[UIView alloc]initWithFrame:CGRectMake( (_contentWidth -wechatWidth)/2 +wechatWidth +10, 97 +20 +70 +27 +30 +10.5, (_contentWidth -wechatWidth)/2 -20, 1)];
    [line2 setBackgroundColor:[UIColor whiteColor]];
    [line2.layer setCornerRadius:0.5];
    [_showContentView addSubview:line2];
    
    
    [self.titleLabel setText:@"登录VIBE"];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.view bringSubviewToFront:self.titleLabel];
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Cancle_White"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.backBtn];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setFrame:CGRectMake(kScreenWidth -15 -18, 30, 18, 18)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"More_Setting"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.rightButton];

    
}

#pragma mark -限制输入手机号的字数
- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == _userNameTextField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }
}


#pragma mark -点击登录
-(void)loginBtnTap
{
    NSString * phoneNumber = _userNameTextField.text;
    NSString * password    = _passwordTextField.text;
    
    if ([VibeAppTool isStringEmpty:phoneNumber] || [VibeAppTool isPhoneNumberCorrectWithNumber:phoneNumber] == NO) {
        [self showErrorText:@"请输入正确的手机号"];
        return;
    }
    if ([VibeAppTool isStringEmpty:password] || [VibeAppTool isStringContainsSpecialCharact:password]== YES || [VibeAppTool isStringContainsEmoji:password]) {
        [self showErrorText:@"请输入正确的密码（不能包含特殊符号）"];
        return;
    }
}


#pragma mark -点击注册
-(void)registerBtnDidTap
{
    [self cancleKeyboard];

    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self.lcNavigationController pushViewController:registerVC];
}

#pragma mark - 点击忘记密码
-(void)forgetBtnDidTap
{
    [self cancleKeyboard];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self cancleKeyboard];
}

-(void)scrollViewTap:(UITapGestureRecognizer *)tappp
{
    [self cancleKeyboard];
}


#pragma mark - 取消键盘
-(void)cancleKeyboard
{
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

#pragma mark -点击设置
-(void)rightBtnClicked:(id)sender
{
    if (!_moreSettingView) {
        _moreSettingView = [[MoreSettingView alloc]initWithFrame:self.view.frame];
        [_moreSettingView setDelegateee:self];
        [self.view addSubview:_moreSettingView];
    }
    
    [self.titleLabel setText:@"更多设置"];
    
    [_moreSettingView showSettingView];
    
    [UIView animateWithDuration:0.5f animations:^{
        
        [_showContentView setFrame:CGRectMake( (kScreenWidth -_contentWidth)/2, kScreenHeight, _contentWidth, 270)];
        [_showContentView setAlpha:0.0f];
        
        [self.backBtn setAlpha:0.0f];
        [self.rightButton setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        

    }];
    
}

#pragma mark -取消设置的代理方法
-(void)moreSettingViewDidHide
{
    [self.titleLabel setText:@"登录VIBE"];

    [UIView animateWithDuration:0.5f animations:^{
       
        [_showContentView setFrame:CGRectMake( (kScreenWidth -_contentWidth)/2, (kScreenHeight -270 -64)/2 -20, _contentWidth, 270)];
        [_showContentView setAlpha:1.0f];
        
        [self.backBtn setAlpha:1.0f];
        [self.rightButton setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
    }];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end


