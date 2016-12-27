//
//  AnimatedGradientView.h
//  VIBE
//
//  Created by Li Haii on 16/10/17.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedGradientView : UIView
{
    float     _viewWidth;
    float     _viewHeight;
    
    UIView  * _rootView;
    
    UIView  * _gradientBackView;
    UIView  * _gradientView;
}

-(id)initWithFrame:(CGRect)frame WithGradientColors1:(UIColor *)color1 GradientColors2:(UIColor *)color2;

-(void)showGradient;
-(void)hideGradient;

@end
