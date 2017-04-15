//
//  TopicDetailItemsTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TopicDetailItemsTableViewCell.h"

@implementation TopicDetailItemsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        UIView          * _backView;
//        UILabel         * _titleLabel;
//        UIButton        * _showAllBtn;
//        NSMutableArray  * _itemsArray;
        
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60, 200)];
        [self.contentView addSubview:_backView];
        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Dark_Color_90];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]];
        [_backView addSubview:_titleLabel];
        
        NSString * title = @"相关推荐";
        
        _titleHeight = [title getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_titleLabel.font].height;
        [_titleLabel setFrame:CGRectMake(0, 0, 100, _titleHeight)];
        [_titleLabel setText:title];
        
        _showAllBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -60 -20 -100, 0, 100, _titleHeight)];
        [_showAllBtn setTitle:@"查看全部" forState:UIControlStateNormal];
        [_showAllBtn setTitleColor:DefaultBlue forState:UIControlStateNormal];
        [_showAllBtn setTitleColor:DefaultBlue_Pressed forState:UIControlStateHighlighted];
        [_showAllBtn.titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]];
        [_showAllBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
        [_backView addSubview:_showAllBtn];
        
        
        _itemsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)setTopicDetailItemsWithItems:(NSArray *)itemsArray
{
    if (_itemsArray.count) {
        return;
    }
    
    [_itemsArray removeAllObjects];
    [_itemsArray addObjectsFromArray:itemsArray];
    
    
    float itemWidth = ((kScreenWidth -60 -20) -20)/2;
    float itemHeight = itemWidth +55;
    
    
    for (int i =0; i <itemsArray.count; i ++) {
        
        RecommandItemModal * modal = [itemsArray objectAtIndex:i];
        
        NSInteger lefttt = i % 2;
        NSInteger abovee = i / 2;
        
        RecommandItemView * itemView = [[RecommandItemView alloc]initWithFrame:CGRectMake( (itemWidth +20) * lefttt, _titleHeight +20 +(itemHeight +20) * abovee, itemWidth, itemHeight)];
        [itemView setItemView:modal];
        
        [_backView addSubview:itemView];
    }
    
    NSInteger itemsRows = _itemsArray.count/2;
    
    float totalHeight = _titleHeight +20 + (itemHeight +20) * itemsRows;
    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60, totalHeight)];
    
}


@end
