//
//  RegisterViewController.m
//  VIBE
//
//  Created by Li Haii on 16/9/8.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RegisterViewController.h"
#import "WebViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.topNavView setHidden:YES];
    
 
    _backgroundGifView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [_backgroundGifView setBackgroundColor:[UIColor redColor]];
    _backgroundGifView.contentMode = UIViewContentModeScaleAspectFill;
    _backgroundGifView.image = [UIImage imageNamed:@"Register_Gif.gif"];
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
    

    [self setSecondStepView];
    [self setFirstStepView];
    
    
    self.beforeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 30, 30)];
    [self.beforeBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    [self.beforeBtn addTarget:self action:@selector(beforeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.beforeBtn];
    
    [self.backBtn setHidden:YES];
    [self.view bringSubviewToFront:self.beforeBtn];
    
    [self.view bringSubviewToFront:self.titleLabel];
    [self.titleLabel setText:@"注册账号"];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    
}


// 注册第二步
-(void)setSecondStepView
{
    _secondStepView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth *2, kScreenHeight)];
    [_secondStepView setBackgroundColor:[UIColor clearColor]];
    [_secondStepView setAlpha:0.0f];
    [_backScrollView addSubview:_secondStepView];

    float avatarWidht = 71;
    float gapHeight = 10;
    
    
    _avatarView = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidth -avatarWidht -6)/2 +kScreenWidth, 22, avatarWidht +10, avatarWidht +10)];
    [_avatarView setBackgroundColor:[UIColor clearColor]];
    [_avatarView.layer setCornerRadius:(avatarWidht +10)/2];
    [_avatarView.layer setMasksToBounds:YES];
    [_secondStepView addSubview:_avatarView];

    
    _avatarBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, avatarWidht +10, avatarWidht +10)];
    [_avatarBackImgView setImage:[UIImage imageNamed:@"Register_Avatar_Chosen"]];
    [_avatarBackImgView.layer setCornerRadius:(avatarWidht +10)/2];
    [_avatarBackImgView setHidden:YES];
    [_avatarView addSubview:_avatarBackImgView];
    
    _avatarBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, avatarWidht, avatarWidht)];
    [_avatarBtn.layer setCornerRadius:avatarWidht/2];
    [_avatarBtn.layer setMasksToBounds:YES];
    [_avatarBtn.imageView setContentMode:UIViewContentModeScaleToFill];
    [_avatarBtn setBackgroundImage:[UIImage imageNamed:@"Register_Avatar_Normal"] forState:UIControlStateNormal];
    [_avatarBtn addTarget:self action:@selector(clickAvatarBtn) forControlEvents:UIControlEventTouchUpInside];
    [_avatarView addSubview:_avatarBtn];


    //昵称
    _userNameView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth +55, 22 +avatarWidht +25, kScreenWidth - 55 *2, 50)];
    [_userNameView setBackgroundColor:[UIColor clearColor]];
    [_secondStepView addSubview:_userNameView];

    _userNameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 55 *2, 49)];
    [_userNameTextFiled setTextAlignment:NSTextAlignmentCenter];
    [_userNameTextFiled setTextColor:[UIColor whiteColor]];
    [_userNameTextFiled setFont:[VibeFont fontWithName:Default_Font_Middle size:17]];
    [_userNameTextFiled setPlaceholder:@"昵称"];
    [_userNameTextFiled setDelegate:self];
    [_userNameTextFiled setValue:RGBA(225, 225, 225, 90) forKeyPath:@"_placeholderLabel.textColor"];
    [_userNameTextFiled setValue:[VibeFont fontWithName:Default_Font_Middle size:16] forKeyPath:@"_placeholderLabel.font"];
    [_userNameTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_userNameView addSubview:_userNameTextFiled];

    _userNameAnimatedGradienView = [[AnimatedGradientView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth -55 *2, 1)WithGradientColors1:RGBA(108, 203, 242, 80) GradientColors2:RGBA(69, 104, 242, 80)];
    [_userNameView addSubview:_userNameAnimatedGradienView];
  

    //昵称
    _signView = [[UIView alloc]initWithFrame:CGRectMake( 55 +kScreenWidth, 22 +avatarWidht +25 +50 +gapHeight, kScreenWidth - 50 *2, 50)];
    [_signView setBackgroundColor:[UIColor clearColor]];
    [_secondStepView addSubview:_signView];
    
    _signTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 55 *2, 49)];
    [_signTextField setTextAlignment:NSTextAlignmentCenter];
    [_signTextField setTextColor:[UIColor whiteColor]];
    [_signTextField setFont:[VibeFont fontWithName:Default_Font_Middle size:15]];
    [_signTextField setPlaceholder:@"个人签名，或者说点儿什么（选填）"];
    [_signTextField setDelegate:self];
    [_signTextField setValue:RGBA(225, 225, 225, 90) forKeyPath:@"_placeholderLabel.textColor"];
    [_signTextField setValue:[VibeFont fontWithName:Default_Font_Middle size:13] forKeyPath:@"_placeholderLabel.font"];
    [_signTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_signView addSubview:_signTextField];
    
    
    _signAnimatedGradienView = [[AnimatedGradientView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth -55 *2, 1)WithGradientColors1:RGBA(238, 141, 232, 80) GradientColors2:RGBA(216, 78, 150, 80)];
    [_signView addSubview:_signAnimatedGradienView];
    
    
    //注册按钮
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -245)/2 +kScreenWidth, 18 +avatarWidht +25 +50 +gapHeight +50 +30, 245, 40)];
    [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Unable"] forState:UIControlStateNormal];
    [_registerBtn setUserInteractionEnabled:NO];
    [_registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_secondStepView addSubview:_registerBtn];

    float originX = (kScreenWidth -153 -2 -171)/2;

    _bottomTextImgView = [[UIImageView alloc]initWithFrame:CGRectMake( originX +kScreenWidth +2, 25 +avatarWidht +25 +50 +gapHeight +50 +30 +40 +10, 153 , 15)];
    [_bottomTextImgView setImage:[UIImage imageNamed:@"Register_Word"]];
    [_secondStepView addSubview:_bottomTextImgView];


    _bottomCommuneBtn = [[UIButton alloc]initWithFrame:CGRectMake( originX +165 +kScreenWidth -1, 25 +avatarWidht +25 +50 +gapHeight +50 +30 +40 +10, 171, 15)];
    [_bottomCommuneBtn setBackgroundImage:[UIImage imageNamed:@"Register_Word_Commune"] forState:UIControlStateNormal];
    [_bottomCommuneBtn addTarget:self action:@selector(clickCommuneRule) forControlEvents:UIControlEventTouchUpInside];
    [_secondStepView addSubview:_bottomCommuneBtn];
    
}



