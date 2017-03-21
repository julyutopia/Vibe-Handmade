//
//  TopicDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewProductDetailViewController.h"

#import "GradientTagCloudView.h"
#import "VibeTopicModal.h"
#import "TopicDetailShowTableViewCell.h"
#import "TopicDetailRelatedHeaderTableViewCell.h"
#import "TopicDetailRelatedProductTableViewCell.h"
#import "TopicDetailBottomTableViewCell.h"

#import "VibeShowPhotoView.h"

@interface TopicDetailViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, TopicDetailShowTableViewCellDelegate, TopicDetailRelatedProductTableViewCellDelegate>
{
    VibeTopicModal      * _topicModal;
    
    UIImageView         * _backImgView;
    
    float                 _headerViewHeight;
    float                 _headerImgViewHeight;
    float                 _headerInfoViewHeight;
    UIView              * _headerView;
    UIImageView         * _headerImgView;
    UIView              * _headerInfoView;
    GradientTagCloudView* _gradientTagView;
    
    
    UITableView         * _topicDetailTable;
}

@property(retain, nonatomic)    VibeTopicModal      * topicModal;

@end



