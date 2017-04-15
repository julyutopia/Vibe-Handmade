//
//  CategoryListItemCollectionViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/12.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CategoryListItemCollectionViewCell.h"

@implementation CategoryListItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        float itemWidth = (kScreenWidth -40 -20 -40)/2;
        float itemHeight = itemWidth +55;
        
        _categoryItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
        [_categoryItemView setDelegateee:self];
        [self.contentView addSubview:_categoryItemView];
    }
    
    return self;
}

-(void)setCategoryListItemCollectionViewCellWithModal:(RecommandItemModal *)modal
{
    [_categoryItemView setItemView:modal];
}


#pragma mark -单品View的代理方法
-(void)recommandItemViewClickWithID:(NSInteger)itemID
{
    if ([_delegateee respondsToSelector:@selector(categoryListItemClickWithID:)]) {
        [_delegateee categoryListItemClickWithID:itemID];
    }
}


@end
