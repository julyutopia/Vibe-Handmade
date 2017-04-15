//
//  ItemDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "RecommandItemModal.h"
#import "ItemDetailModal.h"

#import "ItemDetailTopTableViewCell.h"
#import "ItemDetailTitleTableViewCell.h"
#import "ItemDetailPhotoViewTableViewCell.h"
#import "ItemDetailInfoTableViewCell.h"

#import "ItemDetailGuessTitleTableViewCell.h"
#import "ItemDetailGuessTableViewCell.h"

@interface ItemDetailViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource, ItemDetailTopTableViewCellDelegate, ItemDetailGuessTableViewCellDelegate>
{
    UIView          * _sectionFooterView;

    UITableView     * _itemDetailTableView;
    
    ItemDetailModal * _itemDetailModal;
}


@property(assign, nonatomic)NSInteger itemDetailID;

@end
