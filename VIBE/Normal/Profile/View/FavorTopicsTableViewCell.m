//
//  FavorTopicsTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FavorTopicsTableViewCell.h"

@implementation FavorTopicsTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        float photoWidth = kScreenWidth -60 -20;
        float photoHeight = photoWidth/16 *9;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(60, 0, photoWidth, photoHeight +10)];
        [self.contentView addSubview:_backView];
        
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoWidth -12, photoHeight -12)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_backBlurImgView];
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoWidth, photoHeight)];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];
        
        
        _gradientView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, photoWidth, photoHeight)];
        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
        gradientViewLayer1.frame = CGRectMake(0, 0, _gradientView.frame.size.width, _gradientView.frame.size.height);
        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.5);
        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
        gradientViewLayer1.colors = @[
                                      (id)RGBA(255, 255, 255, 0).CGColor,
                                      (id)RGBA(0, 0,  0, 70).CGColor,
                                      ];
        [_gradientView.layer addSublayer:gradientViewLayer1];
        [_photoImgView addSubview:_gradientView];
        
        
        _topicTitleLabel = [[UILabel alloc]init];
        [_topicTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_topicTitleLabel setTextColor:DefaultWhite];
        [_topicTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:18]];
        [_topicTitleLabel setNumberOfLines:0];
        [_topicTitleLabel.layer setShadowColor:RGBA(0, 0, 0, 20).CGColor];
        [_topicTitleLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_topicTitleLabel.layer setShadowOpacity:1.0f];
        [_topicTitleLabel.layer setShadowRadius:1.0f];
        [_backView addSubview:_topicTitleLabel];

    }
    
    return self;
}


-(void)setFavorTopicTableCellWithModal:(DiscoverTopicModal *)modal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverTopicImgUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [_backBlurImgView setImage:image];
        [_backBlurImgView setHidden:NO];
    }];
    
    NSString * topicTitle = modal.discoverTopicTitle;
    
    float titleWidth = _photoImgView.frame.size.width -20;
    
    float titleHeight = [topicTitle getSizeWithLimitSize:CGSizeMake(titleWidth, 50) withFont:_topicTitleLabel.font].height;
    
    //超过一行
    if (titleHeight > 25) {
        [[VibeAppTool sharedInstance] setLabelSpace:_topicTitleLabel withText:topicTitle withFont:_topicTitleLabel.font withLineSpacing:4.0f];
        titleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:topicTitle withFont:_topicTitleLabel.font withWidth:titleWidth withLineSpacing:4.0];
    }
    else{
        [_topicTitleLabel setText:topicTitle];
    }
    
    [_topicTitleLabel setFrame:CGRectMake(10, _photoImgView.frame.size.height -10 -titleHeight, titleWidth, titleHeight)];
    
}





@end
