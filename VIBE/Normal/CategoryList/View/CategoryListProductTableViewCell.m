//
//  CategoryListProductTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2016/12/27.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryListProductTableViewCell.h"

@implementation CategoryListProductTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _productViewWidth = kScreenWidth -20;
        _productViewHeight = _productViewWidth/4;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(10, 0, _productViewWidth, _productViewHeight)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [_backView addTarget:self action:@selector(didTapProductView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backView];
        
        float imgViewHeight = _productViewHeight -20;
        float imgViewWidth = imgViewHeight/9*16;
        
        _productImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, imgViewWidth, _productViewHeight -20)];
        [_productImgView.layer setMasksToBounds:YES];
        [_productImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_productImgView setUserInteractionEnabled:NO];
        [_backView addSubview:_productImgView];
        
        _productLine = [[UIView alloc]initWithFrame:CGRectMake(10, _productViewHeight -1, _productViewWidth -20, 1)];
        [_productLine setBackgroundColor:RGBA(245, 245, 245, 100)];
        [_backView addSubview:_productLine];
        
        _rightSideWidth = _productViewWidth -10 -6 - 10 -imgViewWidth;
        _rightSideHeight = _productViewHeight -20;
        
        _rightSideView = [[UIView alloc]initWithFrame:CGRectMake(10 +imgViewWidth +6, 10, _rightSideWidth, _rightSideHeight)];
        [_rightSideView setBackgroundColor:[UIColor clearColor]];
        [_rightSideView setUserInteractionEnabled:NO];
        [_backView addSubview:_rightSideView];
        
        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:DefaultQYTextColor80];
        [_titleLabel setFont:[VibeFont fontWithName:Default_Font size:15]];
        [_titleLabel setNumberOfLines:0];
        _titleLabel.layer.shadowColor = RGBA(182, 182, 182, 40).CGColor;
        _titleLabel.layer.shadowOffset = CGSizeMake(0,1);
        _titleLabel.layer.shadowOpacity = 0.2;
        _titleLabel.layer.shadowRadius = 4;
        [_rightSideView addSubview:_titleLabel];
        
        NSString * testString = @"测试看看";
        _singleTitleHeight = [testString getSizeWithLimitSize:CGSizeMake(100, 30) withFont:_titleLabel.font].height;
        
        _showMoneyView = [[VibeShowMoneyView alloc]init];
        _showMoneyView.isShowMoneyMiddle = YES;
        [_rightSideView addSubview:_showMoneyView];
        
        
        _showFavorView = [[UIView alloc]initWithFrame:CGRectMake(_rightSideWidth -80, _rightSideHeight -15, 80, 15)];
        [_showFavorView setBackgroundColor:[UIColor clearColor]];
        [_rightSideView addSubview:_showFavorView];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Product_Favor_Icon"]];
        [_showFavorView addSubview:_favorIcon];
        
        _favorCountLabel = [[UILabel alloc]init];
        [_favorCountLabel setTextAlignment:NSTextAlignmentRight];
        [_favorCountLabel setTextColor:RGBA(155, 155, 155, 40)];
        [_favorCountLabel setFont:[UIFont fontWithName:Default_Number_Font size:12]];
        [_showFavorView addSubview:_favorCountLabel];
        
    }
    
    return self;
}


-(void)setProductCellWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index IsLastCell:(BOOL )last
{
    NSLog(@"_______%ld________IsLast:%d_______%@________",index,last,modal.productTitle);
    
    [_backView setFrame: CGRectMake(10, 0, _productViewWidth, _productViewHeight)];
    _backView.layer.mask = nil;
    [_productLine setHidden:NO];
    
    //列表中第一个产品
    if (index == 0) {
        
        if (!_maskLayer) {
            _maskLayer =[[CAShapeLayer alloc] init];
        }
        [_backView setFrame: CGRectMake(10, 10, _productViewWidth, _productViewHeight)];

        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        _maskLayer.frame = _backView.bounds;
        _maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = _maskLayer;
        
    }
    
    //列表中最后一个产品
    if (last == YES) {
        [_productLine setHidden:YES];
        if (!_maskLayer) {
            _maskLayer =[[CAShapeLayer alloc] init];
        }
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
        _maskLayer.frame = _backView.bounds;
        _maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = _maskLayer;
    }
    
    _productCellIndex = index;
    
    [_productImgView sd_setImageWithURL:[NSURL URLWithString:modal.productImgURL] placeholderImage:nil];
    
    NSString * title = modal.productTitle;
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(_rightSideWidth, _singleTitleHeight *3 +1) withFont:_titleLabel.font].height;
    
    [_titleLabel setFrame:CGRectMake(0, 0, _rightSideWidth, titleHeight)];
    [_titleLabel setText:title];
    
    
    CGSize showMoneySize = [_showMoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:Default_Money_Font size:13] GapWidth:0 PriceFont:[VibeFont fontWithName:Default_Price_Font size:19] Price:modal.productPrice TextColor:RGB(43, 214, 206)];
    [_showMoneyView setFrame:CGRectMake(0, _rightSideHeight -showMoneySize.height, showMoneySize.width, showMoneySize.height)];
    
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.productFavorCount];
    float favorWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorCountLabel.font].width;
    
    [_favorCountLabel setFrame:CGRectMake(_showFavorView.frame.size.width -favorWidth, 0, favorWidth, 15)];
    [_favorCountLabel setText:favorCount];
    [_favorIcon setFrame:CGRectMake(_showFavorView.frame.size.width -favorWidth -3 -13, 1, 13, 13)];
}


-(void)didTapProductView
{
    if ([_delegateee respondsToSelector:@selector(categoryListProductCellClickWithIndex:)]) {
        [_delegateee categoryListProductCellClickWithIndex:_productCellIndex];
    }
}


@end
