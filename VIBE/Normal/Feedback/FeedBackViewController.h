//
//  FeedBackViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/3/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"
#import "PlaceholderTextView.h"

#import "VibeAppTool.h"

@interface FeedBackViewController : VibeViewController<UITextViewDelegate>
{
    UIView                  * _feedbackView;
    PlaceholderTextView     * _feedbackTextView;
    
    UIButton                * _sendBtn;
}

@end
