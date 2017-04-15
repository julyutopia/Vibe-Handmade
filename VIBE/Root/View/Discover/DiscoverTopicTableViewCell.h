//
//  DiscoverAlbumTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicBigView.h"
#import "DiscoverTopicSmallView.h"

@protocol DiscoverTopicTableViewCellDelegate;

@interface DiscoverTopicTableViewCell : UITableViewCell<DiscoverTopicBigViewDelegate, DiscoverTopicSmallViewDelegate>
{
    UILabel         * _titleLabel;
    UIButton        * _showMoreBtn;
    
    NSMutableArray  * _topicsArray;
    
    DiscoverTopicBigView            * _bigAlbumView;
    
    DiscoverTopicSmallView          * _firstTopicSmallView;
    DiscoverTopicSmallView          * _secondTopicSmallView;
    DiscoverTopicSmallView          * _thirdTopicSmallView;
    
}

@property (weak, nonatomic) id<DiscoverTopicTableViewCellDelegate> delegate;

-(void)setDiscoverTopicCellWithInfo:(NSArray *)infoArray;

@end

//代理协议
@protocol DiscoverTopicTableViewCellDelegate <NSObject>

-(void)discoverTopicCellClickWithIndex:(NSInteger )index;

@end

