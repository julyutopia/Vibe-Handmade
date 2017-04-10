//
//  SearchResultCollectionViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"
#import "RecommandItemModal.h"

@interface SearchResultCollectionViewCell : UICollectionViewCell
{
    RecommandItemView * _searchItemView;
}

-(void)setSearchResultCollectionViewCellWithModal:(RecommandItemModal *)modal;

@end
