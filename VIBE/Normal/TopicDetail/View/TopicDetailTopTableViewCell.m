//
//  TopicDetailTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TopicDetailTopTableViewCell.h"

@implementation TopicDetailTopTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        UIView                  * _backView;
//        
//        UIImageView             * _backBlurImgView;
//        UIImageView             * _photoImgView;
//        
//        UILabel                 * _topicTimeStampLabel;
//        UILabel                 * _topicTitleLabel;
        
        
        float photoWidth = kScreenWidth -60;
        _photoViewHeight = photoWidth;
        
        _backView = [[UIView alloc]init];
        [self.contentView addSubview:_backView];
        
        
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoWidth -12, _photoViewHeight -12)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 60).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_backBlurImgView];
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoWidth, _photoViewHeight)];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];

        //设置左边的圆角
        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_photoImgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
        maskLayer.frame = _photoImgView.bounds;
        maskLayer.path = maskPath.CGPath;
        _photoImgView.layer.mask = maskLayer;

        
        _topicTimeStampLabel = [[UILabel alloc]init];
        [_topicTimeStampLabel setTextAlignment:NSTextAlignmentLeft];
        [_topicTimeStampLabel setTextColor:DefaultWhite];
        [_topicTimeStampLabel setFont:[VibeFont fontWithName:Font_English_Bold size:13]];
        [_backView addSubview:_topicTimeStampLabel];
        
        
        _topicTitleLabel = [[UILabel alloc]init];
        [_topicTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_topicTitleLabel setTextColor:DefaultWhite];
        [_topicTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [_topicTitleLabel setNumberOfLines:0];
        [_backView addSubview:_topicTitleLabel];
        
    }
    
    return self;
}


-(void)setTopicDetailTopCellWithModal:(TopicDetailModal *)topicModal
{
    
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:topicModal.topicCoverImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [_backBlurImgView setImage:image];
        [_backBlurImgView setHidden:NO];
        
    }];
    
    
    NSString * timeStamp = topicModal.timeStampTitle;
    UIFont * timeStampFont = [VibeFont fontWithName:Font_English_Bold size:13];
    float timeStampHeight = [timeStamp getSizeWithLimitSize:CGSizeMake(200, 20) withFont:timeStampFont].height;
    
    
    NSString * title = topicModal.topicTitle;
    UIFont * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -25 -25, 100) withFont:titleFont].height;
    
    //超过一行显示
    if (titleHeight >30) {
        [[VibeAppTool sharedInstance] setLabelSpace:_topicTitleLabel withText:title withFont:_topicTitleLabel.font withLineSpacing:4.0f];
        titleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:title withFont:_topicTitleLabel.font withWidth:kScreenWidth -60 -25 -25 withLineSpacing:4.0] +2.0;
    }
    else{
        [_topicTitleLabel setText:title];
    }
    
    [_topicTitleLabel setFrame:CGRectMake(25, _photoViewHeight +5 -titleHeight, kScreenWidth -60 -25 -25, titleHeight)];
    
    [_topicTimeStampLabel setFrame:CGRectMake(25, _topicTitleLabel.origin.y -10 -timeStampHeight, kScreenWidth -60 -25 -25, timeStampHeight)];
    [_topicTimeStampLabel setText:timeStamp];

    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60, _photoViewHeight +5)];
}


@end


