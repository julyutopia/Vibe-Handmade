//
//  DiscoverAlbumTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicSmallView.h"

@interface DiscoverTopicTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    UIButton        * _showMoreBtn;
    
    NSMutableArray  * _topicsArray;
    
    UIView          * _bigAlbumView;
    
    DiscoverTopicSmallView          * _firstTopicSmallView;
    DiscoverTopicSmallView          * _secondTopicSmallView;
    DiscoverTopicSmallView          * _thirdTopicSmallView;
    
}


-(void)setDiscoverTopicCellWithInfo:(NSArray *)infoArray;

@end
