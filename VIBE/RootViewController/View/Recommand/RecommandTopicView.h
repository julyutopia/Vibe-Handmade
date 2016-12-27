//
//  RecommandTopicView.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeTopicModal.h"
#import "GradientTagCloudView.h"

@interface RecommandTopicView : UIView
{
    float               _topicViewWidth;
    float               _topicViewHeight;
    
    UIView              * _backView;
    UIImageView         * _backImgView;
    UIVisualEffectView  * _backBlurView;
    
    UIImageView         * _topicImgView;
    
    UIView              * _rightSideView;
    
    UILabel             * _topicTitleLabel;
    float                 _singleTitleLineHeight;
    
    GradientTagCloudView* _gradientTagView;
    
    UIView              * _showInfoView;
    UIImageView         * _lookIcon;
    UILabel             * _lookLabel;
    UIImageView         * _favorIcon;
    UILabel             * _favorLabel;
}

-(void)setTopicViewWithTopic:(VibeTopicModal *)modal;

@end
