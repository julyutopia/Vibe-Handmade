//
//  RegisterViewController.h
//  VIBE
//
//  Created by Li Haii on 16/9/8.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "SimpleImagePickerController.h"

#import "RSKImageCropViewController.h"

#import "AnimatedGIFImageSerialization.h"

#import "AnimatedGradientView.h"

@interface RegisterViewController : BasicViewController <UITextFieldDelegate,UIScrollViewDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,SimpleImagePickerControllerDelegate, RSKImageCropViewControllerDataSource, RSKImageCropViewControllerDelegate>
{
    
    UIView      * _backCiew;
    
    UIImageView * _backImgView;
    
    float         _keyboardHeight;
    
    UIView      * _whiteContentView;
    UIView      * _whiteShadowView1;
    UIView      * _whiteShadowView2;
    
    
    //显示绑定手机号的View
    UIView      * _fillMobileView;
    
    //欢迎Label
    UILabel     * _welcomeLabel;
    
    //输入手机号View
    UIView      * _mobileNumberView;
    UITextField * _mobileNumberTextField;
    UIButton    * _sendCodeBtn;
    UIView      * _mobileNumberLineView;
    
    //输入验证码View
    UIView      * _verifyCodeView;
    UITextField * _verifyCodeTextField;
    UIView      * _verifyCodeLineView;
    
    
    //设置密码View
    UIView      * _setPasswordView;
    UITextField * _setPasswordTextField;
    UIView      * _setPasswordLineView;
    
    
    //下一步Btn
    UIButton    * _nextBtn;
    
    
    //判断是否已发送验证码
    BOOL          _didSendCode;
    
    
    //验证码倒计时
    NSTimer     * _timer;
    NSInteger     _countingDownSeconds;
    
    
    //判断是否可以点击下一步
    BOOL          _isAbleToNext;
    
    
    //下一步补充资料View
    UIView      * _profileView;
    
    //用户头像
    UIButton    * _userPhotoBtn;
    
    //用户名View
    UIView      * _userNameView;
    UITextField * _userNameTextField;
    UIView      * _userNameLineView;
    
    //签名View
    UIView      * _signatureView;
    UITextField * _signatureTextField;
    UIView      * _signatureLineView;
    
    //下一步Btn
    UIButton    * _registerBtn;
    
    //社区规范
    UIView      * _communityView;
    UILabel     * _firstCommunityLabel;
    UIButton    * _secondCommunityBtn;
    
    //用户已选择的头像
    UIImage     * _userPhotoImage;
    
    
//    BOOL              _isShowingSecondStep;//是否显示第二步
//    
//    BOOL              _didClickSendCodeBtn;//是否已点击发送验证码
//    
//    UIImageView     * _backgroundGifView;
//    
//    UIView          * _maskView;
//    UIScrollView    * _backScrollView;
//    
//    UIView          * _firstStepView;
//    UIView          * _secondStepView;
//    
//    UIView          * _avatarView;
//    UIImageView     * _avatarBackImgView;
//    UIButton        * _avatarBtn;
//    UIImage         * _avatarImage;
//  
//    
//    BOOL              _firstStepAlreadyShowGradient;
//    BOOL              _secondStepAlreadyShowGradient;
//    
//    
//    //手机号
//    UIView          * _phoneNumberView;
//    UITextField     * _phoneNumberTextFiled;
//    AnimatedGradientView * _phoneAnimatedGradienView;
//
//    //发送验证码按钮
//    GLImageView     * _sendCodeBtn;
//    BOOL              _didClickSend;
//    NSTimer         * _timer;
//
//    //已发送验证码按钮
//    UIView          * _sendingCodeView;
//    UILabel         * _sendingCodeLabel;
//    UILabel         * _sendingSecondsLabel;
//    NSInteger         _countingDownSeconds;
//
//    //验证码
//    UIView          * _codeNumberView;
//    UITextField     * _codeNumberTextFiled;
//    AnimatedGradientView * _codeAnimatedGradienView;
//
//    
//    //密码
//    UIView          * _passwordView;
//    UITextField     * _passwordTextFiled;
//    AnimatedGradientView * _passwordAnimatedGradienView;
//    
//    //下一步
//    UIButton        * _nextStepBtn;
//    
//    //昵称
//    UIView          * _userNameView;
//    UITextField     * _userNameTextFiled;
//    AnimatedGradientView * _userNameAnimatedGradienView;
//    
//    //签名
//    UIView          * _signView;
//    UITextField     * _signTextField;
//    AnimatedGradientView * _signAnimatedGradienView;
//    
//    //登录按钮
//    UIButton        * _registerBtn;
//    
//    //同意许可
//    UIImageView     * _bottomTextImgView;
//    UIButton        * _bottomCommuneBtn;
//    
//    //键盘起始的高度位置
//    float             _keyboardOriginY;
    
}

//@property(retain,nonatomic)UIButton * beforeBtn;

@end



