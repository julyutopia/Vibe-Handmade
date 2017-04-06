//
//  DiscoverTopicSmallView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverTopicSmallView.h"

@implementation DiscoverTopicSmallView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     

        float width = frame.size.width;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        [_backView.layer setCornerRadius:4.0f];
        [_backView.layer setMasksToBounds:YES];
        [_backView setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_backView];
        
        
        UIView * blurCoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
        gradientViewLayer1.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.0);
        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
        gradientViewLayer1.colors = @[
                                      (id)RGBA(255, 255, 255, 0).CGColor,
                                      (id)RGBA(47, 185,  212, 60).CGColor,
                                      ];
        [blurCoverView.layer addSublayer:gradientViewLayer1];
        [_backView addSubview:blurCoverView];
        
        
        _timeStampLabel = [[UILabel alloc]init];
        [_timeStampLabel setTextAlignment:NSTextAlignmentLeft];
        [_timeStampLabel setTextColor:DefaultWhite];
        [_timeStampLabel setFont:[VibeFont fontWithName:Font_English_Regular size:12]];
        [_backView addSubview:_timeStampLabel];
        
        
        _topicTitleLabel = [[UILabel alloc]init];
        [_topicTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_topicTitleLabel setTextColor:DefaultWhite];
        [_topicTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]];
        [_topicTitleLabel setNumberOfLines:0];
        [_topicTitleLabel.layer setShadowColor:RGBA(60, 60, 60, 60).CGColor];
        [_topicTitleLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_topicTitleLabel.layer setShadowOpacity:1.0f];
        [_topicTitleLabel.layer setShadowRadius:4.0f];
        [_backView addSubview:_topicTitleLabel];

    }
    
    return self;
}


-(void)setTopicSmallViewWithModal:(DiscoverTopicModal *)modal
{
    float width = _backView.frame.size.width;
    
    [_backView sd_setImageWithURL:[NSURL URLWithString:modal.discoverTopicImgUrl] placeholderImage:nil];
    
    NSString * topicTitle = modal.discoverTopicTitle;
//    NSString * topicTimeStamp = modal.discoverTopicTimeStamp;
    
    [[VibeAppTool sharedInstance] setLabelSpace:_topicTitleLabel withText:topicTitle withFont:_topicTitleLabel.font withLineSpacing:2.0f];
    
    float topicTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:topicTitle withFont:_topicTitleLabel.font withWidth:width -16 withLineSpacing:2.0] +2.0;

    [_topicTitleLabel setFrame:CGRectMake(8, width -8 -topicTitleHeight, width -16, topicTitleHeight)];
    
}



@end