// 注册第一步
-(void)setFirstStepView
{
    _firstStepView = [[UIView alloc]initWithFrame:CGRectMake( -kScreenWidth, 0, kScreenWidth *2, kScreenHeight)];
    [_firstStepView setBackgroundColor:[UIColor clearColor]];
    [_backScrollView addSubview:_firstStepView];

    float gapHeight = (kScreenHeight -256 -75 -90 -25 -25 -40 -10 -15)/4;

    float nextOriginY = _registerBtn.frame.origin.y;
    

    _nextStepBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth +(kScreenWidth -175)/2, nextOriginY +15, 175, 37)];
    [_nextStepBtn setBackgroundImage:[UIImage imageNamed:@"Register_Next_Unable"] forState:UIControlStateNormal];
    [_nextStepBtn setUserInteractionEnabled:NO];
    [_nextStepBtn addTarget:self action:@selector(clickNextStepBtn) forControlEvents:UIControlEventTouchUpInside];
    [_firstStepView addSubview:_nextStepBtn];
    
    
    //设置密码
    float passwordOriginY = _signView.frame.origin.y;
    
    _passwordView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth +51, passwordOriginY, kScreenWidth - 51 *2, 50)];
    [_passwordView setBackgroundColor:[UIColor clearColor]];
    [_firstStepView addSubview:_passwordView];
    
    _passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 51 *2, 49)];
    [_passwordTextFiled setTextAlignment:NSTextAlignmentLeft];
    [_passwordTextFiled setTextColor:[UIColor whiteColor]];
    [_passwordTextFiled setDelegate:self];
    [_passwordTextFiled setFont:[VibeFont fontWithName:Default_Font_Middle size:13]];
    [_passwordTextFiled setPlaceholder:@"设置密码"];
    [_passwordTextFiled setKeyboardType:UIKeyboardTypeAlphabet];
    [_passwordTextFiled setValue:RGBA(225, 225, 225, 90) forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTextFiled setValue:[VibeFont fontWithName:Default_Font_Middle size:12] forKeyPath:@"_placeholderLabel.font"];
    [_passwordTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_passwordView addSubview:_passwordTextFiled];
    
    _passwordAnimatedGradienView = [[AnimatedGradientView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth -51 *2, 1) WithGradientColors1:RGBA(249, 153, 93, 80) GradientColors2:RGBA(241, 2, 2, 80)];
    [_passwordAnimatedGradienView.layer setCornerRadius:0.5];
    [_passwordView addSubview:_passwordAnimatedGradienView];

    
    //验证码
    float codeOriginY = _userNameView.origin.y;
    
    _codeNumberView  = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth +51, codeOriginY, kScreenWidth - 51 *2, 50)];
    [_codeNumberView setBackgroundColor:[UIColor clearColor]];
    [_firstStepView addSubview:_codeNumberView];
    
    _codeNumberTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 51 *2, 49)];
    [_codeNumberTextFiled setTextAlignment:NSTextAlignmentLeft];
    [_codeNumberTextFiled setTextColor:[UIColor whiteColor]];
    [_codeNumberTextFiled setKeyboardType:UIKeyboardTypeNumberPad];
    [_codeNumberTextFiled setFont:[VibeFont fontWithName:Default_Font_Middle size:13]];
    [_codeNumberTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_codeNumberTextFiled setPlaceholder:@"输入验证码"];
    [_codeNumberTextFiled setDelegate:self];
    [_codeNumberTextFiled setValue:RGBA(225, 225, 225, 90) forKeyPath:@"_placeholderLabel.textColor"];
    [_codeNumberTextFiled setValue:[VibeFont fontWithName:Default_Font_Middle size:12] forKeyPath:@"_placeholderLabel.font"];
    [_codeNumberView addSubview:_codeNumberTextFiled];
    
    
    _codeAnimatedGradienView = [[AnimatedGradientView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth -51 *2, 1)WithGradientColors1:RGBA(219, 243, 151, 80) GradientColors2:RGBA(244, 244, 26, 80)];
    [_codeAnimatedGradienView.layer setCornerRadius:0.5];
    [_codeNumberView addSubview:_codeAnimatedGradienView];
    
    
    //手机号
    float numberOriginY = codeOriginY - gapHeight -30;
    
    _phoneNumberView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth +51, numberOriginY, kScreenWidth - 51 *2, 50)];
    [_phoneNumberView setBackgroundColor:[UIColor clearColor]];
    [_firstStepView addSubview:_phoneNumberView];
    
    _phoneNumberTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, _phoneNumberView.frame.size.width -100, 49)];
    [_phoneNumberTextFiled setTextAlignment:NSTextAlignmentLeft];
    [_phoneNumberTextFiled setTextColor:[UIColor whiteColor]];
    [_phoneNumberTextFiled setFont:[VibeFont fontWithName:Default_Font_Middle size:16]];
    [_phoneNumberTextFiled setPlaceholder:@"输入手机号接收验证短信"];
    [_phoneNumberTextFiled setDelegate:self];
    [_phoneNumberTextFiled setKeyboardType:UIKeyboardTypeNumberPad];
    [_phoneNumberTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_phoneNumberTextFiled performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:1.0f];
    [_phoneNumberTextFiled setValue:RGBA(225, 225, 225, 90) forKeyPath:@"_placeholderLabel.textColor"];
    [_phoneNumberTextFiled setValue:[VibeFont fontWithName:Default_Font_Middle size:13] forKeyPath:@"_placeholderLabel.font"];
    [_phoneNumberView addSubview:_phoneNumberTextFiled];
    
    
    _phoneAnimatedGradienView = [[AnimatedGradientView alloc]initWithFrame:CGRectMake(0, 49, _phoneNumberView.frame.size.width, 1)WithGradientColors1:RGBA(102, 240, 226, 80) GradientColors2:RGBA(30, 243, 159, 80)];
    [_phoneAnimatedGradienView.layer setCornerRadius:0.5];
    [_phoneNumberView addSubview:_phoneAnimatedGradienView];
    
    
    UIFont   * sendCodeFont = [UIFont fontWithName:Default_Font_Bold size:12];
    NSString * sendCodeString = @"发送验证码";
    float sendCodeWidth = [sendCodeString getSizeWithLimitSize:CGSizeMake(100, 25) withFont:sendCodeFont].width;

    
    _sendCodeBtn = [[GLImageView alloc]initWithFrame:CGRectMake(_phoneNumberView.frame.size.width -(sendCodeWidth +16), 10, sendCodeWidth +16, 25)];
    [_sendCodeBtn.layer setCornerRadius:12];
    [_sendCodeBtn.layer setMasksToBounds:YES];
    [_sendCodeBtn addTarget:self action:@selector(sendBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_phoneNumberView addSubview:_sendCodeBtn];

    UIView * sendCodeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, sendCodeWidth +16, 25)];
    UIColor * color1 = RGB(107, 211, 212);
    UIColor * color2 = RGB(101, 120, 216);
    CAGradientLayer * sendCodeViewLayer = [CAGradientLayer layer];
    sendCodeViewLayer.frame = CGRectMake(0, 0, sendCodeView.frame.size.width, sendCodeView.frame.size.height);
    sendCodeViewLayer.startPoint = CGPointMake(0, 0);
    sendCodeViewLayer.endPoint = CGPointMake(1.0, 1.0);
    sendCodeViewLayer.colors = @[
                            (id)color1.CGColor,
                            (id)color2.CGColor,
                            ];
    [sendCodeView.layer addSublayer:sendCodeViewLayer];
    [_sendCodeBtn addSubview:sendCodeView];
    
    
    UILabel * sendCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, sendCodeWidth +16, 25)];
    [sendCodeLabel setTextAlignment:NSTextAlignmentCenter];
    [sendCodeLabel setText:sendCodeString];
    [sendCodeLabel setTextColor:RGBA(255, 255, 255, 80)];
    [sendCodeLabel setFont:sendCodeFont];
    [_sendCodeBtn addSubview:sendCodeLabel];

    
    NSString * sentCodeString = @"重新发送";
    float sentCodeWidth = [sentCodeString getSizeWithLimitSize:CGSizeMake(100, 25) withFont:sendCodeFont].width;
    
    NSString * sentCodeSecondString = @"60秒";
    UIFont * sentCodeSecondFont = [UIFont fontWithName:Default_Font_Bold size:10];
    float sentCodeSecondWidth = [sentCodeSecondString getSizeWithLimitSize:CGSizeMake(100, 25) withFont:sentCodeSecondFont].width;
    
    
    //已发送验证码
    _sendingCodeView = [[UIView alloc]initWithFrame:CGRectMake(_phoneNumberView.frame.size.width -(sentCodeWidth +2 +sentCodeSecondWidth +16), 10, sentCodeWidth +2 +sentCodeSecondWidth +16, 25)];
    [_sendingCodeView.layer setCornerRadius:12];
    [_sendingCodeView.layer setMasksToBounds:YES];
    [_sendingCodeView setHidden:YES];
    [_phoneNumberView addSubview:_sendingCodeView];
    
    UIColor * color3 = RGB(102, 127, 216);
    UIColor * color4 = RGB(158, 99, 213);
    CAGradientLayer * sentCodeViewLayer = [CAGradientLayer layer];
    sentCodeViewLayer.frame = CGRectMake(0, 0, _sendingCodeView.frame.size.width, _sendingCodeView.frame.size.height);
    sentCodeViewLayer.startPoint = CGPointMake(0, 0);
    sentCodeViewLayer.endPoint = CGPointMake(1.0, 1.0);
    sentCodeViewLayer.colors = @[
                                 (id)color3.CGColor,
                                 (id)color4.CGColor,
                                 ];
    [_sendingCodeView.layer addSublayer:sentCodeViewLayer];

    _sendingCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, sentCodeWidth, 25)];
    [_sendingCodeLabel setTextAlignment:NSTextAlignmentCenter];
    [_sendingCodeLabel setTextColor:RGBA(255, 255, 255, 95)];
    [_sendingCodeLabel setFont:sendCodeFont];
    [_sendingCodeLabel setText:sentCodeString];
    [_sendingCodeView addSubview:_sendingCodeLabel];
    
    
    _sendingSecondsLabel = [[UILabel alloc]initWithFrame:CGRectMake(8 +sentCodeWidth +1, 0, sentCodeSecondWidth +1, 25)];
    [_sendingSecondsLabel setTextAlignment:NSTextAlignmentCenter];
    [_sendingSecondsLabel setTextColor:RGBA(255, 255, 255, 95)];
    [_sendingSecondsLabel setFont:sentCodeSecondFont];
    [_sendingSecondsLabel setText:sentCodeSecondString];
    [_sendingCodeView addSubview:_sendingSecondsLabel];
    

    //初始的倒计时
    _countingDownSeconds = 59;
}


