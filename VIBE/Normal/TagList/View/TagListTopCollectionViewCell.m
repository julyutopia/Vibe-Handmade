//
//  TagListTopCollectionViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TagListTopCollectionViewCell.h"

@implementation TagListTopCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        float photoViewWidth = kScreenWidth -60 -20;
        float photoViewHeight = photoViewWidth/16 *9;
        
        NSString    * title = @"标题";
        UIFont      * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
        
        float titleHeight = [title getSizeWithLimitSize:CGSizeMake(100, 30) withFont:titleFont].height;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60, photoViewHeight +5)];
        [_backView setBackgroundColor:[UIColor blueColor]];
        
        
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoViewWidth -12, photoViewHeight -12)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [self addSubview:_backBlurImgView];
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoViewWidth, photoViewHeight)];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_photoImgView];
        
        
//        //设置左边的圆角
//        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_photoImgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
//        maskLayer.frame = _photoImgView.bounds;
//        maskLayer.path = maskPath.CGPath;
//        _photoImgView.layer.mask = maskLayer;
        
        
        UIView * blurCoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, photoViewWidth, photoViewHeight)];
        CAGradientLayer * gradientViewLayer1 = [CAGradientLayer layer];
        gradientViewLayer1.frame = CGRectMake(0, 0, blurCoverView.frame.size.width, blurCoverView.frame.size.height);
        gradientViewLayer1.startPoint = CGPointMake(0.5, 0.5);
        gradientViewLayer1.endPoint = CGPointMake(0.5, 1.0);
        gradientViewLayer1.colors = @[
                                      (id)RGBA(255, 255, 255, 0).CGColor,
                                      (id)RGBA(0, 0,  0, 50).CGColor,
                                      ];
        [blurCoverView.layer addSublayer:gradientViewLayer1];
        [_photoImgView addSubview:blurCoverView];
        
        
        _itemTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, photoViewHeight +5 -titleHeight,  kScreenWidth -60 -20 -30, titleHeight)];
        [_itemTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemTitleLabel setTextColor:DefaultWhite];
        [_itemTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [self addSubview:_itemTitleLabel];
        
        
        NSString    * subTitle = @"件商品";
        UIFont      * subtitleFont = [VibeFont fontWithName:Font_Chinese_Regular size:12];
        
        float subtitleHeight = [subTitle getSizeWithLimitSize:CGSizeMake(100, 30) withFont:subtitleFont].height;
        
        _itemsCountLabel = [[TTTAttributedLabel alloc]initWithFrame:CGRectMake(15, _itemTitleLabel.frame.origin.y -15 -subtitleHeight,  kScreenWidth -60 -20 -30, titleHeight)];
        [_itemsCountLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemsCountLabel setTextColor:DefaultWhite];
        [_itemsCountLabel setFont:subtitleFont];
        [self addSubview:_itemsCountLabel];
        
    }
    
    return self;
}


-(void)tagListTopCellSetWithInfo:(DiscoverTagModal *)tagModal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:tagModal.tagCoverImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [_backBlurImgView setImage:image];
        [_backBlurImgView setHidden:NO];
        
    }];
    
    [_itemTitleLabel setText:tagModal.tagTitle];

    NSString * itemsCount = [tagModal.tagItemsCount stringValue];
    NSString * itemsCountString = [NSString stringWithFormat:@"%@ 件单品",itemsCount];

    [_itemsCountLabel setText:itemsCountString afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSRange range = [itemsCountString rangeOfString:itemsCount options:NSCaseInsensitiveSearch];
        if (range.location == NSNotFound) {
            range = NSMakeRange(0, 0);
        }
        
        [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:[VibeFont fontWithName:Font_English_Medium size:12] range:range];
        
        return mutableAttributedString;
    
    }];
    
}

@end



