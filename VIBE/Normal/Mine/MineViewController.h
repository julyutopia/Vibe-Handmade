//
//  MineViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "MineProfileModal.h"
#import "HomeProductModal.h"
#import "CategoryStoreModal.h"
#import "HomeTopicModal.h"

#import "MineInfoTableViewCell.h"

#import "MineFavorProductsTopTableViewCell.h"
#import "MineFavorProductsTableViewCell.h"

#import "MineFavorStoresTopTableViewCell.h"
#import "MineFavorStoresTableViewCell.h"

#import "MineFavorTopicsTableViewCell.h"


@interface MineViewController : VibeViewController<MineInfoTableViewCellDelegate, MineFavorProductsTableViewCellDelegate, MineFavorStoresTableViewCellDelegate, MineFavorTopicsTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIImageView * _backImgView;
    UIView      * _backBlurView;

    UIView      * _headerView;
    
    UITableView * _mineTableView;

    float         _infoCellHeight;
    
    UIView  * _foorerView;
    
    MineProfileModal * _mineProfileModal;
    
    NSMutableArray * _favorProductsArray;
    NSMutableArray * _favorStoressArray;
    NSMutableArray * _favorTopicsArray;
}

@property(nonatomic, retain) UIViewController  *currentVC;

@end
