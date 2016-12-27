//
//  WebViewController.h
//  VIBE
//
//  Created by Li Haii on 16/10/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    float                 _naviBarHeight;
    
    UIView              * _naviView;
    
    UIView              * _naviLoadingView;
    UILabel             * _naviMainTitleLabel;
    UILabel             * _naviSubTitleLabel;
    
    UIWebView           * _webView;
    
    UIView              * _bottomBarView;
    
    UIButton            * _previousBtn;
    UIButton            * _nextBtn;
    UIButton            * _refreshBtn;
    UIButton            * _closeBtn;
    
    UIActivityIndicatorView * _indicatorView;
    
    BOOL                _didLoadSuccess;
    
}

@property(retain, nonatomic)NSString * linkURL;

@end
