//
//  RecommandItemView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//


//GLImageView * _backView;
//UIImageView * _infoImgView;
//UIButton    * _itemFavorBtn;
//
//UILabel     * _itemNameLabel;
//UILabel     * _itemPriceLabel;


#import "RecommandItemView.h"

@implementation RecommandItemView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float width = frame.size.width;
        float height = frame.size.height;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        [_backView.layer setCornerRadius:4];
        [_backView.layer setMasksToBounds:YES];
        [self addSubview:_backView];
        
        _infoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        [_infoImgView.layer setCornerRadius:4];
        [_infoImgView.layer setMasksToBounds:YES];
        [_infoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_infoImgView];
     
        _itemFavorBtn = [[UIButton alloc]initWithFrame:CGRectMake(width - 10, 10, 20, 20)];
        [_itemFavorBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_itemFavorBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_backView addSubview:_itemFavorBtn];
        
        _itemNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, width +10, width, 18)];
        [_itemNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemNameLabel setTextColor:Default_Text_Gray_Color];
        [_itemNameLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:15]];
        [_backView addSubview:_itemNameLabel];
    
        _itemPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, width +35, width, 18)];
        [_itemPriceLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemPriceLabel setTextColor:Default_Text_Dark_Color];
        [_itemPriceLabel setFont:[VibeFont fontWithName:Font_English_Bold size:15]];
        [_backView addSubview:_itemPriceLabel];
    }
    
    
    return self;
}


-(void)setItemView:(RecommandItemModal *)itemModal
{
    [_infoImgView sd_setImageWithURL:[NSURL URLWithString:itemModal.productImgURL] placeholderImage:nil];
    [_itemNameLabel setText:itemModal.productTitle];
    [_itemPriceLabel setText:[NSString stringWithFormat:@"￥ %@",itemModal.productPrice]];
}



@end
