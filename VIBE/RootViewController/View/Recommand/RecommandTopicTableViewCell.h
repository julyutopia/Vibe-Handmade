//
//  RecommandTopicTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandTopicView.h"
#import "VibeTopicModal.h"

@protocol RecommandTopicTableViewCellDelegate;

@interface RecommandTopicTableViewCell : UITableViewCell
{
    NSInteger   _topicID;
    
    float   _contentHeight;
    UIView * _backView;
    RecommandTopicView * _topicView;
}

@property (weak, nonatomic) id<RecommandTopicTableViewCellDelegate> delegate;

-(void)setRecommandTopicCellWithModal:(VibeTopicModal *)modal;

@end

@protocol RecommandTopicTableViewCellDelegate <NSObject>

-(void)recommandTopicCellClickWithIndex:(NSInteger )index;

@end



