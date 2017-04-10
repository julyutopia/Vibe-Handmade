//
//  ItemDetailTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemDetailModal.h"

@protocol ItemDetailTopTableViewCellDelegate;

@interface ItemDetailTopTableViewCell : UITableViewCell
{
    UIView      * _backView;
    
    UIImageView * _backBlurImgView;
    
    UIImageView * _photoImgView;

    UIButton    * _item_ShareBtn;
    UIButton    * _item_FavorBtn;
    UIButton    * _item_BuyBtn;
}

-(void)setDetailTopCellWithModal:(ItemDetailModal *)modal;

@property (weak, nonatomic) id<ItemDetailTopTableViewCellDelegate> delegateee;

@end

//代理协议
@protocol ItemDetailTopTableViewCellDelegate <NSObject>

-(void)ItemDetailTopCellTapShareBtn;    //点击分享按钮
-(void)ItemDetailTopCellTapFavorBtn;    //点击收藏按钮
-(void)ItemDetailTopCellTapBuyBtn;    //点击购买按钮

@end
