//
//  ItemDetailTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailTopTableViewCell.h"

@implementation ItemDetailTopTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        UIView      * _backView;
//        UIImageView * _backBlurImgView;
//        UIImageView * _photoImgView;
        
        float photoImgViewWidth = kScreenWidth -60;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, photoImgViewWidth, photoImgViewWidth +30)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_backView];
        
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoImgViewWidth -12, photoImgViewWidth -12)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 40).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_backBlurImgView];

        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoImgViewWidth, photoImgViewWidth)];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];
        
        //设置左边的圆角
        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_photoImgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
        maskLayer.frame = _photoImgView.bounds;
        maskLayer.path = maskPath.CGPath;
        _photoImgView.layer.mask = maskLayer;
        
        _item_BuyBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -60 -12 -60, photoImgViewWidth -40, 60, 60)];
        [_item_BuyBtn setBackgroundImage:[UIImage imageNamed:@"Item_Detail_Buy"] forState:UIControlStateNormal];
        [_item_BuyBtn.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
        [_item_BuyBtn.layer setShadowOffset:CGSizeMake(2, 2)];
        [_item_BuyBtn.layer setShadowOpacity:0.8f];
        [_item_BuyBtn.layer setShadowRadius:4.0f];
        [_backView addSubview:_item_BuyBtn];
        
        _item_FavorBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -60 -12 -25/2 -35, photoImgViewWidth -40 -20 -35, 35, 35)];
        [_item_FavorBtn setBackgroundImage:[UIImage imageNamed:@"Item_Detail_Favor"] forState:UIControlStateNormal];
        [_item_FavorBtn.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
        [_item_FavorBtn.layer setShadowOffset:CGSizeMake(2, 2)];
        [_item_FavorBtn.layer setShadowOpacity:0.8f];
        [_item_FavorBtn.layer setShadowRadius:4.0f];
        [_backView addSubview:_item_FavorBtn];
        
        _item_ShareBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -60 -12 -25/2 -35, photoImgViewWidth -40 -20 -35 -20 -35, 35, 35)];
        [_item_ShareBtn setBackgroundImage:[UIImage imageNamed:@"Item_Detail_Share"] forState:UIControlStateNormal];
        [_item_ShareBtn.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
        [_item_ShareBtn.layer setShadowOffset:CGSizeMake(2, 2)];
        [_item_ShareBtn.layer setShadowOpacity:0.8f];
        [_item_ShareBtn.layer setShadowRadius:4.0f];
        [_backView addSubview:_item_ShareBtn];
        
        
        [_item_ShareBtn addTarget:self action:@selector(didClickShareBtn) forControlEvents:UIControlEventTouchUpInside];
        [_item_FavorBtn addTarget:self action:@selector(didClickfavorBtn) forControlEvents:UIControlEventTouchUpInside];
        [_item_BuyBtn addTarget:self action:@selector(didClickBuyBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}


-(void)setDetailTopCellWithModal:(ItemDetailModal *)modal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.itemCoverImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_backBlurImgView setImage:image];
        [_backBlurImgView setHidden:NO];
        
    }];
    
}


-(void)didClickShareBtn
{
    if ([_delegateee respondsToSelector:@selector(ItemDetailTopCellTapShareBtn)]) {
        [_delegateee ItemDetailTopCellTapShareBtn];
    }
}

-(void)didClickfavorBtn
{
    if ([_delegateee respondsToSelector:@selector(ItemDetailTopCellTapFavorBtn)]) {
        [_delegateee ItemDetailTopCellTapFavorBtn];
    }
}

-(void)didClickBuyBtn
{
    if ([_delegateee respondsToSelector:@selector(ItemDetailTopCellTapBuyBtn)]) {
        [_delegateee ItemDetailTopCellTapBuyBtn];
    }
}


@end



