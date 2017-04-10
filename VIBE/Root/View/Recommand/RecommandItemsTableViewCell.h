//
//  RecommandItemsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"

@protocol RecommandItemsTableViewCellDelegate;

@interface RecommandItemsTableViewCell : UITableViewCell<RecommandItemViewDelegate>
{
    RecommandItemView   * _leftItemView;
    RecommandItemView   * _rightItemView;
}

-(void)setItemsCellWithLeftItem:(RecommandItemModal *)leftModal AndRightItem:(RecommandItemModal *)rightItem;

@property (weak, nonatomic) id<RecommandItemsTableViewCellDelegate> delegateee;

@end

//代理协议
@protocol RecommandItemsTableViewCellDelegate <NSObject>

-(void)recommandItemCellDidClickItemWithID:(NSInteger )itemID;

@end

