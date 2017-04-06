//
//  RecommandItemView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemModal.h"

#import "GLImageView.h"


@interface RecommandItemView : UIView
{
    GLImageView * _backView;
    UIImageView * _infoImgView;
    UIButton    * _itemFavorBtn;
    
    UILabel     * _itemNameLabel;
    UILabel     * _itemPriceLabel;
}

-(void)setItemView:(RecommandItemModal *)itemModal;

@end
