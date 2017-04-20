//
//  TopicDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GradientTagCloudView.h"

#import "TopicDetailModal.h"

#import "TopicDetailTopTableViewCell.h"
#import "TopicDetailTextTableViewCell.h"
#import "TopicDetailTextHighlightTableViewCell.h"
#import "TopicDtailPhotoTableViewCell.h"
#import "TopicDetailItemsTableViewCell.h"
#import "TopicDetailBottomTableViewCell.h"

#import "VibeShowPhotoView.h"
#import "XLPhotoBrowser.h"


@interface TopicDetailViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource,TopicDtailPhotoTableViewCellDelegate>
{
    TopicDetailModal    * _topicDetailModal;
    
    UITableView         * _topicDetailTableView;
    
    UIView              * _sectionFooterView;
}

-(id)initWithTopicDetailModal:(TopicDetailModal *)topicDetailModal;

@end



