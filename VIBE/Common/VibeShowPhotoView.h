//
//  VibeShowPhotoView.h
//  VIBE
//
//  Created by Li Haii on 2016/12/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VIPhotoView.h"

@interface VibeShowPhotoView : UIView<UIGestureRecognizerDelegate>
{
    UIView * _detailPhotoBackView;
    
    UIERealTimeBlurView * _blurBackView;
    
    UIView * _detailPhotoTapView;
    UIActivityIndicatorView * _loadingIndicatorView;
    
    UIImageView * _loadingImgView;
}

+(id)sharedInstance;

-(void)showWithImageURL:(NSString *)url WithView:(UIView *)view;

@end
