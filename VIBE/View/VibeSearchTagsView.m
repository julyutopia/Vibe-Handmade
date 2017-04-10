//
//  VibeSearchTagsView.m
//  VIBE
//
//  Created by Li Haii on 2017/1/22.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeSearchTagsView.h"

#import "UIView+Positioning.h"

@interface VibeSearchTagsView ()

@property (assign, nonatomic) float viewWidth;

@end

@implementation VibeSearchTagsView

- (VibeSearchTagsButton *)creatButton:(NSString *)text gap:(float)gap {
    
    CGSize textSize = [text sizeWithFont:[VibeFont fontWithName:Default_Font size:12]];
    
    VibeSearchTagsButton *tempButton = [[VibeSearchTagsButton alloc] initWithFrame:CGRectMake(0, 0, textSize.width + gap * 2, 27)];
    tempButton.layer.masksToBounds = YES;
    tempButton.layer.cornerRadius  = 27/2;
    tempButton.layer.borderColor   = RGBA(146, 146, 175, 60).CGColor;
    tempButton.layer.borderWidth   = 0.5;
    tempButton.titleLabel.font     = [VibeFont fontWithName:Default_Font size:12];
    [tempButton setBackgroundColor:[UIColor clearColor]];
    [tempButton setTitle:text forState:UIControlStateNormal];
    [tempButton setTitleColor:DefaultQYTextColor50 forState:UIControlStateNormal];
    
    return tempButton;
    
}

- (VibeSearchTagsButton *)creatSelectableButton:(NSString *)text gap:(float)gap {
    
    if (!self.selectedButtonArray) {
        self.selectedButtonArray = [NSMutableArray array];
    }
    
    NSString * fullText = text;
    
    if (text.length >= 6) {
        text = [NSString stringWithFormat:@"%@...",[text substringToIndex:5]];
    }
    
    CGSize textSize = [text sizeWithFont:[VibeFont fontWithName:Default_Font size:12]];
    
    VibeSearchTagsButton *tempButton = [[VibeSearchTagsButton alloc] initWithFrame:CGRectMake(0, 0, textSize.width + gap * 2, 27)];
    tempButton.layer.masksToBounds = YES;
    tempButton.layer.cornerRadius  = 4;
    [tempButton setExclusiveTouch:YES];
    tempButton.layer.borderColor   = RGBA(146, 146, 175, 60).CGColor;
    tempButton.layer.borderWidth   = 0.8;
    tempButton.titleLabel.font     = [VibeFont fontWithName:Font_Chinese_Regular size:12];
    [tempButton setBackgroundColor:[UIColor clearColor]];
    [tempButton setTitle:text forState:UIControlStateNormal];
    [tempButton setFullTitle:fullText];
    [tempButton setTitleColor:Default_Text_Gray_Color forState:UIControlStateNormal];
    [tempButton setTitleColor:RGBA(106, 106, 127, 90) forState:UIControlStateHighlighted];
    [tempButton addTarget:self action:@selector(didClickSearchTempBtn:) forControlEvents:UIControlEventTouchUpInside];
    [tempButton addTarget:self action:@selector(didTouchTempButton:) forControlEvents:UIControlEventTouchDown];
    [tempButton addTarget:self action:@selector(cancleTouchTempButton:) forControlEvents:UIControlEventTouchCancel];
    [tempButton addTarget:self action:@selector(cancleTouchTempButton:) forControlEvents:UIControlEventTouchUpOutside];
    
    return tempButton;
}

-(void)didTouchTempButton:(VibeSearchTagsButton *)btn
{
    [btn setBackgroundColor:RGBA(80, 80, 80, 10)];
    btn.layer.borderColor   = RGBA(146, 146, 175, 60).CGColor;
}

-(void)cancleTouchTempButton:(VibeSearchTagsButton *)btn
{
    [btn setBackgroundColor:[UIColor clearColor]];
    btn.layer.borderColor   = RGBA(146, 146, 175, 60).CGColor;
}


- (void)setupWithViewsArray:(NSArray *)array
                   maxWidth:(float)maxWidth
                       hGap:(float)hGap
                       vGap:(float)vGap {
    
    self.backgroundColor = [UIColor clearColor];
    self.allButtonArray  = array;
    
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    float x = 0;
    float y = 0;
    
    for (UIView *view in array) {
        
        if (x + view.width > maxWidth) {
            
            if (x == 0 && view.width > maxWidth) {
                
                view.x = x;
                view.y = y;
                view.width = maxWidth;
                
                y += (vGap + view.height);
                
            }else {
                
                y += (vGap + view.height);
                x = 0;
                
                view.x = x;
                view.y = y;
                x += (hGap + view.width);
                
                if (view.width > maxWidth) {
                    
                    view.width = maxWidth;
                    
                    y += (vGap + view.height);
                    x = 0;
                    
                }
                
            }
            
        }else {
            
            view.x = x;
            view.y = y;
            
            x += (hGap + view.width);
            
        }
        
        self.height = y + view.height;
        self.width  = maxWidth;
        
        [self addSubview:view];
        
    }
    
}


-(void)didClickSearchTempBtn:(VibeSearchTagsButton *)sender
{
    NSString * btnTitle = sender.fullTitle;
    
    [sender setBackgroundColor:[UIColor clearColor]];
    sender.layer.borderColor   = RGBA(146, 146, 175, 60).CGColor;
    
    if ([_delegate respondsToSelector:@selector(didClickSearchKeyWord:)]) {
        [_delegate didClickSearchKeyWord:btnTitle];
    }
}


@end
