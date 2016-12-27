//
//  HomeProductTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeProductTableViewCell.h"

#define  MoneyIconWidth   15


@implementation HomeProductTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _backView = [[UIERealTimeBlurView alloc]initWithFrame:CGRectZero];
        [_backView setBackgroundColor:RGBA(0, 0, 0, 20)];
        [self addSubview:_backView];
        
        
        _productBackImgView = [[GLImageView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, 100)];
        [_productBackImgView setContentMode:UIViewContentModeScaleToFill];
        [_productBackImgView setUserInteractionEnabled:YES];
        [_productBackImgView addTarget:self action:@selector(didTapToShowDetail) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_productBackImgView];
        
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _productBlurView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_productBlurView setFrame:CGRectMake(0, 0, kScreenWidth -30, 100)];
        [_productBlurView setUserInteractionEnabled:NO];
        [_productBackImgView addSubview:_productBlurView];

        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        [_productImgView setContentMode:UIViewContentModeScaleAspectFit];
        [_productImgView.layer setCornerRadius:2];
        [_productImgView.layer setMasksToBounds:YES];
        [_productBackImgView addSubview:_productImgView];
        
        _productFavorBtn = [[UIButton alloc]initWithFrame:CGRectMake(10 +50, 10, 30, 30)];
        [_productFavorBtn addTarget:self action:@selector(didTapFavorBtn) forControlEvents:UIControlEventTouchUpInside];
        [_productBackImgView addSubview:_productFavorBtn];
        
        
        _productTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_productTitleLabel setTextColor:[UIColor whiteColor]];
        [_productTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_productTitleLabel setNumberOfLines:2];
        [_productTitleLabel setFont:[VibeFont fontWithName:Default_Font size:14]];
        [_productBackImgView addSubview:_productTitleLabel];
        
        _productShopIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 52, 15, 15)];
        [_productShopIconImgView setImage:[UIImage imageNamed:@"Product_Shop"]];
        [_productBackImgView addSubview:_productShopIconImgView];
        
        _productShopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100 +15 +1, 52, kScreenWidth -30 -160, 15)];
        [_productShopNameLabel setBackgroundColor:[UIColor clearColor]];
        [_productShopNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_productShopNameLabel setTextColor:RGBA(222, 222, 222, 60)];
        [_productShopNameLabel setFont:[UIFont fontWithName:Default_Font size:12]];
        [_productBackImgView addSubview:_productShopNameLabel];
        
        
        _productPriceMoneyIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100 -10 -MoneyIconWidth -1, MoneyIconWidth, MoneyIconWidth)];
        [_productPriceMoneyIconImgView setImage:[UIImage imageNamed:@"ProductCell_Price"]];
        [_productBackImgView addSubview:_productPriceMoneyIconImgView];

        
        _productPriceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productPriceLabel setBackgroundColor:[UIColor clearColor]];
        [_productPriceLabel setTextAlignment:NSTextAlignmentLeft];
        [_productPriceLabel setTextColor:DefaultGreen];
        [_productPriceLabel setFont:[VibeFont fontWithName:Default_Number_Font_Bold size:16]];
        [_productBackImgView addSubview:_productPriceLabel];
        
        
        //显示有多少人已喜欢的View
        _productFavorPeopleView = [[UIView alloc]initWithFrame:CGRectZero];
        [_productFavorPeopleView setHidden:YES];
        [_productFavorPeopleView setBackgroundColor:[UIColor clearColor]];
        [_productFavorPeopleView.layer setBorderColor:DefaultGreen.CGColor];
        [_productFavorPeopleView.layer setBorderWidth:0.5f];
        [_productFavorPeopleView.layer setCornerRadius:4];
        [_productBackImgView addSubview:_productFavorPeopleView];
        
        _productFavorPeopleIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 14, 12)];
        [_productFavorPeopleIconImgView setImage:[UIImage imageNamed:@"ProductCell_PeopleFavored"]];
        [_productFavorPeopleView addSubview:_productFavorPeopleIconImgView];
        
        _productFavorPeopleCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_productFavorPeopleCountLabel setBackgroundColor:[UIColor clearColor]];
        [_productFavorPeopleCountLabel setTextAlignment:NSTextAlignmentLeft];
        [_productFavorPeopleCountLabel setTextColor:DefaultGreen];
        [_productFavorPeopleCountLabel setFont:[UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:11]];
        [_productFavorPeopleView addSubview:_productFavorPeopleCountLabel];
        
        
        //没有人已喜欢，显示新品
        NSString * newArrivalString = @"新品";
        UIFont  *newArrivalFont = [VibeFont fontWithName:Default_Font_Bold size:15];
        CGSize newArrivalSize = [newArrivalString getSizeWithLimitSize:CGSizeMake(100, 20) withFont:newArrivalFont];
        
        _productNewArrivalLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth -30 -10 -newArrivalSize.width, 100 -10 -newArrivalSize.height, newArrivalSize.width, newArrivalSize.height)];
        [_productNewArrivalLabel setHidden:YES];
        [_productNewArrivalLabel setBackgroundColor:[UIColor clearColor]];
        [_productNewArrivalLabel setTextAlignment:NSTextAlignmentLeft];
        [_productNewArrivalLabel setText:newArrivalString];
        [_productNewArrivalLabel setTextColor:DefaultGreen];
        [_productNewArrivalLabel setFont:newArrivalFont];
        [_productBackImgView addSubview:_productNewArrivalLabel];
        
        
        _productCellLine = [[UIView alloc]initWithFrame:CGRectMake(15, 100 -0.5, kScreenWidth -30, 0.5)];
        [_productCellLine setBackgroundColor:DefaultQYTextColor30];
        [_backView addSubview:_productCellLine];
        
    }
    
    return self;
}


