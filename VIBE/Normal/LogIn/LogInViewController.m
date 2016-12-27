//
//  LogInViewController.m
//  VIBE
//
//  Created by Li Haii on 16/9/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    [self.topNavView setHidden:YES];
    
    UIImageView * backImgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [backImgview setImage:[UIImage imageNamed:@"LogInBg"]];
    [backImgview setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:backImgview];
    
    
    _backScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [_backScrollView setShowsVerticalScrollIndicator:NO];
    [_backScrollView setContentSize:CGSizeMake(kScreenWidth, kScreenHeight +20)];
    [_backScrollView setPagingEnabled:NO];
    [self.view addSubview:_backScrollView];
    
    
    //用户名
    _userNameView = [[UIView alloc]initWithFrame:CGRectMake(50, kScreenHeight/3, kScreenWidth - 50 *2, 25)];
    [_userNameView setBackgroundColor:[UIColor clearColor]];
    [_backScrollView addSubview:_userNameView];
    
    _userNameTxtField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 25)];
    [_userNameTxtField setTextAlignment:NSTextAlignmentCenter];
    [_userNameTxtField setKeyboardType:UIKeyboardTypeNumberPad];
    [_userNameTxtField setTextColor:[UIColor whiteColor]];
    [_userNameTxtField setFont:[VibeFont fontWithName:Default_Font_Middle size:15]];
    [_userNameTxtField setPlaceholder:@"手机号码"];
    [_userNameTxtField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_userNameTxtField setValue:[VibeFont fontWithName:Default_Font size:14] forKeyPath:@"_placeholderLabel.font"];
    [_userNameView addSubview:_userNameTxtField];
    
    _userNameLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 24, kScreenWidth - 50 *2, 0.5)];
    [_userNameLineView setBackgroundColor:[UIColor whiteColor]];
    [_userNameView addSubview:_userNameLineView];
    
    
    //密码
    _passwordView = [[UIView alloc]initWithFrame:CGRectMake(50, kScreenHeight/3 +30 +40, kScreenWidth - 50 *2, 25)];
    [_passwordView setBackgroundColor:[UIColor clearColor]];
    [_backScrollView addSubview:_passwordView];
    
    _passwordTxtField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 25)];
    [_passwordTxtField setTextAlignment:NSTextAlignmentCenter];
    [_passwordTxtField setTextColor:[UIColor whiteColor]];
    [_passwordTxtField setFont:[VibeFont fontWithName:Default_Font_Middle size:15]];
    [_passwordTxtField setPlaceholder:@"密码"];
    [_passwordTxtField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTxtField setValue:[VibeFont fontWithName:Default_Font size:14] forKeyPath:@"_placeholderLabel.font"];
    [_passwordView addSubview:_passwordTxtField];
    
    _passwordLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 24, kScreenWidth - 50 *2, 0.5)];
    [_passwordLineView setBackgroundColor:[UIColor whiteColor]];
    [_passwordView addSubview:_passwordLineView];
    
    
    _forgetPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -50 -64, kScreenHeight/3 +30 +40 +25 +5, 64, 18) ];
    [_forgetPasswordBtn setBackgroundImage:[UIImage imageNamed:@"Login_Forget_Password"] forState:UIControlStateNormal];
    [_forgetPasswordBtn setBackgroundImage:[UIImage imageNamed:@"Login_Forget_Password_HighLight"] forState:UIControlStateHighlighted];
    [_forgetPasswordBtn setAlpha:0.8f];
    [_forgetPasswordBtn addTarget:self action:@selector(forgetPassWordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backScrollView addSubview:_forgetPasswordBtn];
    
    
    _loginView = [[UIView alloc]initWithFrame:CGRectMake(50, kScreenHeight/3 *2, kScreenWidth - 50 *2, 44)];
    [_loginView setBackgroundColor:[UIColor clearColor]];
    [_loginView.layer setCornerRadius:22];
    [_loginView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_loginView.layer setBorderWidth:1.0f];
    [_loginView.layer setMasksToBounds:YES];
    [_backScrollView addSubview:_loginView];
    
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * loginBlurView = [[UIVisualEffectView alloc]initWithEffect:effect];
    [loginBlurView setFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 44)];
    [loginBlurView setAlpha:0.5f];
    [_loginView addSubview:loginBlurView];
   
    
    UIButton * logInBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 40)];
    [logInBtn setImage:[UIImage imageNamed:@"Log_In"] forState:UIControlStateNormal];
    [logInBtn setImage:[UIImage imageNamed:@"Log_In_HighLight"] forState:UIControlStateHighlighted];
    [logInBtn setImageEdgeInsets:UIEdgeInsetsMake(12.5, (kScreenWidth - 50 *2 -54)/2, 12.5, (kScreenWidth - 50 *2 -54)/2)];
    [_loginView addSubview:logInBtn];
    
    
    _wechatView = [[UIView alloc]initWithFrame:CGRectMake(50, kScreenHeight/3 *2 +40 +30, kScreenWidth - 50 *2, 40)];
    [_wechatView setBackgroundColor:[UIColor clearColor]];
    [_wechatView.layer setCornerRadius:22];
    [_wechatView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_wechatView.layer setBorderWidth:1.0f];
    [_wechatView.layer setMasksToBounds:YES];
    [_backScrollView addSubview:_wechatView];
    
    UIVisualEffectView * wechatBlurView = [[UIVisualEffectView alloc]initWithEffect:effect];
    [wechatBlurView setFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 44)];
    [wechatBlurView setAlpha:0.5f];
    [_wechatView addSubview:wechatBlurView];
    
    
    UIButton * wechatBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50 *2, 40)];
    [wechatBtn setImage:[UIImage imageNamed:@"Log_In_Wechat"] forState:UIControlStateNormal];
    [wechatBtn setImage:[UIImage imageNamed:@"Log_In_Wechat_HightLight"] forState:UIControlStateHighlighted];
    [wechatBtn setImageEdgeInsets:UIEdgeInsetsMake(11, (kScreenWidth - 50 *2 -56)/2, 11, (kScreenWidth - 50 *2 -56)/2)];
    [_wechatView addSubview:wechatBtn];
    
    
    float btnWidth = 284;
    float height = 30;
    float btnOriginY = (kScreenHeight - (kScreenHeight/3 *2 +40 +30 +40) -height)/2 + (kScreenHeight/3 *2 +40 +30 +40);
    
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -btnWidth)/2, btnOriginY, btnWidth, height)];
    [_registerBtn setImage:[UIImage imageNamed:@"LogIn_No_Acount"] forState:UIControlStateNormal];
    [_registerBtn setImage:[UIImage imageNamed:@"LogIn_No_Acout_HightLight"] forState:UIControlStateHighlighted];
    [_registerBtn setImageEdgeInsets:UIEdgeInsetsMake( (height -13)/2, (btnWidth -182)/2, (height -13)/2,  (btnWidth -185)/2)];
    [_registerBtn addTarget:self action:@selector(enterRegister) forControlEvents:UIControlEventTouchUpInside];
    [_backScrollView addSubview:_registerBtn];
    
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Cancle"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.backBtn];

}








//取消所有升起键盘
-(void)cancleAllKeyboard
{
    [_userNameTxtField resignFirstResponder];
    [_passwordTxtField resignFirstResponder];
}


#pragma mark 忘记密码
-(void)forgetPassWordBtnClick
{
    
}

#pragma mark 点击注册
-(void)enterRegister
{
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self.lcNavigationController pushViewController:registerVC];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
