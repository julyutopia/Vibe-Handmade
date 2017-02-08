//
//  ProductDetailHeaderTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/20.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGInfiniteScrollView.h"
#import "VibeProductModal.h"

@interface ProductDetailHeaderTableViewCell : UITableViewCell<JGInfiniteScrollViewDelegate>
{
    float                   _width;
    float                   _height;
    
    UIView                  * _headerBackView;

    CAShapeLayer            * _maskLayer;
    
    UIView                  * _scrollBackView;
    JGInfiniteScrollView    * _autoScrollView;
    NSMutableArray          * _bannerImgsArray;
    
    UILabel                 * _productTitleLabel;
}

-(void)setProductDetailHeaderCellWithModal:(VibeProductModal *)modal;

@end
