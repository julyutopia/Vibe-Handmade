//
//  MineFavorProductsTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineFavorProductsTableViewCell.h"

#define  MoneyIconWidth   15

@implementation MineFavorProductsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
//        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

        _backView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, 100)];
        [_backView setBackgroundColor:RGBA(20, 20, 20, 40)];
//        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, 100)];
//        [_backView setAlpha:0.3];
        [_backView setUserInteractionEnabled:NO];
        [self addSubview:_backView];
        
        
        _maskLayer = [[CAShapeLayer alloc] init];
      
        
        _backImgView = [[GLImageView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -300, 100)];
        [_backImgView addTarget:self action:@selector(clickMineProduct) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backImgView];
        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        [_productImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_productImgView.layer setCornerRadius:1];
        [_productImgView.layer setMasksToBounds:YES];
        [_backImgView addSubview:_productImgView];
        
        _productTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_productTitleLabel setTextColor:[UIColor whiteColor]];
        [_productTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_productTitleLabel setNumberOfLines:2];
        [_productTitleLabel setFont:[VibeFont fontWithName:Default_Font size:14]];
        [_backImgView addSubview:_productTitleLabel];
        
        _productShopIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 52, 15, 15)];
        [_productShopIconImgView setImage:[UIImage imageNamed:@"Product_Shop"]];
        [_productShopIconImgView setAlpha:0.9f];
        [_backImgView addSubview:_productShopIconImgView];
        
        _productShopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100 +15 +1, 52, kScreenWidth -30 -160, 15)];
        [_productShopNameLabel setBackgroundColor:[UIColor clearColor]];
        [_productShopNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_productShopNameLabel setTextColor:RGBA(0, 189,  156, 90)];
        [_productShopNameLabel setFont:[UIFont fontWithName:Default_Font size:12]];
        [_backImgView addSubview:_productShopNameLabel];
        
        _productPriceMoneyIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100 -10 -MoneyIconWidth -1, MoneyIconWidth, MoneyIconWidth)];
        [_productPriceMoneyIconImgView setImage:[UIImage imageNamed:@"ProductCell_Price"]];
        [_backImgView addSubview:_productPriceMoneyIconImgView];
        
        _productPriceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productPriceLabel setBackgroundColor:[UIColor clearColor]];
        [_productPriceLabel setTextAlignment:NSTextAlignmentLeft];
        [_productPriceLabel setTextColor:DefaultGreen];
        [_productPriceLabel setFont:[VibeFont fontWithName:Default_Number_Font_Bold size:16]];
        [_backImgView addSubview:_productPriceLabel];
        
        
        //显示有多少人已喜欢的View
        _productFavorPeopleView = [[UIView alloc]initWithFrame:CGRectZero];
        [_productFavorPeopleView setBackgroundColor:[UIColor clearColor]];
        [_productFavorPeopleView.layer setBorderColor:DefaultGreen.CGColor];
        [_productFavorPeopleView.layer setBorderWidth:0.5f];
        [_productFavorPeopleView.layer setCornerRadius:4];
        [_backImgView addSubview:_productFavorPeopleView];
        
        
        _productFavorPeopleIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 14, 12)];
        [_productFavorPeopleIconImgView setImage:[UIImage imageNamed:@"ProductCell_PeopleFavored"]];
        [_productFavorPeopleView addSubview:_productFavorPeopleIconImgView];
        
        _productFavorPeopleCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productFavorPeopleCountLabel setBackgroundColor:[UIColor clearColor]];
        [_productFavorPeopleCountLabel setTextAlignment:NSTextAlignmentLeft];
        [_productFavorPeopleCountLabel setTextColor:DefaultGreen];
        [_productFavorPeopleCountLabel setFont:[UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:11]];
        [_productFavorPeopleView addSubview:_productFavorPeopleCountLabel];
        
        
        _productCellLine = [[UIView alloc]initWithFrame:CGRectMake(10, 100 -0.5, kScreenWidth -30 -20, 0.5)];
        [_productCellLine setBackgroundColor:DefaultQYTextColor20];
        [_productCellLine setAlpha:0.8f];
        [_backImgView addSubview:_productCellLine];
        
        float widthhh = 60;
        float heightt = 15;

        
        _bottomTitleBtn = [[UIButton alloc]initWithFrame:CGRectMake(  (kScreenWidth -widthhh)/2,100 +15, widthhh, heightt)];
        [_bottomTitleBtn setBackgroundImage:[UIImage imageNamed:@"Mine_Products_All"] forState:UIControlStateNormal];
        [_bottomTitleBtn addTarget:self action:@selector(showFavorAllProduct) forControlEvents:UIControlEventTouchUpInside];
        [_bottomTitleBtn setHidden:YES];
        [self addSubview:_bottomTitleBtn];

    }
    
    return self;
}


