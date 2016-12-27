//
//  MineFavorStoresTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryStoreModal.h"
#import "HomeProductModal.h"

@protocol MineFavorStoresTableViewCellDelegate;

@interface MineFavorStoresTableViewCell : UITableViewCell
{
    NSInteger _cellIndex;
    
    float _imgViewHeight;
    float _totalHeight;
    
    CategoryStoreModal * _storeModal;
    
    GLImageView * _backImgView;
    
    UIView * _backView;

    UIImageView * _storeImgView;
    UILabel * _storeNameLabel;
    
    UIImageView * _storeIconImgView;
    UILabel     * _storeOwnerLabel;
    
    UIView      * _showTagsView;
    
    float         _tagsViewLeftOrigin;
    
    UIView      * _showProductsView;
    
    UIView      * _storeCellLine;
    
    CAShapeLayer * _maskLayer;

    UIButton * _bottomTitleBtn;
}

@property (weak, nonatomic) id<MineFavorStoresTableViewCellDelegate> delegate;

-(void)setMineStoreCellWithModal:(CategoryStoreModal *)modal Index:(NSInteger )index IsLast:(BOOL)last;

@end

@protocol MineFavorStoresTableViewCellDelegate <NSObject>

-(void)showMineFavorStoreWithIndex:(NSInteger )index;

-(void)showMineFavorStoreAll;

@end