#pragma mark 点击下一步
-(void)clickNextStepBtn
{
    //取消第一步控件的键盘
    [self cancleFirstStepKeyboard];
    
    NSString * phoneNumber      = _phoneNumberTextFiled.text;
    NSString * codeNumber       = _codeNumberTextFiled.text;
    NSString * passwordNumber   = _passwordTextFiled.text;
    
    if ([VibeAppTool isStringEmpty:phoneNumber] == YES  || [VibeAppTool isPhoneNumberCorrectWithNumber:phoneNumber] == NO) {
        [self showErrorText:@"请输入正确的手机号"];
        return;
    }
    if ([VibeAppTool isStringEmpty:codeNumber] == YES || codeNumber.length != 6) {
        [self showErrorText:@"请输入正确的验证码"];
        return;
    }
    if ([VibeAppTool isStringEmpty:passwordNumber] == YES  || [VibeAppTool isStringContainsSpecialCharact:passwordNumber]== YES || [VibeAppTool isStringContainsEmoji:passwordNumber] == YES) {
        [self showErrorText:@"请输入正确的密码（不能包含特殊符号）"];
        return;
    }
    
    
    [self.view setUserInteractionEnabled:NO];
    
    [self.view bringSubviewToFront:_secondStepView];
    [self.view bringSubviewToFront:self.beforeBtn];
    
    [UIView animateWithDuration:1.0f animations:^{
        [_firstStepView setAlpha:0.0f];
    }];
    
    POPSpringAnimation *anBasic1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic1.toValue = @(_phoneNumberView.frame.origin.x -kScreenWidth);
    anBasic1.beginTime = CACurrentMediaTime() + 0.2f;
    [anBasic1 setSpringBounciness:2.0f];
    [anBasic1 setSpringSpeed:1.0f];
    [_phoneNumberView pop_addAnimation:anBasic1 forKey:@"position"];
    
    POPSpringAnimation *anBasic2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic2.toValue = @(_codeNumberView.frame.origin.x -kScreenWidth);
    anBasic2.beginTime = CACurrentMediaTime() + 0.4f;
    [anBasic2 setSpringBounciness:2.0f];
    [anBasic2 setSpringSpeed:1.0f];
    [_codeNumberView pop_addAnimation:anBasic2 forKey:@"position"];
    
    POPSpringAnimation *anBasic3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic3.toValue = @(_passwordView.frame.origin.x -kScreenWidth);
    anBasic3.beginTime = CACurrentMediaTime() + 0.6f;
    [anBasic3 setSpringBounciness:2.0f];
    [anBasic3 setSpringSpeed:1.0f];
    [_passwordView pop_addAnimation:anBasic3 forKey:@"position"];
    
    POPSpringAnimation *anBasic4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic4.toValue = @(_nextStepBtn.frame.origin.x -kScreenWidth);
    anBasic4.beginTime = CACurrentMediaTime() + 0.8f;
    [anBasic4 setSpringBounciness:2.0f];
    [anBasic4 setSpringSpeed:1.0f];
    [_nextStepBtn pop_addAnimation:anBasic4 forKey:@"position"];
    
 
    [UIView animateWithDuration:2.0f animations:^{
        [_secondStepView setAlpha:1.0f];
    }];
    
    POPSpringAnimation *anBasic5 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic5.toValue = @(_avatarView.frame.origin.x -kScreenWidth + _avatarView.frame.size.width/2);
    anBasic5.beginTime = CACurrentMediaTime() + 0.6f;
    [anBasic5 setSpringBounciness:1.0f];
    [anBasic5 setSpringSpeed:1.0f];
    [_avatarView pop_addAnimation:anBasic5 forKey:@"position"];
  
    POPSpringAnimation *anBasic6 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic6.toValue = @(_userNameView.frame.origin.x -kScreenWidth + _userNameView.frame.size.width/2);
    anBasic6.beginTime = CACurrentMediaTime() + 1.0f;
    [anBasic6 setSpringBounciness:1.0f];
    [anBasic6 setSpringSpeed:1.0f];
    [_userNameView pop_addAnimation:anBasic6 forKey:@"position"];
  
    
    POPSpringAnimation *anBasic7 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic7.toValue = @(_signView.frame.origin.x -kScreenWidth +_signView.frame.size.width/2);
    anBasic7.beginTime = CACurrentMediaTime() + 1.2f;
    [anBasic7 setSpringBounciness:1.0f];
    [anBasic7 setSpringSpeed:1.0f];
    [_signView pop_addAnimation:anBasic7 forKey:@"position"];

    
    POPSpringAnimation *anBasic9 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic9.toValue = @(_registerBtn.frame.origin.x -kScreenWidth +_registerBtn.frame.size.width/2);
    anBasic9.beginTime = CACurrentMediaTime() + 1.4f;
    [anBasic9 setSpringBounciness:1.0f];
    [anBasic9 setSpringSpeed:1.0f];
    [_registerBtn pop_addAnimation:anBasic9 forKey:@"position"];

    
    POPSpringAnimation *anBasic10 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic10.toValue = @(_bottomTextImgView.frame.origin.x -kScreenWidth +_bottomTextImgView.frame.size.width/2);
    anBasic10.beginTime = CACurrentMediaTime() + 1.6f;
    [anBasic10 setSpringBounciness:1.0f];
    [anBasic10 setSpringSpeed:1.0f];
    [_bottomTextImgView pop_addAnimation:anBasic10 forKey:@"position"];
    
    
    POPSpringAnimation *anBasic11 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic11.toValue = @(_bottomCommuneBtn.frame.origin.x -kScreenWidth +_bottomCommuneBtn.frame.size.width/2);
    anBasic11.beginTime = CACurrentMediaTime() + 1.6f;
    [anBasic11 setSpringBounciness:1.0f];
    [anBasic11 setSpringSpeed:1.0f];
    [_bottomCommuneBtn pop_addAnimation:anBasic11 forKey:@"position"];
    
    [_userNameTextFiled performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:2.5f];
    
    _isShowingSecondStep = YES;
    
    [self.view setUserInteractionEnabled:YES];
}

