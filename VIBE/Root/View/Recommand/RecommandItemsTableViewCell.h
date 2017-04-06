//
//  RecommandItemsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"

@interface RecommandItemsTableViewCell : UITableViewCell
{
    RecommandItemView   * _leftItemView;
    RecommandItemView   * _rightItemView;
}

-(void)setItemsCellWithLeftItem:(RecommandItemModal *)leftModal AndRightItem:(RecommandItemModal *)rightItem;

@end
