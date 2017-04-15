//
//  TopicDetailTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TopicDetailModal.h"

@interface TopicDetailTopTableViewCell : UITableViewCell
{
    float                     _photoViewHeight;
    
    UIView                  * _backView;
    
    UIImageView             * _backBlurImgView;
    UIImageView             * _photoImgView;
    
    UILabel                 * _topicTimeStampLabel;
    UILabel                 * _topicTitleLabel;
}

-(void)setTopicDetailTopCellWithModal:(TopicDetailModal *)topicModal;

@end
