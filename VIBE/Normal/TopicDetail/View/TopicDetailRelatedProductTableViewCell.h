//
//  TopicDetailRelatedProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2016/12/21.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"

@interface TopicDetailRelatedProductTableViewCell : UITableViewCell
{
    UIView           * _contentBackView;
    
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