//返回第一步
-(void)backToFirstStep
{
    //重置填写内容
    [_userNameTextFiled setText:@""];
    [_signTextField setText:@""];
    
    [_avatarBackImgView setHidden:YES];
    [_avatarView.layer setBorderColor:[UIColor clearColor].CGColor];
    [_avatarView.layer setBorderWidth:0.0f];
    [_avatarBtn setBackgroundImage:[UIImage imageNamed:@"Register_Avatar_Normal"] forState:UIControlStateNormal];

    [_userNameAnimatedGradienView hideGradient];
    [_signAnimatedGradienView hideGradient];
    
    [self.view setUserInteractionEnabled:NO];
    
    [self cancleSecondStepKeyboard];
    
    [self.view bringSubviewToFront:_firstStepView];
    [self.view bringSubviewToFront:self.beforeBtn];
    
    [UIView animateWithDuration:2.0f animations:^{
        [_secondStepView setAlpha:0.0f];
    }];
    
    POPSpringAnimation *anBasic5 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic5.toValue = @(_avatarView.frame.origin.x +kScreenWidth +_avatarView.frame.size.width/2);
    anBasic5.beginTime = CACurrentMediaTime() + 0.2f;
    [anBasic5 setSpringBounciness:1.0f];
    [anBasic5 setSpringSpeed:1.0f];
    [_avatarView pop_addAnimation:anBasic5 forKey:@"position"];
    
    POPSpringAnimation *anBasic6 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic6.toValue = @(_userNameView.frame.origin.x +kScreenWidth +_userNameView.frame.size.width/2);
    anBasic6.beginTime = CACurrentMediaTime() + 0.4f;
    [anBasic6 setSpringBounciness:1.0f];
    [anBasic6 setSpringSpeed:1.0f];
    [_userNameView pop_addAnimation:anBasic6 forKey:@"position"];
    
    
    POPSpringAnimation *anBasic7 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic7.toValue = @(_signView.frame.origin.x +kScreenWidth +_signView.frame.size.width/2);
    anBasic7.beginTime = CACurrentMediaTime() + 0.6f;
    [anBasic7 setSpringBounciness:1.0f];
    [anBasic7 setSpringSpeed:1.0f];
    [_signView pop_addAnimation:anBasic7 forKey:@"position"];
    
    
    POPSpringAnimation *anBasic9 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic9.toValue = @(_registerBtn.frame.origin.x +kScreenWidth +_registerBtn.frame.size.width/2);
    anBasic9.beginTime = CACurrentMediaTime() + 0.8;
    [anBasic9 setSpringBounciness:1.0f];
    [anBasic9 setSpringSpeed:1.0f];
    [_registerBtn pop_addAnimation:anBasic9 forKey:@"position"];
    
    
    POPSpringAnimation *anBasic10 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic10.toValue = @(_bottomTextImgView.frame.origin.x +kScreenWidth +_bottomTextImgView.frame.size.width/2);
    anBasic10.beginTime = CACurrentMediaTime() + 1.0;
    [anBasic10 setSpringBounciness:1.0f];
    [anBasic10 setSpringSpeed:1.0f];
    [_bottomTextImgView pop_addAnimation:anBasic10 forKey:@"position"];
    
    
    POPSpringAnimation *anBasic11 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic11.toValue = @(_bottomCommuneBtn.frame.origin.x +kScreenWidth +_bottomCommuneBtn.frame.size.width/2);
    anBasic11.beginTime = CACurrentMediaTime() + 1.0;
    [anBasic11 setSpringBounciness:1.0f];
    [anBasic11 setSpringSpeed:1.0f];
    [_bottomCommuneBtn pop_addAnimation:anBasic11 forKey:@"position"];
    

    
    [UIView animateWithDuration:1.0f animations:^{
        [_firstStepView setAlpha:1.0f];
    }];
    
    POPSpringAnimation *anBasic1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic1.toValue = @(_phoneNumberView.frame.origin.x +kScreenWidth  +_phoneNumberView.frame.size.width);
    anBasic1.beginTime = CACurrentMediaTime() + 0.8f;
    [anBasic1 setSpringBounciness:2.0f];
    [anBasic1 setSpringSpeed:1.0f];
    [_phoneNumberView pop_addAnimation:anBasic1 forKey:@"position"];
    
    POPSpringAnimation *anBasic2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic2.toValue = @(_codeNumberView.frame.origin.x +kScreenWidth +_codeNumberView.frame.size.width);
    anBasic2.beginTime = CACurrentMediaTime() + 1.0f;
    [anBasic2 setSpringBounciness:2.0f];
    [anBasic2 setSpringSpeed:1.0f];
    [_codeNumberView pop_addAnimation:anBasic2 forKey:@"position"];
    
    POPSpringAnimation *anBasic3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic3.toValue = @(_passwordView.frame.origin.x +kScreenWidth +_passwordView.frame.size.width);
    anBasic3.beginTime = CACurrentMediaTime() + 1.2f;
    [anBasic3 setSpringBounciness:2.0f];
    [anBasic3 setSpringSpeed:1.0f];
    [_passwordView pop_addAnimation:anBasic3 forKey:@"position"];
    
    POPSpringAnimation *anBasic4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic4.toValue = @(_nextStepBtn.frame.origin.x +kScreenWidth +_nextStepBtn.frame.size.width);
    anBasic4.beginTime = CACurrentMediaTime() + 1.4f;
    [anBasic4 setSpringBounciness:2.0f];
    [anBasic4 setSpringSpeed:1.0f];
    [_nextStepBtn pop_addAnimation:anBasic4 forKey:@"position"];

    
    [self.view setUserInteractionEnabled:YES];

    [_phoneNumberTextFiled performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:2.5f];
    
    _isShowingSecondStep = NO;

}


