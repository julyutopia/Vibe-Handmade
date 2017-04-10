//
//  ItemDetailInfoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemDetailModal.h"

@interface ItemDetailInfoTableViewCell : UITableViewCell
{
    UIView      * _backView;
    
    UILabel     * _titleLabel;
    
    UILabel     * _infoDetailLabel;
}

-(void)setItemDetailInfoCellWithModal:(ItemDetailModal *)modal;

@end
