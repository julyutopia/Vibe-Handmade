//
//  NewDiscoverTableView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTagTableViewCell.h"
#import "DiscoverTopicTableViewCell.h"
#import "DiscoverStoryTableViewCell.h"

#import "DiscoverTagModal.h"
#import "DiscoverTopicModal.h"
#import "DiscoverStoryModal.h"

@protocol NewDiscoverTableViewDelegate;

@interface NewDiscoverTableView : UITableView<UITableViewDelegate, UITableViewDataSource, DiscoverTagTableViewCellDelegate, DiscoverTopicTableViewCellDelegate, DiscoverStoryTableViewCellDelegate>
{
    UIView  * _sectionFooterView;
}

@property (weak, nonatomic) id<NewDiscoverTableViewDelegate> delegateee;

@end

//代理协议
@protocol NewDiscoverTableViewDelegate <NSObject>

-(void)discoverTableShowTagDetailWithTagModal:(DiscoverTagModal *)tagModal;

-(void)discoverTableShowTopicDetailWithTopicModal:(DiscoverTopicModal *)topicModal;

-(void)discoverTableShowStoryDetailWithStoryModal:(DiscoverStoryModal *)storyModal;

@end