#pragma mark - 点击注册按钮
-(void)registerBtnClicked
{
    [self cancleSecondStepKeyboard];
    
    if (!_avatarImage) {
        [self showErrorText:@"请选择头像"];
        return;
    }
    
    NSString * userName     = _userNameTextFiled.text;
    NSString * signature    = _signTextField.text;
    
    if ([VibeAppTool isStringEmpty:userName] == YES || [VibeAppTool isStringContainsSpecialCharact:userName] == YES) {
        [self showErrorText:@"请填写正确的昵称"];
        [_userNameTextFiled becomeFirstResponder];
        return;
    }
    
    if ([VibeAppTool isStringContainsSpecialCharact:signature]) {
        [self showErrorText:@"签名不能包含特殊符号"];
        [_signTextField becomeFirstResponder];
        return;
    }
    
    if ([VibeAppTool isStringEmpty:signature]) {
        signature = @"";
    }
    
}



#pragma mark -scrollView Delegare
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //显示第一页
    if (!_isShowingSecondStep) {
        [self cancleFirstStepKeyboard];
    }
    else{
        [self cancleSecondStepKeyboard];
    }
}

-(void)scrollViewTap:(UITapGestureRecognizer *)tappp
{
    //显示第一页
    if (!_isShowingSecondStep) {
        [self cancleFirstStepKeyboard];
    }
    else{
        [self cancleSecondStepKeyboard];
    }
}


