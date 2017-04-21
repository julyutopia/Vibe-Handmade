//
//  LogInViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/19.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _backImgView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [_backImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_backImgView.layer setMasksToBounds:YES];
    [_backImgView setImage:[UIImage imageNamed:@"Log_In_Back"]];
    [self.view addSubview:_backImgView];
    
    [self initBackView];
    
    [self initNaviView];
}


-(void)initBackView
{
    float whiteContentViewWidth = kScreenWidth -60;
    float whiteContentViewHeight = kScreenHeight/5 *3;
    
    
    _whiteContentView = [[UIView alloc]initWithFrame:CGRectMake(60, (kScreenHeight -whiteContentViewHeight)/2 -10, whiteContentViewWidth, whiteContentViewHeight)];
    [_whiteContentView setBackgroundColor:RGBA(255, 255, 255, 98)];
    [_whiteContentView.layer setMasksToBounds:YES];
    [self.view addSubview:_whiteContentView];
    
    
    _whiteShadowView1 = [[UIView alloc]initWithFrame:CGRectMake(65 , (kScreenHeight -whiteContentViewHeight)/2 -10, whiteContentViewWidth -5, whiteContentViewHeight +5)];
    [_whiteShadowView1 setBackgroundColor:DefaultWhite];
    [_whiteShadowView1 setAlpha:0.7f];
    [_whiteShadowView1.layer setMasksToBounds:YES];
    [self.view insertSubview:_whiteShadowView1 belowSubview:_whiteContentView];
    
    _whiteShadowView2 = [[UIView alloc]initWithFrame:CGRectMake(65 +5 , (kScreenHeight -whiteContentViewHeight)/2 -10, whiteContentViewWidth -5 -5, whiteContentViewHeight +5 +5)];
    [_whiteShadowView2 setBackgroundColor:DefaultWhite];
    [_whiteShadowView2 setAlpha:0.4f];
    [_whiteShadowView2.layer setMasksToBounds:YES];
    [self.view insertSubview:_whiteShadowView2 belowSubview:_whiteShadowView1];

    
    [self setWhiteCornerView];
    
    
    //设置抬头标题
    _welcomeLabel = [[UILabel alloc]init];
    [_welcomeLabel setTextAlignment:NSTextAlignmentLeft];
    [_welcomeLabel setTextColor:Default_Text_Dark_Color_90];
    [_welcomeLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:20]];
    [_welcomeLabel setNumberOfLines:0];
    [_whiteContentView addSubview:_welcomeLabel];
    NSString * welcome = @"欢迎来到\nVIBE手作社区！";
    [[VibeAppTool sharedInstance] setLabelSpace:_welcomeLabel withText:welcome withFont:_welcomeLabel.font withLineSpacing:6.0f];
    float welcomeTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:welcome withFont:_welcomeLabel.font withWidth:kScreenWidth -60 -45 -20 withLineSpacing:6.0] +2.0f;
    [_welcomeLabel setFrame:CGRectMake(45, 40, 200, welcomeTextHeight)];
 
    
    float inputViewHeight = 40;

    _userMobileView = [[UIView alloc]initWithFrame:CGRectMake(45, _welcomeLabel.frame.origin.y +welcomeTextHeight +30, whiteContentViewWidth -90, inputViewHeight)];
    [_userMobileView setBackgroundColor:[UIColor clearColor]];
    [_whiteContentView addSubview:_userMobileView];
    
    
    _userMobileTextField = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, _userMobileView.frame.size.width -10, _userMobileView.frame.size.height -5)];
    [_userMobileTextField setFont:[VibeFont fontWithName:Font_English_Medium size:15]];
    [_userMobileTextField setTextColor:Default_Text_Dark_Color_70];
    //设置placeholder
    NSString * placeholderText1 = @"注册时使用的手机号码";
    NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:placeholderText1];
    [placeholder1 addAttribute:NSForegroundColorAttributeName
                       value:Default_Text_Gray_Color_70
                       range:NSMakeRange(0, placeholderText1.length)];
    [placeholder1 addAttribute:NSFontAttributeName
                       value:[VibeFont fontWithName:Font_Chinese_Regular size:13]
                       range:NSMakeRange(0, placeholderText1.length)];
    _userMobileTextField.attributedPlaceholder = placeholder1;
    [_userMobileTextField setKeyboardType:UIKeyboardTypePhonePad];
    [_userMobileTextField setDelegate:self];
   
    //计算输入的电话字数
    [_userMobileTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_userMobileView addSubview:_userMobileTextField];
    
    
    _userMobileLineView = [[UIView alloc]initWithFrame:CGRectMake(0, _userMobileView.frame.size.height -1, _userMobileView.frame.size.width, 1)];
    [_userMobileLineView setBackgroundColor:Default_Text_Gray_Color_10];
    [_userMobileLineView.layer setCornerRadius:1];
    [_userMobileView addSubview:_userMobileLineView];
    
    
    _passwordView = [[UIView alloc]initWithFrame:CGRectMake(45,  _userMobileView.frame.origin.y +inputViewHeight +10, whiteContentViewWidth -90, inputViewHeight)];
    [_passwordView setBackgroundColor:[UIColor clearColor]];
    [_whiteContentView addSubview:_passwordView];
    
    
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, _passwordView.frame.size.width -10, _passwordView.frame.size.height -5)];
    
    [_passwordTextField setFont:[VibeFont fontWithName:Font_English_Medium size:15]];
    [_passwordTextField setTextColor:Default_Text_Dark_Color_70];
    //设置placeholder
    NSString * placeholderText2 = @"输入密码";
    NSMutableAttributedString *placeholder2 = [[NSMutableAttributedString alloc]initWithString:placeholderText2];
    [placeholder2 addAttribute:NSForegroundColorAttributeName
                         value:Default_Text_Gray_Color_70
                         range:NSMakeRange(0, placeholderText2.length)];
    [placeholder2 addAttribute:NSFontAttributeName
                         value:[VibeFont fontWithName:Font_Chinese_Regular size:13]
                         range:NSMakeRange(0, placeholderText2.length)];
    _passwordTextField.attributedPlaceholder = placeholder2;
    [_passwordTextField setDelegate:self];
    [_passwordTextField setSecureTextEntry:YES];
    [_passwordTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_passwordView addSubview:_passwordTextField];
    
    
    _passwordLineView = [[UIView alloc]initWithFrame:CGRectMake(0, _passwordView.frame.size.height -1, _userMobileView.frame.size.width, 1)];
    [_passwordLineView setBackgroundColor:Default_Text_Gray_Color_10];
    [_passwordLineView.layer setCornerRadius:1];
    [_passwordView addSubview:_passwordLineView];
    
    
    float logInBtnWidth = 225;
    float logInBtnHeight = 36;
    
    _logInBtn = [[UIButton alloc]initWithFrame:CGRectMake( (whiteContentViewWidth -logInBtnWidth)/2, _passwordView
                                                          .frame.origin.y +40 +25, logInBtnWidth, logInBtnHeight)];
    [_logInBtn setBackgroundImage:[UIImage imageNamed:@"Log_In_Btn_Normal"] forState:UIControlStateNormal];
    [_logInBtn setBackgroundImage:[UIImage imageNamed:@"Log_In_Btn_Highlight"] forState:UIControlStateHighlighted];
    [_logInBtn addTarget:self action:@selector(logInBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_whiteContentView addSubview:_logInBtn];
 
 
    NSString * registerrr = @"注册账号";
    UIFont * registerFont = [VibeFont fontWithName:Font_Chinese_Regular size:11];
    CGSize regiserBtnSize = [registerrr getSizeWithLimitSize:CGSizeMake(100, 20) withFont:registerFont];
    float registerBtnWidth = regiserBtnSize.width;
    float registerBtnHeight = regiserBtnSize.height +1.0f;
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(45, _logInBtn.frame.origin.y +logInBtnHeight +10, registerBtnWidth, registerBtnHeight)];
    [_registerBtn setTitleColor:Default_Text_Dark_Color_20 forState:UIControlStateNormal];
    [_registerBtn setTitleColor:Default_Text_Dark_Color_10 forState:UIControlStateHighlighted];
    [_registerBtn.titleLabel setFont:registerFont];
    [_registerBtn setTitle:registerrr forState:UIControlStateNormal];
    [_registerBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_whiteContentView addSubview:_registerBtn];
    
    
    NSString * forgettt = @"忘记密码？";
    UIFont * forgetFont = registerFont;
    CGSize forgetBtnSize = [forgettt getSizeWithLimitSize:CGSizeMake(100, 20) withFont:forgetFont];
    float forgetBtnWidth = forgetBtnSize.width;
    float forgetBtnHeight = forgetBtnSize.height +1.0f;
    _forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(whiteContentViewWidth -45 -forgetBtnWidth, _logInBtn.frame.origin.y +logInBtnHeight +10, forgetBtnWidth, forgetBtnHeight)];
    [_forgetBtn setTitle:forgettt forState:UIControlStateNormal];
    [_forgetBtn setTitleColor:Default_Text_Dark_Color_20 forState:UIControlStateNormal];
    [_forgetBtn setTitleColor:Default_Text_Dark_Color_10 forState:UIControlStateHighlighted];
    [_forgetBtn.titleLabel setFont:forgetFont];
    [_forgetBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [_whiteContentView addSubview:_forgetBtn];

    
    float wechatBtnWidth = 211;
    float wechatBtnHeight = 17;
    
    _wechatBtn = [[UIButton alloc]initWithFrame:CGRectMake( (whiteContentViewWidth -wechatBtnWidth)/2, _registerBtn.origin.y +registerBtnHeight +30, wechatBtnWidth, wechatBtnHeight)];
    [_wechatBtn setBackgroundImage:[UIImage imageNamed:@"Log_In_Wechat_Btn_Normal"] forState:UIControlStateNormal];
    [_wechatBtn setBackgroundImage:[UIImage imageNamed:@"Log_In_Wechat_Btn_Highlight"] forState:UIControlStateHighlighted];
    [_whiteContentView addSubview:_wechatBtn];
    
}


