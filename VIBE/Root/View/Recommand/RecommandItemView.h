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

@protocol RecommandItemViewDelegate;

@interface RecommandItemView : UIView
{
    GLImageView * _backView;
    UIImageView * _infoImgView;
    UIButton    * _itemFavorBtn;
    
    UILabel     * _itemNameLabel;
    UILabel     * _itemPriceLabel;
    
    NSInteger     _itemID;
}

-(void)setItemView:(RecommandItemModal *)itemModal;

@property (weak, nonatomic) id<RecommandItemViewDelegate> delegateee;

@end

//代理协议
@protocol RecommandItemViewDelegate <NSObject>

-(void)recommandItemViewClickWithID:(NSInteger )itemID;

@end