#pragma mark - 取消键盘
-(void)cancleFirstStepKeyboard
{
    [_phoneNumberTextFiled resignFirstResponder];
    [_codeNumberTextFiled resignFirstResponder];
    [_passwordTextFiled resignFirstResponder];
}

-(void)cancleSecondStepKeyboard
{
    [_userNameTextFiled resignFirstResponder];
    [_signTextField resignFirstResponder];
}

#pragma mark 点击头像
-(void)clickAvatarBtn
{
    [self cancleSecondStepKeyboard];
    
    UICollectionViewFlowLayout* flow = [[UICollectionViewFlowLayout alloc] init];
    SimpleImagePickerController* imagePicker = [[SimpleImagePickerController alloc] initWithCollectionViewLayout:flow];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)didSelectImgviewCellWithImage:(UIImage *)image
{
    _avatarImage = image;
    [_avatarBtn setBackgroundImage:image forState:UIControlStateNormal];

    NSString * userNameString = _userNameTextFiled.text;
    NSString * signString = _signTextField.text;
    if ( [VibeAppTool isStringEmpty:userNameString] == NO && [VibeAppTool isStringEmpty:signString] ==NO) {
        [_avatarView.layer setBorderColor:[UIColor clearColor].CGColor];
        [_avatarView.layer setBorderWidth:0.0f];
        [_avatarBackImgView setHidden:NO];
        [_userNameAnimatedGradienView  showGradient];
        [_signAnimatedGradienView  showGradient];
        [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Normal"] forState:UIControlStateNormal];
        [_registerBtn setUserInteractionEnabled:YES];
    }
    else{
        [_avatarView.layer setBorderColor:RGBA(255, 255, 255, 50).CGColor];
        [_avatarView.layer setBorderWidth:1.0f];
        [_avatarBackImgView setHidden:YES];
        [_userNameAnimatedGradienView  hideGradient];
        [_signAnimatedGradienView  hideGradient];
        [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Unable"] forState:UIControlStateNormal];
        [_registerBtn setUserInteractionEnabled:NO];
    }
    
}


#pragma mark textField代理方法
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"~~~~~~");
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"######");
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"********");
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"......");
    return YES;
}

