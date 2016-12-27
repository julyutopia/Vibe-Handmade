//
//  RegisterViewController.h
//  VIBE
//
//  Created by Li Haii on 16/9/8.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "SimpleImagePickerController.h"

#import "AnimatedGIFImageSerialization.h"

#import "AnimatedGradientView.h"

@interface RegisterViewController : VibeViewController<UITextFieldDelegate,UIScrollViewDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,SimpleImagePickerControllerDelegate>
{
    BOOL        _isShowingSecondStep;//是否显示第二步
    
    BOOL        _didClickSendCodeBtn;//是否已点击发送验证码
    
    UIView      * _maskView;
    UIScrollView* _backScrollView;
    
    UIView      * _firstStepView;
    UIView      * _secondStepView;
    
    UIView      * _avatarView;
    UIImageView * _avatarBackImgView;
    UIButton    * _avatarBtn;
    UIImage     * _avatarImage;
  
    
    BOOL            _firstStepAlreadyShowGradient;
    BOOL            _secondStepAlreadyShowGradient;
    
    
    //手机号
    UIView      * _phoneNumberView;
    UITextField * _phoneNumberTextFiled;
    AnimatedGradientView * _phoneAnimatedGradienView;

    //发送验证码按钮
    GLImageView    * _sendCodeBtn;
    BOOL          _didClickSend;
    NSTimer        * _timer;
    
    //已发送验证码按钮
    UIView      * _sendingCodeView;
    UILabel     * _sendingCodeLabel;
    UILabel     * _sendingSecondsLabel;
    NSInteger     _countingDownSeconds;
    
    //验证码
    UIView      * _codeNumberView;
    UITextField * _codeNumberTextFiled;
    AnimatedGradientView * _codeAnimatedGradienView;

    
    //密码
    UIView      * _passwordView;
    UITextField * _passwordTextFiled;
    AnimatedGradientView * _passwordAnimatedGradienView;
    
    //下一步
    UIButton    * _nextStepBtn;
    
    //昵称
    UIView      * _userNameView;
    UITextField * _userNameTextFiled;
    AnimatedGradientView * _userNameAnimatedGradienView;
    
    //签名
    UIView      * _signView;
    UITextField * _signTextField;
    AnimatedGradientView * _signAnimatedGradienView;
    
    //登录按钮
    UIButton    * _registerBtn;
    
    //同意许可
    UIImageView * _bottomTextImgView;
    UIButton    * _bottomCommuneBtn;
    
    //键盘起始的高度位置
    float         _keyboardOriginY;
    
}

@property(retain,nonatomic)UIButton * beforeBtn;

@end



