//
//  HomeProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeProductModal.h"
#import "AMBlurView.h"


@protocol HomeProductTableViewCellDelegate;

@interface HomeProductTableViewCell : UITableViewCell
{
    NSInteger       _cellIndex;
    
    HomeProductModal * _productModal;
    
    UIERealTimeBlurView      * _backView;
    
    GLImageView * _productBackImgView;
    UIVisualEffectView * _productBlurView;
    
    UIImageView * _productImgView;
    UIButton    * _productFavorBtn;
    
    UILabel     * _productTitleLabel;
    UIImageView * _productShopIconImgView;
    UILabel     * _productShopNameLabel;
    
    UIImageView * _productPriceMoneyIconImgView;
    UILabel     * _productPriceLabel;

    UIButton    * _productUserFavorBtn;
    
    //显示已有多少人喜欢的视图
    UIView      * _productFavorPeopleView;
    UIImageView * _productFavorPeopleIconImgView;
    UILabel     * _productFavorPeopleCountLabel;
    //如没有人喜欢，显示‘新品’
    UILabel     * _productNewArrivalLabel;
    
    UIView      * _productCellLine;
}

@property (weak, nonatomic) id<HomeProductTableViewCellDelegate> delegate;

-(void)setProductCellWithModal:(HomeProductModal *)modal WithIndex:(NSInteger )index IsLast:(BOOL )isLast;

@end

@protocol HomeProductTableViewCellDelegate <NSObject>

-(void)homeProductCellTapWithIndex:(NSInteger )index;

@end