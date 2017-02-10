//
//  MineFavorProductTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/2/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "MineFavorProductTableViewCell.h"

@implementation MineFavorProductTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageViewHeight = 70;
        _imageViewWidth = _imageViewHeight/9*16;
        
        _productBackView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -40, _imageViewHeight +20)];
        [_productBackView setBackgroundColor:RGBA(253, 253, 253, 90)];
        [_productBackView addTarget:self action:@selector(didTapBackView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_productBackView];
        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _imageViewWidth, _imageViewHeight)];
        [_productImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_productImgView.layer setMasksToBounds:YES];
        [_productBackView addSubview:_productImgView];
        
        _productTitleLabel = [[UILabel alloc]init];
        [_productTitleLabel setTextColor:DefaultQYTextColor60];
        [_productTitleLabel setFont:[VibeFont fontWithName:Default_Font size:13]];
        [_productTitleLabel setNumberOfLines:0];
        [_productBackView addSubview:_productTitleLabel];

        _showMoneyView = [[VibeShowMoneyView alloc]init];
        _showMoneyView.isShowMoneyMiddle = YES;
        [_productBackView addSubview:_showMoneyView];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Product_Favor_Icon"]];
        [_productBackView addSubview:_favorIcon];
        
        _favorCountLabel = [[UILabel alloc]init];
        [_favorCountLabel setTextAlignment:NSTextAlignmentRight];
        [_favorCountLabel setTextColor:RGBA(155, 155, 155, 40)];
        [_favorCountLabel setFont:[UIFont fontWithName:Default_Number_Font size:11]];
        [_productBackView addSubview:_favorCountLabel];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 20 +_imageViewHeight -0.5, kScreenWidth -60, 0.5)];
        [_lineView setBackgroundColor:RGBA(220, 220, 220, 50)];
        [_productBackView addSubview:_lineView];
        
    }
    
    return self;
}

-(void)setFavorProductWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index isLast:(BOOL )isLastCell
{
    _cellIndex = index;
    
    if (isLastCell) {
        [_lineView setHidden:YES];
    }
    else{
        [_lineView setHidden:NO];
    }
    
    [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];

    NSString * title = modal.productTitle;
    CGSize titleSize = [title getSizeWithLimitSize:CGSizeMake(kScreenWidth -40 -20 -10 -_imageViewWidth, _imageViewHeight -12) withFont:_productTitleLabel.font];
    [_productTitleLabel setFrame:CGRectMake(10 +_imageViewWidth +10, 10, kScreenWidth -40 -20 -10 -_imageViewWidth, titleSize.height)];
    [_productTitleLabel setText:title];
    
    CGSize showMoneySize = [_showMoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:Default_Money_Font size:11] GapWidth:1 PriceFont:[VibeFont fontWithName:Default_Price_Font size:13] Price:modal.productPrice TextColor:RGB(43, 214, 206)];
    [_showMoneyView setFrame:CGRectMake(10 +_imageViewWidth +10, 10 +_imageViewHeight -showMoneySize.height, showMoneySize.width, showMoneySize.height)];
    
    //收藏数
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.productFavorCount];
    float favorWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorCountLabel.font].width;
    
    [_favorCountLabel setFrame:CGRectMake(kScreenWidth -40 -10 -favorWidth, 10 +_imageViewHeight -15, favorWidth, 13)];
    [_favorCountLabel setText:favorCount];
    
    [_favorIcon setFrame:CGRectMake(kScreenWidth -40 -10 -favorWidth -14, 10 +_imageViewHeight - 14, 11, 11)];

}


-(void)didTapBackView
{
    if ([_delegateee respondsToSelector:@selector(mineFavorProductCellClickWithIndex:)]) {
        [_delegateee mineFavorProductCellClickWithIndex:_cellIndex];
    }
}


@end
