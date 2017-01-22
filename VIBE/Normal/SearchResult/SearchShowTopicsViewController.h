//
//  SearchShowTopicsViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/1/22.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "SearchTopicTableViewCell.h"
#import "SearchTopicRoundHeaderTableViewCell.h"
#import "TopicDetailViewController.h"

@interface SearchShowTopicsViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, SearchTopicTableViewCellDelegate>
{
    NSMutableArray      * _topicsArray;
    UITableView         * _resultsTableView;
    
    UIView              * _sectionFooterView;
}

@property(retain, nonatomic)NSString * searchKeyword;

@end
