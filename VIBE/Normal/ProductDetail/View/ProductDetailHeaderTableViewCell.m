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
        _width = kScreenWidth;
        _height = _width/16 *9;
        
        _headerBackView = [[UIView alloc]init];
        [_headerBackView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_headerBackView];
        
        _bannerImgsArray = [[NSMutableArray alloc]init];
        
        _autoScrollView = [[JGInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        [_autoScrollView setBackgroundColor:[UIColor whiteColor]];
        _autoScrollView.pageControlPostion = 2;
        _autoScrollView.isShowIndex = YES;
        _autoScrollView.delegate = self;
        [_autoScrollView.layer setMasksToBounds:YES];
        [_headerBackView addSubview:_autoScrollView];
        
        _productNameLabel = [[UILabel alloc]init];
        [_productNameLabel setNumberOfLines:0];
        [_productNameLabel setTextColor:DefaultQYTextColor70];
        [_productNameLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:16]];
        [_headerBackView addSubview:_productNameLabel];
        
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
        CGSize nameSize = [productName getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:_productNameLabel.font];
        [_productNameLabel setFrame:CGRectMake(15, _height +15, kScreenWidth -30, nameSize.height +1)];
        [_productNameLabel setText:productName];
        
        [_headerBackView setFrame:CGRectMake(0, 0, kScreenWidth, _height +15 +nameSize.height +10)];
    }

    
}

@end