-(void)setMineFavorProductCellWithModal:(HomeProductModal *)modal Index:(NSInteger )index IsLastCell:(BOOL )isLast
{
    if (!_productModal) {
        
        _productModal = modal;
        
        _cellIndex = index;
        
        if (isLast) {
            [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, 100 +40)];
            [_backImgView setFrame:CGRectMake(15, 0, kScreenWidth -30, 100)];
            
            [_productCellLine setHidden:YES];
            [_bottomTitleBtn setHidden:NO];
            
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
            _maskLayer.frame = _backView.bounds;
            _maskLayer.path = maskPath.CGPath;
            _backView.layer.mask = _maskLayer;
        }
        
        else{
            [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, 100)];
            [_backImgView setFrame:_backView.frame];
            
            [_productCellLine setHidden:NO];
            [_bottomTitleBtn setHidden:YES];
        }
        
        
        [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];
        
        
        NSString * titleString = modal.productTitle;
        CGSize titleSize = [titleString getSizeWithLimitSize:CGSizeMake(kScreenWidth -30 -100 -10, 40) withFont:_productTitleLabel.font];
        [_productTitleLabel setFrame:CGRectMake(100, 10, kScreenWidth -30 -100 -10, titleSize.height)];
        [_productTitleLabel setText:titleString];
        
        [_productShopNameLabel setText:modal.productShopName];
        
        NSString * priceString = [NSString stringWithFormat:@"%@",modal.productPrice];
        CGSize priceSize = [priceString getSizeWithLimitSize:CGSizeMake(kScreenWidth -30 -180, 20) withFont:_productPriceLabel.font];
        [_productPriceLabel setFrame:CGRectMake(100 + MoneyIconWidth +1, 100 -10 -priceSize.height, priceSize.width, priceSize.height)];
        [_productPriceLabel setText:priceString];
        
        
        NSString * peopleCountString = [NSString stringWithFormat:@"%@",modal.productFavorCount];
        CGSize peopleCountSize = [peopleCountString getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_productFavorPeopleCountLabel.font];
        
        float peopleCountWidth = peopleCountSize.width;
        float peopleCountTotalWidth = peopleCountWidth +6 +14 +4 +6;
        [_productFavorPeopleView setFrame:CGRectMake(kScreenWidth -30 -10 -peopleCountTotalWidth, 100 -10 -20, peopleCountTotalWidth, 20)];
        [_productFavorPeopleCountLabel setFrame:CGRectMake(6 +14 +4, 0, peopleCountWidth, 20)];
        [_productFavorPeopleCountLabel setText:peopleCountString];
        
    }
}


-(void)clickMineProduct
{
    if ([_delegate respondsToSelector:@selector(clickMineProductWithIndex:)]) {
        [_delegate clickMineProductWithIndex:_cellIndex];
    }
}


-(void)showFavorAllProduct
{
    if ([_delegate respondsToSelector:@selector(clickMineProductShowAll)]) {
        [_delegate clickMineProductShowAll];
    }
}


@end
