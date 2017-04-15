//
//  SearchResultCollectionViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchResultCollectionViewCell.h"

@implementation SearchResultCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        float itemWidth = (kScreenWidth -60 -20 -20)/2;
        float itemHeight = itemWidth +55;
        
        _searchItemView = [[RecommandItemView alloc]initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
        [_searchItemView setDelegateee:self];
        [self.contentView addSubview:_searchItemView];
    }
    
    return self;
}

-(void)setSearchResultCollectionViewCellWithModal:(RecommandItemModal *)modal
{
    [_searchItemView setItemView:modal];

}


@end
