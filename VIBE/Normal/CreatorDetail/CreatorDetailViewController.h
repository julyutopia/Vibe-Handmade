//
//  CreatorDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "CreatorDetailModal.h"

#import "CreatorDetailTopTableViewCell.h"
#import "CreatorDetailTextTableViewCell.h"
#import "CreatorDetailTextBoldTableViewCell.h"
#import "CreatorDetailTextHighlightTableViewCell.h"
#import "CreatorDetailSinglePhotoTableViewCell.h"
#import "CreatorDetailMorePhotosTableViewCell.h"
#import "CreatorDetailItemsTableViewCell.h"
#import "CreatorDetailBottomTableViewCell.h"


@interface CreatorDetailViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource, CreatorDetailMorePhotosTableViewCellDelegate>
{
    CreatorDetailModal  * _creatorDetailModal;

    UITableView         * _creatorDetailTableView;
    
    UIView              * _sectionFooterView;
    
    float                 _bottomViewHeight;
    UIView              * _bottomView;
}

-(id)initWithCreatorDetailModal:(CreatorDetailModal *)creatorDetailModal;

@end
