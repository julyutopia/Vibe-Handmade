//
//  FavorStoriesCollectionViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FavorStoryView.h"

@interface FavorStoriesCollectionViewCell : UICollectionViewCell
{
    FavorStoryView * _favorStoryView;
}

-(void)setFavorStoryCollectionViewCellWithModal:(DiscoverStoryModal *)modal;

@end
