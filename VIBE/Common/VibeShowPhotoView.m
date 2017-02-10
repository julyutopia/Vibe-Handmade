//
//  VibeShowPhotoView.m
//  VIBE
//
//  Created by Li Haii on 2016/12/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeShowPhotoView.h"

@implementation VibeShowPhotoView

+(id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


-(id)init
{
    CGRect frame=[[UIApplication sharedApplication] keyWindow].frame;
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        _detailPhotoBackView = [[UIView alloc]initWithFrame:frame];
        [_detailPhotoBackView setBackgroundColor:RGBA(0, 0, 0, 85)];
        [_detailPhotoBackView setHidden:YES];
        [self addSubview:_detailPhotoBackView];
        
        UITapGestureRecognizer * tappp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideDetailPhotoView:)];
        [tappp setNumberOfTapsRequired:1];
        [tappp setNumberOfTouchesRequired:1];
        [tappp setDelegate:self];
        [_detailPhotoBackView addGestureRecognizer:tappp];
        
        UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapClick:)];
        [doubleTap setNumberOfTapsRequired:2];
        [doubleTap setNumberOfTouchesRequired:1];
        [tappp requireGestureRecognizerToFail:doubleTap];
        [doubleTap setDelegate:self];
        [_detailPhotoBackView addGestureRecognizer:doubleTap];
        
        _loadingIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_loadingIndicatorView setHidden:YES];
        [_loadingIndicatorView setCenter:_detailPhotoBackView.center];
        [_detailPhotoBackView addSubview:_loadingIndicatorView];
        
        _loadingImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
    }
    
    return self;
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)hideDetailPhotoView:(UITapGestureRecognizer *)tappp
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    
    [UIView animateWithDuration:0.25f
                     animations:^{
                         
                         [_detailPhotoBackView setAlpha:0.0f];
                         
                     } completion:^(BOOL finished) {
                         
                         [_detailPhotoBackView setHidden:YES];
                         
                         VIPhotoView * detailPhotoView = (VIPhotoView *)[_detailPhotoBackView viewWithTag:223344];
                         [detailPhotoView removeFromSuperview];
                         
                         [self removeFromSuperview];
                         
                     }];
}

-(void)doubleTapClick:(UITapGestureRecognizer *)tappp
{
    return;
}


#pragma mark ----  Show ActionSheet

-(void)showWithImageURL:(NSString *)url WithView:(UIView *)view
{
    [view addSubview:self];
 
    [_detailPhotoBackView setHidden:NO];
    
    [UIView animateWithDuration:0.2f animations:^{
        
        [_detailPhotoBackView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
    }];
    
    [_loadingIndicatorView setHidden:NO];
    [_loadingIndicatorView startAnimating];
    
    [_loadingImgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"Discover_Topic_Normal"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        
        [_loadingIndicatorView setHidden:YES];
        
        VIPhotoView * detailPhotoView = [[VIPhotoView alloc] initWithFrame:self.frame andImage:image andURL:@""];
        [detailPhotoView setTag:223344];
        detailPhotoView.autoresizingMask = (1 << 6) -1;
        [_detailPhotoBackView addSubview:detailPhotoView];
        
    }];
}


#pragma mark ----  Dealloc
-(void)dealloc
{
    
}

@end
