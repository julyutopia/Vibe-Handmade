//
//  ItemDetailTitleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemDetailModal.h"

@interface ItemDetailTitleTableViewCell : UITableViewCell
{
    UILabel     * _itemTitleLabel;
    
    UILabel     * _moneyLabel;
    UILabel     * _itemPriceLabel;
}

-(void)setDetailTitleCellWithModal:(ItemDetailModal *)modal;

@end
