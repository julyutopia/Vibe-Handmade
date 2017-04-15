//
//  TopicDetailItemsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemModal.h"
#import "RecommandItemView.h"

@interface TopicDetailItemsTableViewCell : UITableViewCell
{
    float             _titleHeight;
    
    UIView          * _backView;
    
    UILabel         * _titleLabel;
    
    UIButton        * _showAllBtn;

    NSMutableArray  * _itemsArray;
}

-(void)setTopicDetailItemsWithItems:(NSArray *)itemsArray;

@end
