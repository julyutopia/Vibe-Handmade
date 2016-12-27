//
//  TopicDetailShowTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopicDetailShowTableViewCellDelegate;

@interface TopicDetailShowTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UILabel * _detailInfoLabel;
    GLImageView * _detailImgView;
    
    UIActivityIndicatorView * _activityIndicatorView;
    
    float      _lastCellHeight;
}

@property (weak, nonatomic) id<TopicDetailShowTableViewCellDelegate> delegate;

@property(assign, nonatomic) BOOL didLoadImage;

@property(assign, nonatomic) CGFloat imageHeight;

@property(assign, nonatomic) BOOL isLastCell;

-(void)setTopicDetailShowTableCellWithInfo:(NSDictionary *)dict IsLastCell:(BOOL )isLast;

-(float)calculateImageHeight;

@end

@protocol TopicDetailShowTableViewCellDelegate <NSObject>

-(void)topicDetailInfoCellDidTapImageWithURL:(NSString *)imgURL;

@end


