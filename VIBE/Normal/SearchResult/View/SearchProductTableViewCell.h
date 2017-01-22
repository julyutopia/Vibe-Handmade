//
//  SearchProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchProductTableViewCellDelegate;

@interface SearchProductTableViewCell : UITableViewCell
{
    NSInteger          _productID;
    
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

@property (weak, nonatomic) id<SearchProductTableViewCellDelegate> delegateee;

@property (assign, nonatomic) BOOL isFirstCell;

-(void)setProductCellWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index IsLastCell:(BOOL )last;

@end

@protocol SearchProductTableViewCellDelegate <NSObject>

-(void)searchProductCellClickWithProductID:(NSInteger )productID;

@end


