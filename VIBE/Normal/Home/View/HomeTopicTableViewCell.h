//
//  HomeTopicTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeTopicTableViewCell.h"

@protocol HomeTopicTableViewCellDelegate;

@interface HomeTopicTableViewCell : UITableViewCell
{
    CGFloat             _topicImageOriginY;
    CGFloat             _topicImageWidth;
    CGFloat             _topicImageEndY;
    
    NSMutableArray      * _topicInfoArray;
    
    UIView              * _topicBackView;
    UIImageView         * _topicTopTitleImgView;
    UIView              * _topicImagesBackView;
    
    UIButton            * _showAllTopicBtn;
}

-(void)setTopicCellWithContent:(NSArray *)topicArray;

@property (weak, nonatomic) id<HomeTopicTableViewCellDelegate> delegate;

@end


@protocol HomeTopicTableViewCellDelegate <NSObject>

-(void)homeTopicCellTapIndex:(NSInteger )index;

-(void)homeTopicShowAll;

@end