-(void)setProductCellWithModal:(HomeProductModal *)modal WithIndex:(NSInteger)index IsLast:(BOOL)isLast
{
    _cellIndex = index;
    
    if (isLast) {
        [_backView setFrame:CGRectMake(0, 0, kScreenWidth, 100 +TabBarHeight)];
        [_productCellLine setHidden:YES];
    }
    else{
        [_backView setFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        [_productCellLine setHidden:NO];
    }

    [_productBackImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];
    [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];
    
    if ([modal.productIsUserFavored boolValue] ==YES) {
        [_productFavorBtn setBackgroundImage:[UIImage imageNamed:@"ProductCell_Favored"] forState:UIControlStateNormal];
        [_productFavorBtn setBackgroundImage:[UIImage imageNamed:@"ProductCell_Favored_Pressed"] forState:UIControlStateHighlighted];
    }
    else{
        [_productFavorBtn setBackgroundImage:[UIImage imageNamed:@"ProductCell_AddFavor"] forState:UIControlStateNormal];
        [_productFavorBtn setBackgroundImage:[UIImage imageNamed:@"ProductCell_AddFavor_Pressed"] forState:UIControlStateHighlighted];
    }
    
    NSString * titleString = modal.productTitle;
    CGSize titleSize = [titleString getSizeWithLimitSize:CGSizeMake(kScreenWidth -30 -100 -10, 40) withFont:_productTitleLabel.font];
    [_productTitleLabel setFrame:CGRectMake(100, 10, kScreenWidth -30 -100 -10, titleSize.height)];
    [_productTitleLabel setText:titleString];
    
    [_productShopNameLabel setText:modal.productShopName];
    
    
    NSString * priceString = [NSString stringWithFormat:@"%@",modal.productPrice];
    CGSize priceSize = [priceString getSizeWithLimitSize:CGSizeMake(kScreenWidth -30 -180, 20) withFont:_productPriceLabel.font];
    [_productPriceLabel setFrame:CGRectMake(100 + MoneyIconWidth +1, 100 -10 -priceSize.height, priceSize.width, priceSize.height)];
    [_productPriceLabel setText:priceString];

    
    //已有人收藏
    if ([modal.productFavorCount integerValue] >0) {
        
        [_productNewArrivalLabel setHidden:YES];
        [_productFavorPeopleView setHidden:NO];
        
        NSString * peopleCountString = [NSString stringWithFormat:@"%@",modal.productFavorCount];
        CGSize peopleCountSize = [peopleCountString getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_productFavorPeopleCountLabel.font];
        
        float peopleCountWidth = peopleCountSize.width;
        float peopleCountTotalWidth = peopleCountWidth +4 +14 +4 +4;
        [_productFavorPeopleView setFrame:CGRectMake(kScreenWidth -30 -10 -peopleCountTotalWidth, 100 -10 -20, peopleCountTotalWidth, 20)];
        [_productFavorPeopleCountLabel setFrame:CGRectMake(4 +14 +4, 0, peopleCountWidth, 20)];
        [_productFavorPeopleCountLabel setText:peopleCountString];
    }
    else{
        [_productNewArrivalLabel setHidden:NO];
        [_productFavorPeopleView setHidden:YES];
    }
    
   
    
}


//点击收藏，取消收藏
-(void)didTapFavorBtn
{

}

//点击进入详情
-(void)didTapToShowDetail
{
    if ([_delegate respondsToSelector:@selector(homeProductCellTapWithIndex:)]) {
        [_delegate homeProductCellTapWithIndex:_cellIndex];
    }
}


@end















