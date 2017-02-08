//
//  ProductDetailTagTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/2/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GradientTagCloudView.h"

@interface ProductDetailTagTableViewCell : UITableViewCell
{
    UIView              * _backView;
    
    float                 _tagViewMaxWidth;
    //标签
    GradientTagCloudView* _gradientTagView;
    
    //显示收藏数
    UIView              * _showFavorView;
    UIImageView         * _favorIcon;
    UILabel             * _favorCountLabel;
}

-(void)setDetailTagCellWithModal:(VibeProductModal *)modal;

@end
