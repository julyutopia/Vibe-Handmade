//
//  ItemDetailGuessTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/12.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"

@protocol ItemDetailGuessTableViewCellDelegate;

@interface ItemDetailGuessTableViewCell : UITableViewCell<RecommandItemViewDelegate>
{
    UIView              * _backView;
    
    RecommandItemView   * _leftItemView;
    RecommandItemView   * _rightItemView;
}

-(void)setItemDetailGuessCellWithLeftItem:(RecommandItemModal *)leftModal AndRightItem:(RecommandItemModal *)rightItem;

@property (weak, nonatomic) id<ItemDetailGuessTableViewCellDelegate> delegateee;

@end

//代理协议
@protocol ItemDetailGuessTableViewCellDelegate <NSObject>

-(void)itemDetailGuessCellDidClickItemWithID:(NSInteger )itemID;

@end
