//
//  RecommandPickTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandPickTableViewCell.h"

@implementation RecommandPickTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
//
//        
//        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
//        UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 20 +20, kScreenWidth, kScreenWidth -30)];
//        [backView setEffect:blurEffect];
//        [self.contentView addSubview:backView];
//        
//
//        _blurView = [[UIERealTimeBlurView alloc]initWithFrame:CGRectMake(0, 20 +20, kScreenWidth, kScreenWidth -30)];
//        [self.contentView addSubview:_blurView];
        
//        UIView * blurCoverView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenWidth -80, kScreenWidth -50, 30)];
//        [blurCoverView.layer setCornerRadius:8];
//        
//        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
//        gradientViewLayer1.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
//        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.0);
//        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
//        gradientViewLayer1.colors = @[
//                                (id)RGBA(255, 255, 255, 0).CGColor,
//                                (id)RGBA(255, 255, 255, 100).CGColor,
//                                ];
//        [blurCoverView.layer addSublayer:gradientViewLayer1];
//        
//        CAGradientLayer * gradientViewLayer2 = [CAGradientLayer layer];
//        gradientViewLayer2.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
//        gradientViewLayer2.startPoint = CGPointMake(0.5, 0.0);
//        gradientViewLayer2.endPoint = CGPointMake(0.5, 1.0);
//        gradientViewLayer2.colors = @[
//                                (id)RGBA(255, 255, 255, 100).CGColor,
//                                (id)RGBA(255, 255, 255, 0).CGColor,
//                                ];
//        [blurCoverView.layer addSublayer:gradientViewLayer2];
//        
//        [_backBlurImgView addSubview:blurCoverView];
        
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(25, 0, kScreenWidth -50,20 +20 + (kScreenWidth -50) +20)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_backView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Title_Color];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_titleLabel setText:@"为你而选"];
        [_backView addSubview:_titleLabel];
        
        
        //模糊背景图片
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 20 +20 +5, kScreenWidth -60, kScreenWidth -60)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(4, 4)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_backBlurImgView];

        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20 +20, kScreenWidth -50, kScreenWidth -50)];
        [_productImgView setBackgroundColor:[UIColor clearColor]];
        [_productImgView.layer setCornerRadius:8];
        [_productImgView.layer setMasksToBounds:YES];
        [_productImgView setContentMode:UIViewContentModeScaleToFill];
        [_backView addSubview:_productImgView];
        
        
        UIView * blurCoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -50, kScreenWidth -50)];
        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
        gradientViewLayer1.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.7);
        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
        gradientViewLayer1.colors = @[
                                      (id)RGBA(255, 255, 255, 0).CGColor,
                                      (id)RGBA(0, 0,  0, 40).CGColor,
                                      ];
        [blurCoverView.layer addSublayer:gradientViewLayer1];
        [_productImgView addSubview:blurCoverView];
        
        
        
        _productInfoTitleLabel = [[UILabel alloc]init];
        [_productInfoTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_productInfoTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_productInfoTitleLabel setTextColor:DefaultWhite];
        [_productInfoTitleLabel.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
        [_productInfoTitleLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_productInfoTitleLabel.layer setShadowOpacity:1.0f];
        [_productInfoTitleLabel.layer setShadowRadius:4.0f];
        [_backView addSubview:_productInfoTitleLabel];
        
        _productNameTitleLabel = [[UILabel alloc]init];
        [_productNameTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_productNameTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [_productNameTitleLabel setTextColor:DefaultWhite];
        [_productNameTitleLabel setNumberOfLines:0];
        [_productNameTitleLabel.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
        [_productNameTitleLabel.layer setShadowOffset:CGSizeMake(0, 1)];
        [_productNameTitleLabel.layer setShadowOpacity:1.0f];
        [_productNameTitleLabel.layer setShadowRadius:4.0f];
        [_backView addSubview:_productNameTitleLabel];
    }
    
    return self;
}


-(void)setRecommandPickItem:(RecommandItemModal *)modal
{
    float backViewHeight = 20 +20 + (kScreenWidth -50) +20;
    
    [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_backBlurImgView setHidden:NO];

    }];

    
    
    NSString * productInfoTitle = modal.productInfoTitle;
    NSString * productNameTitle = modal.productTitle;
    
    [[VibeAppTool sharedInstance] setLabelSpace:_productNameTitleLabel withText:productNameTitle withFont:_productNameTitleLabel.font withLineSpacing:4.0f];
    
    float nameTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:productNameTitle withFont:_productNameTitleLabel.font withWidth:kScreenWidth -100 withLineSpacing:4.0];
  
    
    [_productNameTitleLabel setFrame:CGRectMake(25, 20 +20 +(kScreenWidth -50) +10 -nameTitleHeight, kScreenWidth -100, nameTitleHeight)];
    
    [_productInfoTitleLabel setText:productInfoTitle];
    [_productInfoTitleLabel setFrame:CGRectMake(25, _productNameTitleLabel.frame.origin.y -25, 100, 15)];
}


@end



