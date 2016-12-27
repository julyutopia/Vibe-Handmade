//
//  TopicDetailRelatedProductTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2016/12/21.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "TopicDetailRelatedProductTableViewCell.h"

@implementation TopicDetailRelatedProductTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageViewHeight = 60;
        _imageViewWidth = _imageViewHeight/9 *16;
     
        _contentBackView = [[UIView alloc]initWithFrame:CGRectMake(5, 0, kScreenWidth -10, _imageViewHeight +20)];
        [_contentBackView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_contentBackView];
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, _imageViewHeight +20)];
        [_backView setBackgroundColor:RGBA(245, 245, 245, 90)];
        [self addSubview:_backView];
        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _imageViewWidth, _imageViewHeight)];
        [_productImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_productImgView.layer setMasksToBounds:YES];
        [_backView addSubview:_productImgView];
        
        _rightViewWidth = kScreenWidth -30 -10 - _imageViewWidth -10 -10;
        
        _productTitleLabel = [[UILabel alloc]init];
        [_productTitleLabel setTextColor:DefaultQYTextColor60];
        [_productTitleLabel setFont:[VibeFont fontWithName:Default_Font size:13]];
        [_productTitleLabel setNumberOfLines:0];
        [_backView addSubview:_productTitleLabel];
        
        _showMoneyView = [[VibeShowMoneyView alloc]init];
        _showMoneyView.isShowMoneyMiddle = YES;
        [_backView addSubview:_showMoneyView];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Product_Favor_Icon"]];
        [_backView addSubview:_favorIcon];
        
        _favorCountLabel = [[UILabel alloc]init];
        [_favorCountLabel setTextAlignment:NSTextAlignmentRight];
        [_favorCountLabel setTextColor:RGBA(155, 155, 155, 40)];
        [_favorCountLabel setFont:[UIFont fontWithName:Default_Number_Font size:12]];
        [_backView addSubview:_favorCountLabel];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 +_imageViewHeight -0.5, kScreenWidth -30 -20, 0.5)];
        [_lineView setBackgroundColor:RGBA(220, 220, 220, 50)];
        [_backView addSubview:_lineView];
    }
    
    return self;
}


-(void)setGuessProductWithModal:(VibeProductModal *)modal IsLast:(BOOL )last
{
    [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];
    
    NSString * title = modal.productTitle;
    
    CGSize titleSize = [title getSizeWithLimitSize:CGSizeMake(_rightViewWidth, _imageViewHeight -12) withFont:_productTitleLabel.font];
    
    [_productTitleLabel setFrame:CGRectMake(10 +_imageViewWidth +10, 10, _rightViewWidth, titleSize.height)];
    [_productTitleLabel setText:title];
    
    CGSize showMoneySize = [_showMoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:Default_Money_Font size:12] GapWidth:1 PriceFont:[VibeFont fontWithName:Default_Price_Font size:14] Price:modal.productPrice TextColor:RGB(43, 214, 206)];
    [_showMoneyView setFrame:CGRectMake(10 +_imageViewWidth +10, 10 +_imageViewHeight -showMoneySize.height, showMoneySize.width, showMoneySize.height)];
    
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.productFavorCount];
    float favorWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorCountLabel.font].width;
    
    [_favorCountLabel setFrame:CGRectMake(kScreenWidth -30 -10 -favorWidth, 10 +_imageViewHeight -15, favorWidth, 15)];
    [_favorCountLabel setText:favorCount];
    
    [_favorIcon setFrame:CGRectMake(kScreenWidth -30 -10 -favorWidth -14, 10 +_imageViewHeight - 12.5, 12, 12)];
    
    if (last == YES) {
        
        if (!_maskLayer) {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
            _maskLayer = [[CAShapeLayer alloc] init];
            _maskLayer.frame = _backView.bounds;
            _maskLayer.path = maskPath.CGPath;
            _backView.layer.mask = _maskLayer;
        }
        [_contentBackView setFrame:CGRectMake(5, 0, kScreenWidth -10, _imageViewHeight +20 +10)];
//        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, _imageViewHeight +20)];
        [_lineView setHidden:YES];
    }
    else{
        [_lineView setHidden:NO];
    }
}


@end
