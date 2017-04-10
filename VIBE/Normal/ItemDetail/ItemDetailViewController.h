//
//  ItemDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "ItemDetailModal.h"

#import "ItemDetailTopTableViewCell.h"
#import "ItemDetailTitleTableViewCell.h"
#import "ItemDetailPhotoViewTableViewCell.h"
#import "ItemDetailInfoTableViewCell.h"

@interface ItemDetailViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource>
{
    UIView          * _sectionFooterView;

    UITableView     * _itemDetailTableView;
    
    ItemDetailModal * _itemDetailModal;
}


@property(assign, nonatomic)NSInteger itemDetailID;

@end
