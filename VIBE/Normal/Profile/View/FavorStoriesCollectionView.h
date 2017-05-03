//
//  FavorStoriesCollectionView.h
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FavorStoriesCollectionViewCell.h"

@interface FavorStoriesCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource>
{
    UIView  * _collectionFooterView;

    NSMutableArray  * _storiesArray;
}

-(void)initCollectionView;

-(void)setFavorStoriesCollectionViewWithArray:(NSArray *)storiesArray;


@end