#pragma mark -限制输入手机号的字数
- (void)textFieldDidChange:(UITextField *)textField
{
    //正在显示第一页
    if (!_isShowingSecondStep) {
        //限制手机号的输入字数
        if (textField == _phoneNumberTextFiled) {
            if (textField.text.length > 11) {
                textField.text = [textField.text substringToIndex:11];
            }
        }
        //限制验证码的输入字数
        if (textField == _codeNumberTextFiled) {
            if (textField.text.length > 6) {
                textField.text = [textField.text substringToIndex:6];
            }
        }
        
        NSString * phoneString = _phoneNumberTextFiled.text;
        NSString * codeString = _codeNumberTextFiled.text;
        NSString * passwordString = _passwordTextFiled.text;
        
        if (phoneString.length && codeString.length && passwordString.length) {
            [_phoneAnimatedGradienView  showGradient];
            [_codeAnimatedGradienView showGradient];
            [_passwordAnimatedGradienView showGradient];
            [_nextStepBtn setBackgroundImage:[UIImage imageNamed:@"Register_Next_Normal"] forState:UIControlStateNormal];
            [_nextStepBtn setUserInteractionEnabled:YES];
        }
        else{
            [_phoneAnimatedGradienView hideGradient];
            [_codeAnimatedGradienView hideGradient];
            [_passwordAnimatedGradienView hideGradient];
            [_nextStepBtn setBackgroundImage:[UIImage imageNamed:@"Register_Next_Unable"] forState:UIControlStateNormal];
            [_nextStepBtn setUserInteractionEnabled:NO];
        }
    }
    
    //正在显示第二页
    else{
        
        //限制昵称的输入字数
        if (textField == _userNameTextFiled) {
            if (textField.text.length > 10) {
                textField.text = [textField.text substringToIndex:10];
            }
        }
        //限制签名的输入字数
        if (textField == _signTextField) {
            if (textField.text.length > 15) {
                textField.text = [textField.text substringToIndex:15];
            }
        }
        
        NSString * userNameString = _userNameTextFiled.text;
        NSString * signString = _signTextField.text;
        if (userNameString.length && signString.length) {
            
            [_avatarView.layer setBorderColor:[UIColor clearColor].CGColor];
            [_avatarView.layer setBorderWidth:0.0f];
            
            if (_avatarImage) {
                [_avatarBackImgView setHidden:NO];
                
                [_userNameAnimatedGradienView  showGradient];
                [_signAnimatedGradienView  showGradient];
                [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Normal"] forState:UIControlStateNormal];
                [_registerBtn setUserInteractionEnabled:YES];
            }
            else{
                [_avatarBackImgView setHidden:YES];
                
                [_userNameAnimatedGradienView  hideGradient];
                [_signAnimatedGradienView  hideGradient];
                [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Unable"] forState:UIControlStateNormal];
                [_registerBtn setUserInteractionEnabled:NO];
            }
        }
        
        else{
            
            if (_avatarImage) {
                [_avatarView.layer setBorderColor:RGBA(255, 255, 255, 50).CGColor];
                [_avatarView.layer setBorderWidth:1.0f];
            }
            else{
                [_avatarView.layer setBorderColor:[UIColor clearColor].CGColor];
                [_avatarView.layer setBorderWidth:0.0f];
            }
          
            [_avatarBackImgView setHidden:YES];

            [_userNameAnimatedGradienView  hideGradient];
            [_signAnimatedGradienView  hideGradient];
            [_registerBtn setBackgroundImage:[UIImage imageNamed:@"Register_Finish_Unable"] forState:UIControlStateNormal];
            [_registerBtn setUserInteractionEnabled:NO];
        }
    }

}


#pragma mark -点击返回键
-(void)beforeBtnClicked:(UIButton *)btn
{
    //点击返回第一步
    if (_isShowingSecondStep == YES) {
     
        [self askBackToFirstStep];
    }
    else{
        [self.lcNavigationController popViewController];
    }
}




//确认是否点击返回第一步
-(void)askBackToFirstStep
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"返回上一步？" message:@"当前所填信息将重置" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self backToFirstStep];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        return ;
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}



