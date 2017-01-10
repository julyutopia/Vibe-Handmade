//
//  SearchTopicTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandTopicView.h"

@protocol SearchTopicTableViewCellDelegate;

@interface SearchTopicTableViewCell : UITableViewCell
{
    NSInteger   _topicID;
    
    float   _contentHeight;

    UIView * _backView;

    CAShapeLayer        * _maskLayer;

    RecommandTopicView * _topicView;
}

@property (weak, nonatomic) id<SearchTopicTableViewCellDelegate> delegate;

-(void)setSearchTopicCellWithModal:(VibeTopicModal *)modal IsLast:(BOOL )isLast;

@end

@protocol SearchTopicTableViewCellDelegate <NSObject>

-(void)searchTopicCellClickWithTopicID:(NSInteger )topicID;

@end
