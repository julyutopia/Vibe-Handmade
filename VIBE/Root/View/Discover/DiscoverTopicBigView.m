//
//  DiscoverTopicBigView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverTopicBigView.h"

@implementation DiscoverTopicBigView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _viewWidth = frame.size.width;
        _viewHeight = frame.size.height;
        float imgViewHeight = _viewWidth/16 *9;
    
        
        _blurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _viewWidth -12, imgViewHeight -12)];
        [_blurImgView setHidden:YES];
        [_blurImgView setBackgroundColor:[UIColor whiteColor]];
        [_blurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_blurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_blurImgView.layer setShadowOpacity:1.0f];
        [_blurImgView.layer setShadowRadius:8.0f];
        [self addSubview:_blurImgView];

        _backImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, imgViewHeight)];
        [_backImgView.layer setCornerRadius:4.0f];
        [_backImgView.layer setMasksToBounds:YES];
        [_backImgView setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_backImgView];
        
        
        UIView * blurCoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, imgViewHeight)];
        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
        gradientViewLayer1.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.5);
        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
        gradientViewLayer1.colors = @[
                                      (id)RGBA(255, 255, 255, 0).CGColor,
                                      (id)RGBA(0, 0,  0, 50).CGColor,
                                      ];
        [blurCoverView.layer addSublayer:gradientViewLayer1];
        [_backImgView addSubview:blurCoverView];

        
        _timeStampLabel = [[UILabel alloc]init];
        [_timeStampLabel setTextAlignment:NSTextAlignmentLeft];
        [_timeStampLabel setTextColor:DefaultWhite];
        [_timeStampLabel setFont:[VibeFont fontWithName:Font_English_Bold size:13]];
        [_timeStampLabel.layer setShadowColor:RGBA(0, 0, 0, 30).CGColor];
        [_timeStampLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_timeStampLabel.layer setShadowOpacity:1.0f];
        [_timeStampLabel.layer setShadowRadius:1.0f];
        [self addSubview:_timeStampLabel];
        
        
        _topicTitleLabel = [[UILabel alloc]init];
        [_topicTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_topicTitleLabel setTextColor:DefaultWhite];
        [_topicTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [_topicTitleLabel setNumberOfLines:0];
        [_topicTitleLabel.layer setShadowColor:RGBA(0, 0, 0, 20).CGColor];
        [_topicTitleLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_topicTitleLabel.layer setShadowOpacity:1.0f];
        [_topicTitleLabel.layer setShadowRadius:1.0f];
        [self addSubview:_topicTitleLabel];

    }
    
    return self;
}


-(void)setTopicBigViewWithModal:(DiscoverTopicModal *)modal
{
    
    [_backImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverTopicImgUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_blurImgView setImage:image];
        [_blurImgView setHidden:NO];
        
    }];
    
    NSString * topicTitle = modal.discoverTopicTitle;
    NSString * topicTimeStamp = modal.discoverTopicTimeStamp;
    
    float width = _backImgView.frame.size.width;
    float imgViewHeight = _viewWidth/16 *9;

    
    [[VibeAppTool sharedInstance] setLabelSpace:_topicTitleLabel withText:topicTitle withFont:_topicTitleLabel.font withLineSpacing:4.0f];
    
    float nameTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:topicTitle withFont:_topicTitleLabel.font withWidth:width -50 withLineSpacing:4.0];
    
    [_topicTitleLabel setFrame:CGRectMake(25, imgViewHeight +5 -nameTitleHeight, kScreenWidth -100, nameTitleHeight)];

    [_timeStampLabel setText:topicTimeStamp];
    [_timeStampLabel setFrame:CGRectMake(25, _topicTitleLabel.frame.origin.y -25, 100, 15)];
}




@end



