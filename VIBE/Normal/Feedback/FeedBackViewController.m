//
//  FeedBackViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/3/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNaviBar];
}


-(void)initNaviBar
{
    UIView  * backView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:backView];
    
    CAGradientLayer * gradientViewLayer = [CAGradientLayer layer];
    gradientViewLayer.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    gradientViewLayer.startPoint = CGPointMake(0.3, 0.0);
    gradientViewLayer.endPoint = CGPointMake(0.7, 1.0);
    gradientViewLayer.colors = @[
                                 (id)RGB(85, 239, 203).CGColor,
                                 (id)RGB(91, 202, 255).CGColor,
                                 ];
    [backView.layer addSublayer:gradientViewLayer];
    
    
    [self.topNavView setBackgroundColor:RGBA(255, 255, 255, 100)];
    [self.topNavView setHidden:NO];
    [self.view bringSubviewToFront:self.topNavView];
    
    [self.titleLabel setText:@"意见反馈"];
    [self.view bringSubviewToFront:self.titleLabel];
    
    //返回键
    [self.view bringSubviewToFront:self.backBtn];

    
    //根据设备取得键盘高度
    float maxKeyBoardHeight;
    if (iPhone5) {
        maxKeyBoardHeight = 253;
    }
    else if (iPhone6){
        maxKeyBoardHeight = 258;
    }
    else if (iPhone6plus){
        maxKeyBoardHeight = 271;
    }
    
    
    _feedbackView = [[UIView alloc]initWithFrame:CGRectMake(15, height_headerview +20, kScreenWidth -30, kScreenHeight -maxKeyBoardHeight -(height_headerview +20) -30)];
    [_feedbackView setBackgroundColor:RGBA(255, 255, 255, 100)];
    [_feedbackView.layer setCornerRadius:4];
    [_feedbackView.layer setMasksToBounds:YES];
    [backView addSubview:_feedbackView];
    
    float toolBarHeight = 36;
    
    _feedbackTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0, 0, _feedbackView.frame.size.width, _feedbackView.frame.size.height -toolBarHeight -4)];
    [_feedbackTextView setBackgroundColor:[UIColor clearColor]];
    _feedbackTextView.placeholderLabel.textColor = DefaultQYTextColor30;
    _feedbackTextView.placeholderLabel.font = [VibeFont fontWithName:Default_Font size:14];
    [_feedbackTextView setTextColor:DefaultQYTextColor80];
    [_feedbackTextView setFont:[VibeFont fontWithName:Default_Font size:14]];
    [_feedbackTextView setDelegate:self];
    _feedbackTextView.textContainerInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    [_feedbackTextView setPlaceholder:@"请输入你对VIBE的任何意见和建议"];
    [_feedbackTextView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:1.0f];
    [_feedbackView addSubview:_feedbackTextView];
    
    
    float bottomRightViewWidth = 136;
    
    UIView * bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, _feedbackView.frame.size.height -toolBarHeight, _feedbackView.frame.size.width -bottomRightViewWidth, toolBarHeight)];
    [bottomLeftView setBackgroundColor:RGBA(245, 245, 245, 100)];
    [_feedbackView addSubview:bottomLeftView];
    
    
    _sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(_feedbackView.frame.size.width -bottomRightViewWidth, _feedbackView.frame.size.height -toolBarHeight, bottomRightViewWidth, 36)];
    [_sendBtn setEnabled:NO];
    [_sendBtn setBackgroundImage:[UIImage imageNamed:@"FeedBack"] forState:UIControlStateNormal];
    [_sendBtn setBackgroundImage:[UIImage imageNamed:@"FeedBack_Highlighted"] forState:UIControlStateHighlighted];
    [_sendBtn addTarget:self action:@selector(didClickSendBtn) forControlEvents:UIControlEventTouchUpInside];
    [_feedbackView addSubview:_sendBtn];
    
}


#pragma mark -点击发送
-(void)didClickSendBtn
{
    NSString * contentText = _feedbackTextView.text;
    
    //仅输入空格
    if ([VibeAppTool isStringEmpty:contentText]) {
        [FTIndicator showErrorWithMessage:@"发送内容不能为空." userInteractionEnable:NO];
        return;
    }
}


#pragma mark -textView代理
-(void)textViewDidChange:(UITextView *)textView
{
    NSInteger inputWordCount = textView.text.length;
 
    if (inputWordCount == 0) {
        [_sendBtn setEnabled:NO];
    }
    else{
        [_sendBtn setEnabled:YES];
    }
}


#pragma mark -ViewWillApear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [_feedbackTextView resignFirstResponder];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