-(void)setWhiteCornerView
{
    //设置左边的圆角
    CAShapeLayer * maskLayer1 = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:_whiteContentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
    maskLayer1.frame = _whiteContentView.bounds;
    maskLayer1.path = maskPath1.CGPath;
    _whiteContentView.layer.mask = maskLayer1;
    
    CAShapeLayer * maskLayer2 = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:_whiteShadowView1.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
    maskLayer2.frame = _whiteShadowView1.bounds;
    maskLayer2.path = maskPath2.CGPath;
    _whiteShadowView1.layer.mask = maskLayer2;
    
    CAShapeLayer * maskLayer3 = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath3 = [UIBezierPath bezierPathWithRoundedRect:_whiteShadowView2.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
    maskLayer3.frame = _whiteShadowView2.bounds;
    maskLayer3.path = maskPath3.CGPath;
    _whiteShadowView2.layer.mask = maskLayer3;
    
}


-(void)initNaviView
{
    [self.rightBtn setHidden:NO];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Highlight"] forState:UIControlStateHighlighted];
    
    [self.view bringSubviewToFront:self.leftBtn];
    [self.view bringSubviewToFront:self.rightBtn];
}



#pragma mark -键盘升起
-(void)didRaiseKeyboard
{
    _isKeyboardShown = YES;
    
    if (iPhone5) {
        _keyboardHeight = 253;
    }
    else if (iPhone6){
        _keyboardHeight = 258;
    }
    else if (iPhone6plus){
        _keyboardHeight = 271;
    }
    
    float whiteContentViewWidth = kScreenWidth -60;
    float whiteContentViewHeight = kScreenHeight - _keyboardHeight -Navi_View_Height -35;

    
    NSString * welcome = @"欢迎来到\nVIBE手作社区！";
    UIFont  * welcomeFont = [VibeFont fontWithName:Font_Chinese_Regular size:17];
    [[VibeAppTool sharedInstance] setLabelSpace:_welcomeLabel withText:welcome withFont:welcomeFont withLineSpacing:5.0f];
    float welcomeTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:welcome withFont:_welcomeLabel.font withWidth:kScreenWidth -60 -45 -20 withLineSpacing:5.0] +2.0f;
    [_welcomeLabel setFont:welcomeFont];
    
    
    float inputViewHeight = 40;
    
    float logInBtnWidth = 225;
    float logInBtnHeight = 36;
    
    
    CGRect registerBtnFrame = _registerBtn.frame;
    registerBtnFrame.origin.y = registerBtnFrame.origin.y -40;

    CGRect forgetBtnFrame = _forgetBtn.frame;
    forgetBtnFrame.origin.y = forgetBtnFrame.origin.y -40;

    CGRect wechatBtnFrame = _wechatBtn.frame;
    wechatBtnFrame.origin.y = wechatBtnFrame.origin.y -55;
    
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        
        //白色蒙版
        [_whiteContentView setFrame:CGRectMake(60, Navi_View_Height +15, whiteContentViewWidth, whiteContentViewHeight)];

        [_whiteShadowView1 setFrame:CGRectMake(65 , Navi_View_Height +15, whiteContentViewWidth -5, whiteContentViewHeight +5)];
        
        [_whiteShadowView2 setFrame:CGRectMake(65 +5 , Navi_View_Height +15, whiteContentViewWidth -5 -5, whiteContentViewHeight +5 +5)];
        
        //欢迎
        [_welcomeLabel setFrame:CGRectMake(45, 30, 200, welcomeTextHeight)];

        //电话号码
        [_userMobileView setFrame:CGRectMake(45, _welcomeLabel.frame.origin.y +welcomeTextHeight +15, whiteContentViewWidth -90, inputViewHeight)];
        
        //密码
        [_passwordView setFrame:CGRectMake(45,  _userMobileView.frame.origin.y +inputViewHeight +10, whiteContentViewWidth -90, inputViewHeight)];
        
        //登录
        [_logInBtn setFrame:CGRectMake( (whiteContentViewWidth -logInBtnWidth)/2, _passwordView
                                       .frame.origin.y +inputViewHeight +15, logInBtnWidth, logInBtnHeight)];
        
        //注册按钮
        [_registerBtn setFrame:registerBtnFrame];
        
        //忘记密码
        [_forgetBtn setFrame:forgetBtnFrame];
        
        //微信登录
        [_wechatBtn setFrame:wechatBtnFrame];
        
    } completion:^(BOOL finished) {
        
        
        
    }];
    
    
    
    [self setWhiteCornerView];
}


