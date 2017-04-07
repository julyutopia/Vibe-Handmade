//
//  DiscoverTopicBigView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicModal.h"

@interface DiscoverTopicBigView : UIView
{
    float          _viewWidth;
    float          _viewHeight;
    
    UIImageView * _blurImgView;
    GLImageView * _backImgView;
    UILabel     * _timeStampLabel;
    UILabel     * _topicTitleLabel;
}

-(void)setTopicBigViewWithModal:(DiscoverTopicModal *)modal;


@end
