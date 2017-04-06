//
//  DiscoverAlbumTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverAlbumTableViewCell.h"

@implementation DiscoverAlbumTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _width = kScreenWidth -20;
        _height = (kScreenWidth -20 -20)/16*9;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, _width, _height +10)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
                
        _albumImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -40, _height)];
        [_albumImgView setBackgroundColor:[UIColor redColor]];
        [_albumImgView.layer setMasksToBounds:YES];
        [_albumImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_albumImgView];
        
        _maskImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _height -(kScreenWidth -40)/2, kScreenWidth -40, (kScreenWidth -40)/2)];
        [_maskImgView setAlpha:0.8f];
        UIImage * imageeee = [UIImage imageNamed:@"Gradien_Shadow"];
        [_maskImgView setImage:imageeee];
        [_albumImgView addSubview:_maskImgView];

        
        
        _albumTitleLabel = [[UILabel alloc]init];
        [_albumTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_albumTitleLabel setTextColor:[UIColor whiteColor]];
        [_albumTitleLabel setFont:[VibeFont fontWithName:Default_Font_Bold size:16]];
        [_albumTitleLabel setNumberOfLines:0];
        _albumTitleLabel.layer.shadowColor = RGBA(70, 70, 70, 70).CGColor;
        _albumTitleLabel.layer.shadowOffset = CGSizeMake(0,3);
        _albumTitleLabel.layer.shadowOpacity = 0.4;
        _albumTitleLabel.layer.shadowRadius = 3;
        [_albumImgView addSubview:_albumTitleLabel];

        NSString * testString = @"测试";
        _singleLineHeight = [testString getSizeWithLimitSize:CGSizeMake(kScreenWidth -60, 20) withFont:_albumTitleLabel.font].height;
        
        //显示标签的视图
        _gradientTagView = [[GradientTagCloudView alloc]init];
        [_albumImgView addSubview:_gradientTagView];
    
    
        //显示阅读数&喜爱数
        _showInfoView = [[UIView alloc]initWithFrame:CGRectMake(_width -20 -120, _height - 6 -18,120, 18)];
        [_showInfoView setBackgroundColor:[UIColor clearColor]];
        [_backView addSubview:_showInfoView];
        
        _lookIcon = [[UIImageView alloc]init];
        [_lookIcon setImage:[UIImage imageNamed:@"Topic_Look_Icon"]];
        [_showInfoView addSubview:_lookIcon];
        _lookLabel = [[UILabel alloc]init];
        [_lookLabel setTextAlignment:NSTextAlignmentLeft];
        [_lookLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_lookLabel setFont:[UIFont fontWithName:Default_Number_Font size:13]];
        _lookLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _lookLabel.layer.shadowOffset = CGSizeMake(0,2);
        _lookLabel.layer.shadowOpacity = 0.3;
        _lookLabel.layer.shadowRadius = 2;
        [_showInfoView addSubview:_lookLabel];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Topic_Favor_Icon"]];
        [_showInfoView addSubview:_favorIcon];
        _favorLabel = [[UILabel alloc]init];
        [_favorLabel setTextAlignment:NSTextAlignmentLeft];
        [_favorLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_favorLabel setFont:[UIFont fontWithName:Default_Number_Font size:13]];
        _favorLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _favorLabel.layer.shadowOffset = CGSizeMake(0,2);
        _favorLabel.layer.shadowOpacity = 0.3;
        _favorLabel.layer.shadowRadius = 2;
        [_showInfoView addSubview:_favorLabel];
        
    }
   
    
    return self;
}


-(void)setDiscoverAlbumWithModal:(DiscoverTopicModal *)modal IsLast:(BOOL )last
{
//    if (last && !_maskLayer) {
//        
//        _maskLayer =[[CAShapeLayer alloc] init];
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
//        _maskLayer.frame = _backView.bounds;
//        _maskLayer.path = maskPath.CGPath;
//        _backView.layer.mask = _maskLayer;
//    }
//    
////    [_albumImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverTopicImgURL] placeholderImage:nil];
//
//
//    NSString * albumTitle = modal.discoverTopicTitle;
//    float titleSizeHeight = [albumTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -60, 60) withFont:_albumTitleLabel.font].height;
//    if (titleSizeHeight > _singleLineHeight +1) {
//        titleSizeHeight = _singleLineHeight *2 +1;
//    }
//    [_albumTitleLabel setText:albumTitle];
//    [_albumTitleLabel setFrame:CGRectMake(10, _height -25 -titleSizeHeight, kScreenWidth -60, titleSizeHeight)];
//    
//    
//    NSString * lookCount = [NSString stringWithFormat:@"%@",modal.discoverTopicLookedNumber];
//    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.discoverTopicFavorNumber];
//    
//    float lookCountWidth = [lookCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorLabel.font].width;
//    float favorCountWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorLabel.font].width;
//    
//    
//   
//    float totalWidth = favorCountWidth +lookCountWidth +14 +14 +4 +8 +4;
//    [_showInfoView setFrame:CGRectMake(_width -20 -totalWidth, _height - 6 -18, totalWidth, 18)];
//    
//    [_favorLabel setFrame:CGRectMake(totalWidth -favorCountWidth, 0, favorCountWidth, 18)];
//    [_favorLabel setText:favorCount];
//    [_favorIcon setFrame:CGRectMake(totalWidth -favorCountWidth -4 -14, 2, 14, 14)];
//    
//    [_lookLabel setFrame:CGRectMake(totalWidth -favorCountWidth -4 -14 - 8 -lookCountWidth, 0, lookCountWidth, 18)];
//    [_lookLabel setText:lookCount];
//    [_lookIcon setFrame:CGRectMake(totalWidth -favorCountWidth -4 -14 - 8 -lookCountWidth -4 -14, 2, 14, 14)];
//    
//    [_gradientTagView setFrame:CGRectMake(10, _height -4 -20, _width -40 - totalWidth -10 -10, 20)];
//    
//    [_gradientTagView setGradientTagCloudWithMaxWidth:_width -40 - totalWidth -10 -10 MaxHeight:20 WithFont:[UIFont fontWithName:Default_Font_Middle size:11] AndTags:modal.discoverTopicTagArray];
    
}





@end
