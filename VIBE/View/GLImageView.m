//
//  GLImageView.m
//  QYER
//
//  Created by chenguanglin on 14/10/14.
//  Copyright (c) 2014年 QYER. All rights reserved.
//

#import "GLImageView.h"

@implementation GLImageView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (limitMultiple == YES) {
        return;
    }
    limitMultiple = YES;
    
    if (!self.hiddenBackView) {
        blackView = [[UIView alloc]initWithFrame:touch.view.bounds];
        blackView.backgroundColor = [UIColor whiteColor];
        blackView.alpha = 0.35;
        blackView.tag = 1000;
        [touch.view addSubview:blackView];        
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blackView) {
            [blackView  removeFromSuperview];
            blackView = nil;
        }
    });
    limitMultiple = NO;
    
    if (controlEvent == UIControlEventTouchUpInside) {
        
        if (_delegate && [_delegate respondsToSelector:methodAction]) {
            [_delegate performSelectorOnMainThread:methodAction withObject:self waitUntilDone:NO];
            
        }
    }

    
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    limitMultiple = NO;
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blackView) {
            [blackView  removeFromSuperview];
            blackView = nil;
        }
    });
    limitMultiple = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    limitMultiple = NO;
    
    dispatch_async(dispatch_get_main_queue(), ^{
//        if (blackView) {
//            [blackView  removeFromSuperview];
//            blackView = nil;
//        }
    });
    limitMultiple = NO;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    _delegate = target;
    controlEvent = controlEvents;
    methodAction = action;
}

#pragma mark - SDWebImage
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [super sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageRetryFailed | SDWebImageLowPriority)];
}

- (void)sd_setImageWithURL:(NSURL *)url
{
    [super sd_setImageWithURL:url placeholderImage:nil options:(SDWebImageRetryFailed | SDWebImageLowPriority)];
}

- (void)sd_setImageWithURL:(NSURL *)url completed:(SDExternalCompletionBlock)completedBlock
{
    [super sd_setImageWithURL:url placeholderImage:nil options:(SDWebImageRetryFailed | SDWebImageLowPriority) completed:completedBlock];
}

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock
{
    [super sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageRetryFailed | SDWebImageLowPriority) completed:completedBlock];
}

@end
