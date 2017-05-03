//
//  FavorStoriesCollectionViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FavorStoriesCollectionViewCell.h"

@implementation FavorStoriesCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        float storyViewWidth = (kScreenWidth -60 -20 -20)/2;
        float storyViewHeight = storyViewWidth +30;
        
        _favorStoryView = [[FavorStoryView alloc]initWithFrame:CGRectMake(0, 0, storyViewWidth, storyViewHeight)];
        [self.contentView addSubview:_favorStoryView];
    }
    
    return self;
}

-(void)setFavorStoryCollectionViewCellWithModal:(DiscoverStoryModal *)modal
{
    [_favorStoryView setFavorStoryViewWithModal:modal];
}


@end
