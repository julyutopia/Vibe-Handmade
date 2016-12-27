//
//  WebViewController.m
//  VIBE
//
//  Created by Li Haii on 16/10/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = DefaultBackgroundColor;
    [_webView setOpaque:NO];
    _webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 50, 0);
    _webView.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 50, 0);
    [self.view addSubview:_webView];
    
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _naviView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [_naviView setFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    [self.view addSubview:_naviView];
    
    NSString * loadingString = @"加载中...";
    UIFont  * loadingFont = [UIFont fontWithName:Default_Font size:14];
    float loadingWidth = [loadingString getSizeWithLimitSize:CGSizeMake(100, 20) withFont:loadingFont].width;
    
    UIActivityIndicatorView * loadingIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
    [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    loadingIndicator.transform = CGAffineTransformMakeScale(0.6, 0.6);
    [loadingIndicator startAnimating];
    
    UILabel * loadLabel = [[UILabel alloc]initWithFrame:CGRectMake(16+4, 0, loadingWidth, 16)];
    [loadLabel setText:loadingString];
    [loadLabel setTextColor:[UIColor lightGrayColor]];
    [loadLabel setTextAlignment:NSTextAlignmentLeft];
    [loadLabel setFont:loadingFont];
    
    float loadingViewWidth = 15 +2 +loadingWidth;
    
    _naviLoadingView = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidth -loadingViewWidth)/2, 32,loadingViewWidth, 16)];
    [_naviLoadingView addSubview:loadingIndicator];
    [_naviLoadingView addSubview:loadLabel];
    
    [_naviView addSubview:_naviLoadingView];
    
    //主标题
    _naviMainTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake( (kScreenWidth -200)/2, 24, 200, 20)];
    [_naviMainTitleLabel setTextColor:DefaultQYTextColor80];
    [_naviMainTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_naviMainTitleLabel setFont:[UIFont fontWithName:Default_Font_Middle size:15]];
    [_naviMainTitleLabel setAlpha:0.0f];
    [_naviView addSubview:_naviMainTitleLabel];
    
    //副标题
    _naviSubTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake( (kScreenWidth -200)/2, 43, 200, 15)];
    [_naviSubTitleLabel setTextColor:DefaultQYTextColor40];
    [_naviSubTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_naviSubTitleLabel setFont:[UIFont fontWithName:Default_Font size:12]];
    [_naviSubTitleLabel setAlpha:0.0f];
    [_naviView addSubview:_naviSubTitleLabel];
    
    
    //底部栏
    _bottomBarView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [_bottomBarView setFrame:CGRectMake(0, kScreenHeight -50, kScreenWidth, 50)];
    [self.view addSubview:_bottomBarView];
    
    float iconWidth = 24;
    float gappp = (kScreenWidth -35 *2 -iconWidth *4)/3;
    
    _previousBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, (50 -iconWidth)/2, iconWidth, iconWidth)];
    [_previousBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Back_Unable"] forState:UIControlStateNormal];
    [_previousBtn addTarget:self action:@selector(previousBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBarView addSubview:_previousBtn];
    
    _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(35 +gappp, (50 -iconWidth)/2, iconWidth, iconWidth)];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Next_Unable"] forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(nextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBarView addSubview:_nextBtn];
 
    _refreshBtn = [[UIButton alloc]initWithFrame:CGRectMake(35 +gappp +iconWidth +gappp, (50 -iconWidth)/2, iconWidth, iconWidth)];
    [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Refresh_Unable"] forState:UIControlStateNormal];
    [_refreshBtn addTarget:self action:@selector(refreshBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBarView addSubview:_refreshBtn];

    
    //隐藏的旋转菊花
    _indicatorView = [[UIActivityIndicatorView alloc]initWithFrame:_refreshBtn.frame];
    [_indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [_indicatorView setHidden:YES];
    [_bottomBarView addSubview:_indicatorView];
    
    
    _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake( kScreenWidth -35 -iconWidth, (50 -iconWidth)/2, iconWidth, iconWidth)];
    [_closeBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Close_Normal"] forState:UIControlStateNormal];
    [_closeBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Close_HighLight"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBarView addSubview:_closeBtn];

    
    _didLoadSuccess = NO;
    
    //无网络
    if (isNotReachable) {
        [self showErrorText:@"暂无网络连接"];
        [self performSelector:@selector(closeBtnClicked) withObject:nil afterDelay:2.0f];
    }
    else{
        NSURL *url = [NSURL URLWithString:self.linkURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
    
}


//点击后退
-(void)previousBtnClicked
{
    if (![_webView canGoBack]) {
        return;
    }
    [_webView goBack];
}

//点击前进
-(void)nextBtnClicked
{
    if (![_webView canGoForward]) {
        return;
    }
    [_webView goForward];
}

//点击刷新
-(void)refreshBtnClicked
{
    NSURL *url= _webView.request.URL;
    [_webView loadRequest:[NSMutableURLRequest requestWithURL:url]];
}

//点击关闭
-(void)closeBtnClicked
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self dismissLoading];
    }];
}


#pragma mark -webView Delegate
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    if (_didLoadSuccess == YES) {
        
        [_refreshBtn setHidden:YES];
        [_indicatorView setHidden:NO];
        [_indicatorView startAnimating];
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    _didLoadSuccess = YES;
    
    NSString * title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [_naviMainTitleLabel setText:title];
    
    NSString *subTitle= webView.request.URL.absoluteString;
    [_naviSubTitleLabel setText:subTitle];
    
    
    if (_naviMainTitleLabel.alpha == 0.0) {
        
        [UIView animateWithDuration:0.15f animations:^{
            
            [_naviLoadingView setAlpha:0.0f];
           
        } completion:^(BOOL finished) {
            
            [_naviMainTitleLabel setAlpha:1.0f];
            [_naviSubTitleLabel setAlpha:1.0f];
        }];
    }
    
    
    if ([webView canGoBack]) {
        [_previousBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Back_Normal"] forState:UIControlStateNormal];
    }
    else{
        [_previousBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Back_Unable"] forState:UIControlStateNormal];
    }
    
    if ([webView canGoForward]) {
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Next_Normal"] forState:UIControlStateNormal];
    }
    else{
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Next_Unable"] forState:UIControlStateNormal];
    }
    
    [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"WebView_Refresh_Normal"] forState:UIControlStateNormal];
    
    [_refreshBtn setHidden:NO];
    [_indicatorView setHidden:YES];
    [_indicatorView stopAnimating];
    
}

//-(void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
//{
//    [_refreshBtn setHidden:NO];
//    [_indicatorView setHidden:YES];
//    [_indicatorView stopAnimating];
//}


#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
