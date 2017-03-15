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

#import "LUNSegmentedControl.h"

#import "MineFavorProductTableViewCell.h"
#import "MineFavorTopicTableViewCell.h"

#import "NewProductDetailViewController.h"
#import "TopicDetailViewController.h"

#import "MoreSettingView.h"

#import "FeedBackViewController.h"

@interface MineViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource, LUNSegmentedControlDataSource, LUNSegmentedControlDelegate, MineFavorProductTableViewCellDelegate, MineFavorTopicTableViewCellDelegate, MoreSettingViewDelegate>
{
    MineProfileModal    * _userProfileModal;
    
    UIImageView         * _backImgView;
    
    //显示元素的背景View
    UIView              * _contentBackView;
    
    float                 _headerViewHeight;
    
    UIView              * _headerBackView;
    UIView              * _tableBackView;
    
    GLImageView         * _avatarImgView;
    UILabel             * _userNameLabel;
    UILabel             * _signatureLabel;
    
    LUNSegmentedControl * _headerSegmentControl;
    
    //sengment显示的View
    UIView              * _favorProductViewNormal;
    
    UIImageView         * _favorProductNormal;
    UIImageView         * _favorProductSelected;
    UIImageView         * _favorTopicNormal;
    UIImageView         * _favorTopicSelected;
    
    //左右滑动的scrollView
    UIScrollView        * _profileScrollView;
    
    //收藏商品table
    UIView              * _favorProductsBackView;
    UITableView         * _favorProductsTableView;
    //收藏专题table
    UIView              * _favorTopicsBackView;
    UITableView         * _favorTopicsTableView;
    
    
    NSMutableArray      * _favorProductsArray;
    NSMutableArray      * _favorTopicsArray;
    
    //显示更多设置的View
    MoreSettingView     * _moreSettingView;
}

@property(nonatomic, retain) UIViewController  *currentVC;

@end
