//
//  MineViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "MineProfileModal.h"

#import "VibeProductModal.h"
#import "VibeTopicModal.h"

@interface MineViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    MineProfileModal    * _userProfileModal;
    
    UIImageView         * _backImgView;

    float                 _headerViewHeight;
    
    UIView              * _headerBackView;
    UIView              * _tableBackView;
    
    GLImageView         * _avatarImgView;
    UILabel             * _userNameLabel;
    UILabel             * _signatureLabel;
    
    //个人主页table
    UITableView         * _profileTableView;
    
    NSMutableArray      * _favorProductsArray;
    NSMutableArray      * _favorTopicsArray;
}

@property(nonatomic, retain) UIViewController  *currentVC;

@end
