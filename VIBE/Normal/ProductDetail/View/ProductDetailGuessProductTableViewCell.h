//
//  ProductDetailGuessProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/11/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"

@protocol ProductDetailGuessProductTableViewCellDelegate;

@interface ProductDetailGuessProductTableViewCell : UITableViewCell
{
    NSInteger             _guessIndex;
    
    UIView              * _backView;
    
    GLImageView         * _productBackView;
    
    CAShapeLayer        * _maskLayer;
    
    UIImageView         * _productImgView;
 
    float                 _imageViewWidth;
    float                 _imageViewHeight;
    
    float                 _rightViewWidth;
    
    UILabel             * _productTitleLabel;
    
    VibeShowMoneyView   * _showMoneyView;
    
    UIView              * _showFavorView;
    UIImageView         * _favorIcon;
    UILabel             * _favorCountLabel;
    
    UIView              * _lineView;
    
}

@property (weak, nonatomic) id<ProductDetailGuessProductTableViewCellDelegate> delegate;

-(void)setGuessProductWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index IsLast:(BOOL )last;

@end

@protocol ProductDetailGuessProductTableViewCellDelegate <NSObject>

-(void)productDetailGuessClickWithIndex:(NSInteger )index;

@end

