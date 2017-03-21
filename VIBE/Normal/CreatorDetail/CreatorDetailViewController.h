//
//  CreatorDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "CreatorDetailModal.h"

#import "CreatorHeaderTableViewCell.h"

@interface CreatorDetailViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView             * _creatorDetailTable;

    CreatorDetailModal      * _creatorModal;
}

@end
