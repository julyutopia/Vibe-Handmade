//
//  StoryDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "StoryDetailModal.h"

#import "StoryDetailTopTableViewCell.h"
#import "StoryDetailTextTableViewCell.h"
#import "StoryDetailTextHighlightTableViewCell.h"
#import "StoryDetailPhotoTableViewCell.h"
#import "StoryDetailBottomTableViewCell.h"

@interface StoryDetailViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource>
{
    StoryDetailModal    * _storyDetailModal;

    UITableView         * _storyDetailTableView;
    
    UIView              * _sectionFooterView;
}


-(id)initWithStoryDetailModal:(StoryDetailModal *)storyDetailModal;


@end
