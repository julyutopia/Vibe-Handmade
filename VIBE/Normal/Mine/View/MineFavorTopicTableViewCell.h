//
//  MineFavorTopicTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/2/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandTopicView.h"

@protocol MineFavorTopicTableViewCellDelegate;

@interface MineFavorTopicTableViewCell : UITableViewCell
{
    NSInteger   _topicIndex;
    
    float   _contentHeight;
    UIView * _backView;
    RecommandTopicView * _topicView;
}

@property (weak, nonatomic) id<MineFavorTopicTableViewCellDelegate> delegate;

-(void)setMineFavorTopicCellModal:(VibeTopicModal *)modal WithIndex:(NSInteger )index IsLast:(BOOL )isLast;

@end

@protocol MineFavorTopicTableViewCellDelegate <NSObject>

-(void)mineFavorTopicCellClickWithIndex:(NSInteger )index;

@end
