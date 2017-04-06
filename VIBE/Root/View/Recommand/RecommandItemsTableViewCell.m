//
//  RecommandItemsTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandItemsTableViewCell.h"

@implementation RecommandItemsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float itemWidth = ((kScreenWidth -55) -25)/2;
        float itemHeight = itemWidth +55;
        
        _leftItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(55/2, 0, itemWidth, itemHeight)];
        [self.contentView addSubview:_leftItemView];
        
        _rightItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(kScreenWidth -55/2 -itemWidth, 0, itemWidth, itemHeight)];
        [self.contentView addSubview:_rightItemView];
    }
    
    return self;
}


-(void)setItemsCellWithLeftItem:(RecommandItemModal *)leftModal AndRightItem:(RecommandItemModal *)rightItem
{

    [_leftItemView setItemView:leftModal];
    [_rightItemView setItemView:rightItem];
    
}



@end




