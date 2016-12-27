//
//  AnimatedGradientView.m
//  VIBE
//
//  Created by Li Haii on 16/10/17.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "AnimatedGradientView.h"

@implementation AnimatedGradientView

-(id)initWithFrame:(CGRect)frame WithGradientColors1:(UIColor *)color1 GradientColors2:(UIColor *)color2
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _viewWidth = frame.size.width;
        _viewHeight = frame.size.height;
        
        _rootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        [_rootView setBackgroundColor:RGBA(255, 255, 255, 50)];
        [_rootView setAlpha:0.5f];
        [self addSubview:_rootView];
        
        
        _gradientView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        [_gradientView setAlpha:0.0f];
        [self addSubview:_gradientView];
        
        
        CAGradientLayer * gradientViewLayer = [CAGradientLayer layer];
        gradientViewLayer.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
        gradientViewLayer.startPoint = CGPointMake(0, 0.5);
        gradientViewLayer.endPoint = CGPointMake(1.0, 0.5);
        gradientViewLayer.colors = @[
                                     (id)color1.CGColor,
                                     (id)color2.CGColor,
                                     ];
        [_gradientView.layer addSublayer:gradientViewLayer];
        
    }
    
    return self;
}


-(void)showGradient
{
    [UIView animateWithDuration:0.5f animations:^{
        [_rootView setAlpha:0.0f];
        [_gradientView setAlpha:0.5f];
    }];
}

-(void)hideGradient
{
    [UIView animateWithDuration:0.5f animations:^{
        [_rootView setAlpha:0.5f];
        [_gradientView setAlpha:0.0f];
    }];
}


@end


