//
//  ItemDetailGuessTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/12.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailGuessTableViewCell.h"

@implementation ItemDetailGuessTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float itemWidth = ((kScreenWidth -60 -20) -20)/2;
        float itemHeight = itemWidth +55;
     
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60 -40, itemHeight +20)];
        [self.contentView addSubview:_backView];
        
        _leftItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
        [_leftItemView setDelegateee:self];
        [_backView addSubview:_leftItemView];
        
        _rightItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake( itemWidth +20, 0, itemWidth, itemHeight)];
        [_rightItemView setDelegateee:self];
        [_backView addSubview:_rightItemView];

    }
    
    return self;
}


-(void)setItemDetailGuessCellWithLeftItem:(RecommandItemModal *)leftModal AndRightItem:(RecommandItemModal *)rightItem
{
    [_leftItemView setItemView:leftModal];
    [_rightItemView setItemView:rightItem];
}


#pragma mark -ItemView代理方法
-(void)recommandItemViewClickWithID:(NSInteger )itemID
{
    if ([_delegateee respondsToSelector:@selector(itemDetailGuessCellDidClickItemWithID:)]) {
        [_delegateee itemDetailGuessCellDidClickItemWithID:itemID];
    }
}



@end
