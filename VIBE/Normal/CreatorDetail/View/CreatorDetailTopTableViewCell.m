//
//  CreatorDetailTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDetailTopTableViewCell.h"

@implementation CreatorDetailTopTableViewCell



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
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
     
        
        _shopNameLabel = [[UILabel alloc]init];
        [_shopNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_shopNameLabel setTextColor:Default_Text_Dark_Color];
        [_shopNameLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [_backView addSubview:_shopNameLabel];
        
        
        _sloganLabel = [[UILabel alloc]init];
        [_sloganLabel setTextAlignment:NSTextAlignmentLeft];
        [_sloganLabel setTextColor:Default_Text_Gray_Color];
        [_sloganLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_sloganLabel setNumberOfLines:0];
        [_backView addSubview:_sloganLabel];

    }
    
    return self;
}


-(void)setCreatorDetailTopCellWithModal:(CreatorDetailModal *)creatorModal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:creatorModal.creatorCoverImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [_backBlurImgView setImage:image];
        [_backBlurImgView setHidden:NO];
        
    }];
    
    NSString * shopName = creatorModal.creatorName;
    UIFont * shopNameFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
    float shopNameHeight = [shopName getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 40) withFont:shopNameFont].height;
    
    NSString * slogan = creatorModal.creatorSlogan;
    UIFont * sloganFont = [VibeFont fontWithName:Font_Chinese_Regular size:13];
    float sloganHeight = [slogan getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 200) withFont:sloganFont].height +1.0f;
    
    [_shopNameLabel setFrame:CGRectMake(0, _photoViewHeight +20, kScreenWidth -60 -20, shopNameHeight)];
    [_shopNameLabel setText:shopName];
    
    //超过一行显示
    if (sloganHeight >20) {
        [[VibeAppTool sharedInstance] setLabelSpace:_sloganLabel withText:slogan withFont:sloganFont withLineSpacing:4.0f];
        
        sloganHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:slogan withFont:sloganFont withWidth:kScreenWidth -60 -20 withLineSpacing:4.0] +2.0;
    }
    else{
        [_sloganLabel setText:slogan];
    }
    
    [_sloganLabel setFrame:CGRectMake(0, _photoViewHeight +20 +shopNameHeight +10, kScreenWidth -60 -20, sloganHeight)];

    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60, _photoViewHeight +20 +shopNameHeight +10 +sloganHeight)];
}



@end

