//
//  MineFavorProductTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/2/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineFavorProductTableViewCellDelegate;

@interface MineFavorProductTableViewCell : UITableViewCell
{
    GLImageView         * _productBackView;
    UIImageView         * _productImgView;
    
    float                 _imageViewWidth;
    float                 _imageViewHeight;
        
    UILabel             * _productTitleLabel;
    
    VibeShowMoneyView   * _showMoneyView;
    
    UIView              * _showFavorView;
    UIImageView         * _favorIcon;
    UILabel             * _favorCountLabel;
    
    UIView              * _lineView;
    
    NSInteger             _cellIndex;
}

@property (weak, nonatomic) id<MineFavorProductTableViewCellDelegate> delegateee;

-(void)setFavorProductWithModal:(VibeProductModal *)modal WithIndex:(NSInteger )index isLast:(BOOL )isLastCell;

@end

@protocol MineFavorProductTableViewCellDelegate <NSObject>

-(void)mineFavorProductCellClickWithIndex:(NSInteger )index;

@end


