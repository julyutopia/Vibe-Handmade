//
//  RecommandProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"

@protocol RecommandProductTableViewCellDelegate;

@interface RecommandProductTableViewCell : UITableViewCell
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

@property (weak, nonatomic) id<RecommandProductTableViewCellDelegate> delegateee;

-(void)setProductCellWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index IsLastCell:(BOOL )last;

@end

@protocol RecommandProductTableViewCellDelegate <NSObject>

-(void)recommandProductCellClickWithIndex:(NSInteger )index;

@end


