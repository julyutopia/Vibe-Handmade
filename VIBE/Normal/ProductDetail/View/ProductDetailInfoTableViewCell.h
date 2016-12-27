//
//  ProductDetailInfoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/11/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeShowMoneyView.h"
#import "GradientTagCloudView.h"

@interface ProductDetailInfoTableViewCell : UITableViewCell
{
    float _priceLabelHeight;
    
    UIView      * _backView;
    
//    VibeShowMoneyView   * _showmoneyView;
    GradientTagCloudView* _gradientTagView;
    
//    UIButton    * _favorBtn;
//    UIButton    * _shareBtn;
    UIImageView * _infoImgView;
}

-(void)setInfoCellWithPrice:(NSString *)price AndTags:(NSArray *)tagsArray;

@end
