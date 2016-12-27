//
//  ProductDetailGuessProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/11/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"

@interface ProductDetailGuessProductTableViewCell : UITableViewCell
{
    GLImageView      * _backView;
    
    CAShapeLayer        * _maskLayer;
    
    UIImageView * _productImgView;
 
    float       _imageViewWidth;
    float       _imageViewHeight;
    
    float       _rightViewWidth;
    
    UILabel     * _productTitleLabel;
    
    VibeShowMoneyView   * _showMoneyView;
    
    UIView              * _showFavorView;
    UIImageView         * _favorIcon;
    UILabel             * _favorCountLabel;
    
    UIView              * _lineView;
    
}

-(void)setGuessProductWithModal:(VibeProductModal *)modal IsLast:(BOOL )last;

@end
