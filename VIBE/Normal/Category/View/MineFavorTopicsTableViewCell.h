//
//  MineFavorTopicsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTopicModal.h"

@protocol MineFavorTopicsTableViewCellDelegate;

@interface MineFavorTopicsTableViewCell : UITableViewCell
{
    UIView * _backView;
    
    CAShapeLayer * _maskLayer;
    
    UIImageView * _titleImgView;
    
    UIScrollView              * _showTopicsScrollView;
    
    NSMutableArray      * _topicsArray;
}

@property (weak, nonatomic) id<MineFavorTopicsTableViewCellDelegate> delegate;

-(void)setTopicCellWithModals:(NSArray *)array;

@end

@protocol MineFavorTopicsTableViewCellDelegate <NSObject>

-(void)showMineFavorTopicWithIndex:(NSInteger )index;

-(void)showAllMineFavorTopics;

@end