#pragma mark -textField的代理方法

//限制输入手机号的字数
- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == _userMobileTextField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }
    
    
    NSInteger userMobileTextFieldLength = _userMobileTextField.text.length;
    NSInteger passwordTextFieldLength = _passwordTextField.text.length;
    
    if (userMobileTextFieldLength == 11 && passwordTextFieldLength >3) {
        [_userMobileLineView setBackgroundColor:DefaultGreen];
        [_passwordLineView setBackgroundColor:DefaultGreen];
        
        _isAbleToLogIn = YES;
    }
    else{
        [_userMobileLineView setBackgroundColor:Default_Text_Gray_Color_10];
        [_passwordLineView setBackgroundColor:Default_Text_Gray_Color_10];
    
        _isAbleToLogIn = NO;
    }
    
}







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
    //
    if (_isKeyboardShown == NO) {
        [self didRaiseKeyboard];
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"......");
    return YES;
}


#pragma mark -点击登录按钮
-(void)logInBtnClicked
{
    //不可点击登录
    if (!_isAbleToLogIn) {
        [FTIndicator showInfoWithMessage:@"请输入完整的手机号及密码" userInteractionEnable:NO];
    }
    else{
        
    }
}

#pragma mark -点击注册按钮
-(void)registerBtnClicked
{
    [_userMobileTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self.lcNavigationController pushViewController:registerVC];
}


#pragma mark -点击右边的设置按钮
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
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewWillAppear:animated];
}


@end
