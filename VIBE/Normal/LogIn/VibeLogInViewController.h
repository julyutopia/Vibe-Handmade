//
//  VibeLogInViewController.h
//  VIBE
//
//  Created by Li Haii on 16/10/15.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "RegisterViewController.h"

#import "AnimatedGIFImageSerialization.h"

@interface VibeLogInViewController : VibeViewController<UITextFieldDelegate,UIScrollViewDelegate, UIScrollViewDelegate>
{
    UIScrollView * _backScrollView;
    
    UIImageView    * _backgroundGifView;
    
    UIView       * _maskView;
    
    UIView       * _showContentView;
    
    UIView       * _infoView;
    
    UIView       * _userNameView;
    UIImageView  * _userNameImgView;
    UITextField  * _userNameTextField;
    
    UIView       * _passwordView;
    UIImageView  * _passwordImgView;
    UITextField  * _passwordTextField;
    
    UIButton     * _loginBtn;
    
    UIButton     * _registerBtn;
    UIButton     * _forgetPasswordBtn;
    
    UIButton    * _wechatLogInBtn;
}

@end
