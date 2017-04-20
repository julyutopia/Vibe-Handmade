//
//  TopicDtailPhotoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopicDtailPhotoTableViewCellDelegate;

@interface TopicDtailPhotoTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;
    
    NSMutableArray  * _morePhotosArray;

}

@property (weak, nonatomic) id<TopicDtailPhotoTableViewCellDelegate> delegate;

-(void)setTopicDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end

@protocol TopicDtailPhotoTableViewCellDelegate <NSObject>

-(void)topicDtailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger )index;

@end
