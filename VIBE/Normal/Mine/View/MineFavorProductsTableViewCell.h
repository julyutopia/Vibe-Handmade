//
//  MineFavorProductsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeProductModal.h"

@protocol MineFavorProductsTableViewCellDelegate;

@interface MineFavorProductsTableViewCell : UITableViewCell
{
    NSInteger       _cellIndex;
    
    HomeProductModal * _productModal;
    
    CAShapeLayer * _maskLayer;

    
    GLImageView         * _backImgView;
    
    UIView      * _backView;
    UIImageView * _productImgView;
    UILabel     * _productTitleLabel;
    UIImageView * _productShopIconImgView;
    UILabel     * _productShopNameLabel;
    
    
    UIImageView * _productPriceMoneyIconImgView;
    UILabel     * _productPriceLabel;
    
    //显示已有多少人喜欢的视图
    UIView      * _productFavorPeopleView;
    UIImageView * _productFavorPeopleIconImgView;
    UILabel     * _productFavorPeopleCountLabel;
    UIView      * _productCellLine;
    
    UIButton * _bottomTitleBtn;
}


@property (weak, nonatomic) id<MineFavorProductsTableViewCellDelegate> delegate;

-(void)setMineFavorProductCellWithModal:(HomeProductModal *)modal Index:(NSInteger )index IsLastCell:(BOOL )isLast;

@end


@protocol MineFavorProductsTableViewCellDelegate <NSObject>

-(void)clickMineProductWithIndex:(NSInteger )index;

-(void)clickMineProductShowAll;

@end







