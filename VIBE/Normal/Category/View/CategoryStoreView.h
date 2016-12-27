//
//  CategoryStoreView.h
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryStoreModal.h"
#import "HomeProductModal.h"

#import "UIImageViewModeScaleAspect.h"

@protocol CategoryStoreViewDelegate;

@interface CategoryStoreView : UIView
{
    NSInteger         _storeID;
    
    UIView          * _backView;
    
    GLImageView     * _backImgView;
    
    UIImageView     * _stroreImgView;
    UILabel         * _storeNameLabel;
    
    UIImageView     * _storeIconImgView;
    UILabel         * _storeOwnerNameLabel;
    
    UIButton        * _storeFavoredBtn;

    UILabel         * _storeSloganTitleLabel;
    
    UIImageViewModeScaleAspect     * _firstProductImgView;
    UIImageViewModeScaleAspect     * _secondProductImgView;
    UIImageViewModeScaleAspect     * _thirdProductImgView;
    UIImageViewModeScaleAspect     * _fourthProductImgView;
}

@property(retain,nonatomic)CategoryStoreModal * storeModal;

-(void)setCategoryStoreViewWithModal:(CategoryStoreModal *)modal;

@property (weak, nonatomic) id<CategoryStoreViewDelegate> delegate;

@end

@protocol CategoryStoreViewDelegate <NSObject>

-(void)categoryCellDidTapWithStoreID:(NSInteger )storeID;

@end












