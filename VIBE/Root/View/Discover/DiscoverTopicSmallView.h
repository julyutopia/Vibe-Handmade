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

@protocol DiscoverTopicSmallViewDelegate;

@interface DiscoverTopicSmallView : UIView
{
    NSInteger     _smallViewIndex;
    
    GLImageView * _backView;
    UILabel     * _timeStampLabel;
    UILabel     * _topicTitleLabel;
}

@property (weak, nonatomic) id<DiscoverTopicSmallViewDelegate> delegate;

-(void)setTopicSmallViewWithModal:(DiscoverTopicModal *)modal WithIndex:(NSInteger )index;

@end

//代理协议
@protocol DiscoverTopicSmallViewDelegate <NSObject>

-(void)discoverTopicSmallViewClickWithIndex:(NSInteger )index;

@end
