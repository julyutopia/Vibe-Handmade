//
//  ProductDetailHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/20.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailHeaderTableViewCell.h"

@implementation ProductDetailHeaderTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _width = kScreenWidth -20;
        _height = _width/16 *9;
        
        _headerBackView = [[UIView alloc]init];
        [_headerBackView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_headerBackView];
        
        
        _productTitleLabel = [[UILabel alloc]init];
        [_productTitleLabel setNumberOfLines:0];
        [_productTitleLabel setTextColor:RGBA(25, 33, 58, 70)];
        [_productTitleLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:15]];
        [_headerBackView addSubview:_productTitleLabel];
        
        
        //显示阴影的View
        UIView * shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, _height -2, _width, 1)];
        [shadowView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:shadowView];
        [shadowView.layer setShadowOffset:CGSizeMake(0, 2)];
        [shadowView.layer setShadowColor:RGBA(80, 80, 162, 90).CGColor];
        [shadowView.layer setShadowRadius:2.0f];
        [shadowView.layer setShadowOpacity:1.0f];

        
        //滚动的背景
        _scrollBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        [_scrollBackView setBackgroundColor:[UIColor clearColor]];
        [_scrollBackView.layer setMasksToBounds:YES];
        [self addSubview:_scrollBackView];
        UIBezierPath *scrollBackViewMaskPath = [UIBezierPath bezierPathWithRoundedRect:_scrollBackView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
        CAShapeLayer *scrollBackViewMaskLayer = [[CAShapeLayer alloc] init];
        scrollBackViewMaskLayer.frame = _scrollBackView.bounds;
        scrollBackViewMaskLayer.path = scrollBackViewMaskPath.CGPath;
        _scrollBackView.layer.mask = scrollBackViewMaskLayer;

        
        //滚动图
        _autoScrollView = [[JGInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        [_autoScrollView setBackgroundColor:[UIColor whiteColor]];
        _autoScrollView.pageControlPostion = 1;
        _autoScrollView.delegate = self;
        [_scrollBackView addSubview:_autoScrollView];
        
     
        _bannerImgsArray = [[NSMutableArray alloc]init];

    }
    
    return self;
}


-(void)setProductDetailHeaderCellWithModal:(VibeProductModal *)modal
{
    if (_bannerImgsArray.count >0) {
        return;
    }
    
    if (modal.productTopImageUrlsArray.count) {
        for (int i =0; i<modal.productTopImageUrlsArray.count; i++) {
            NSString * imgURL = [modal.productTopImageUrlsArray objectAtIndex:i];
            [_bannerImgsArray addObject:imgURL];
        }
        [_autoScrollView setImages:_bannerImgsArray];
        
        NSString * productName = modal.productTitle;
        

        CGSize nameSize = [productName getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:_productTitleLabel.font];
        [_productTitleLabel setFrame:CGRectMake(15, 15, kScreenWidth -50, nameSize.height +1)];
        [_productTitleLabel setText:productName];
       
        [_headerBackView setFrame:CGRectMake(0, _height, _width, 15 + nameSize.height +10)];
   
    }
    
    
  
    
}

@end



