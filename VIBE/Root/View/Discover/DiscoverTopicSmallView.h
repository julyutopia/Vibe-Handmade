//
//  DiscoverTopicSmallView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GLImageView.h"
#import "DiscoverTopicModal.h"

@interface DiscoverTopicSmallView : UIView
{
    GLImageView * _backView;
    UILabel     * _timeStampLabel;
    UILabel     * _topicTitleLabel;
}

-(void)setTopicSmallViewWithModal:(DiscoverTopicModal *)modal;

@end
