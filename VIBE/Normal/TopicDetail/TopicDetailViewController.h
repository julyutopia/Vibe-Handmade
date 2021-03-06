//
//  TopicDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GradientTagCloudView.h"
#import "VibeTopicModal.h"
#import "TopicDetailShowTableViewCell.h"
#import "TopicDetailRelatedHeaderTableViewCell.h"
#import "TopicDetailRelatedProductTableViewCell.h"
#import "TopicDetailBottomTableViewCell.h"

#import "VibeShowPhotoView.h"

@interface TopicDetailViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, TopicDetailShowTableViewCellDelegate>
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

    UIView              * _naviView;
    UIView              * _blackBackBtnView;
    
    UIButton            * _favorBtn;
    UIView              * _favorBtnView;
    
    
    UITableView         * _topicDetailTable;
}

@property(retain, nonatomic)    VibeTopicModal      * topicModal;

@end



