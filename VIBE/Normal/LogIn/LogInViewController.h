//
//  LogInViewController.h
//  VIBE
//
//  Created by Li Haii on 16/9/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

@interface LogInViewController : VibeViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    UIScrollView * _backScrollView;
    
    UIView          * _logoView;
    
    UIView          * _userNameView;
    UITextField     * _userNameTxtField;
    UIView          * _userNameLineView;
    
    UIView          * _passwordView;
    UITextField     * _passwordTxtField;
    UIView          * _passwordLineView;
    
    UIButton        * _forgetPasswordBtn;
    
    UIView          * _loginView;
    UIView          * _wechatView;
    
    UIButton        * _registerBtn;
}
@end
