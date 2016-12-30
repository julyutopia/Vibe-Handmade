//
//  CategoryListProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2016/12/27.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"

@protocol CategoryListProductTableViewCellDelegate;

@interface CategoryListProductTableViewCell : UITableViewCell
{
    NSInteger          _productCellIndex;
    
    float               _productViewWidth;
    float               _productViewHeight;
    
    GLImageView         * _backView;
    
    CAShapeLayer        * _maskLayer;
    
    UIImageView         * _productImgView;
    
    UIView              * _productLine;
    
    float                 _rightSideWidth;
    float                 _rightSideHeight;
    
    UIView              * _rightSideView;
    
    float                 _singleTitleHeight;
    UILabel             * _titleLabel;
    
    VibeShowMoneyView   * _showMoneyView;
    
    UIView              * _showFavorView;
    UIImageView         * _favorIcon;
    UILabel             * _favorCountLabel;
}

@property (weak, nonatomic) id<CategoryListProductTableViewCellDelegate> delegateee;
-(void)setProductCellWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index IsLastCell:(BOOL )last;

@end

@protocol CategoryListProductTableViewCellDelegate <NSObject>

-(void)categoryListProductCellClickWithIndex:(NSInteger )index;

@end

