//
//  TagListItemCollectionViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TagListItemCollectionViewCell.h"

@implementation TagListItemCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
 
        self.backgroundColor = [UIColor clearColor];
        
        float itemWidth = (kScreenWidth -60 -20 -20)/2;
        float itemHeight = itemWidth +55;
        
        _itemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
        [_itemView setDelegateee:self];
        [self.contentView addSubview:_itemView];
    }
    
    return self;
}


-(void)setRecommandViewWithModal:(RecommandItemModal *)item WithIndex:(NSInteger )index
{
    _index = index;
    
    [_itemView setItemView:item];
}

#pragma mark -商品View点击的代理方法
-(void)recommandItemViewClickWithID:(NSInteger )itemID
{
    if ([_delegateee respondsToSelector:@selector(tagListItemCollectionViewCellClickWithID:)]) {
        [_delegateee tagListItemCollectionViewCellClickWithID:itemID];
    }
}

@end