#pragma mark - 点击发送验证码
-(void)sendBtnClicked
{
    if (_didClickSend == YES) {
        return;
    }
    
    NSString * phoneNumberString = _phoneNumberTextFiled.text;
    
    //判断手机号是否已输入
    if ([VibeAppTool isStringEmpty:phoneNumberString]) {
        [self showErrorText:@"未输入手机号"];
        return;
    }
    
    //判断手机号是否正确
    if ([VibeAppTool isPhoneNumberCorrectWithNumber:phoneNumberString] == NO) {
        [self showErrorText:@"请输入正确手机号"];
        return;
    }
    
    _didClickSend = YES;
    
    [_sendCodeBtn setHidden:YES];
    [_sendingCodeView setHidden:NO];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(minusCountSecond) userInfo:nil repeats:YES];
    [_timer fire];
}


-(void)minusCountSecond
{
    _countingDownSeconds --;
    
    if (_countingDownSeconds == 0) {
        
        [_timer invalidate];
        
        _didClickSend = NO;
        [_sendCodeBtn setHidden:NO];
        [_sendingCodeView setHidden:YES];
        _countingDownSeconds = 59;
    }
    
    NSString * seconds = [NSString stringWithFormat:@"%ld秒",_countingDownSeconds];
    [_sendingSecondsLabel setText:seconds];
}


#pragma mark -点击社区规范
-(void)clickCommuneRule
{
    WebViewController * webVC = [[WebViewController alloc]init];
    [webVC setLinkURL:@"http://www.163.com"];
    [self.lcNavigationController presentViewController:webVC animated:YES completion:nil];
}


#pragma mark -viewWillApear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
