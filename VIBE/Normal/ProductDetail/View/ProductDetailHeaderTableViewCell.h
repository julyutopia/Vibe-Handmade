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
    
    NSMutableArray          * _bannerImgsArray;
    JGInfiniteScrollView    * _autoScrollView;
    
    UIView                  * _avatarBackView;
    UIImageView             * _avatarImgView;
    
    UILabel                 * _productNameLabel;
}

-(void)setProductDetailHeaderCellWithModal:(VibeProductModal *)modal;

@end
