//
//  GLImageView.h
//  QYER
//
//  Created by chenguanglin on 14/10/14.
//  Copyright (c) 2014年 QYER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLImageView : UIImageView
{
    UIView *blackView;
    BOOL limitMultiple;
    
    __weak id _delegate;
    UIControlEvents controlEvent;
    SEL methodAction;
}
@property (nonatomic, assign) BOOL hiddenBackView;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
