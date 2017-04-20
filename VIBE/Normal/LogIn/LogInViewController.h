//
//  LogInViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/19.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "RegisterViewController.h"

@interface LogInViewController : BasicViewController<UIScrollViewDelegate ,UITextFieldDelegate>
{
    UIView      * _backCiew;
    
    UIImageView * _backImgView;
    
    UIView      * _whiteContentView;
    UIView      * _whiteShadowView1;
    UIView      * _whiteShadowView2;
 
    UILabel     * _welcomeLabel;
    
    UIView      * _userMobileView;
    UITextField * _userMobileTextField;
    UIView      * _userMobileLineView;

    UIView      * _passwordView;
    UITextField * _passwordTextField;
    UIView      * _passwordLineView;

    UIButton    * _logInBtn;
    UIButton    * _registerBtn;
    UIButton    * _forgetBtn;
    
    UIButton    * _wechatBtn;
    
    BOOL          _isKeyboardShown;
    float         _keyboardHeight;
    
    //判断是否可以点击登录按钮
    BOOL          _isAbleToLogIn;
}


@end
