//
//  ProfileViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/5/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "MineProfileModal.h"

#import "FavorTopicsTableViewCell.h"
#import "DiscoverTopicModal.h"

#import "FavorProductsCollectionView.h"
#import "FavorStoriesCollectionView.h"

@interface ProfileViewController : BasicViewController<UITableViewDelegate, UITableViewDataSource>
{
    //用户资料modal
    MineProfileModal   * _profileModal;
    
    float _topViewHeight;
    float _showFavorViewHeight;
    
    //头像
    UIImageView * _backBlurAvatarImgView;
    UIImageView * _avatarImgView;
    
    UIView      * _showTextView;
    //昵称 & 签名
    UILabel     * _userNameLabel;
    UILabel     * _signatureLabel;
    
    //显示收藏分区的View
    UIView      * _sectionView;
    
    UIButton    * _productsBtn;
    UIButton    * _topicsBtn;
    UIButton    * _storiesBtn;
    UIButton    * _shopsBtn;
    
    NSInteger     _selectedInex;
    
    UIView      * _gapLine;
    UIView      * _slideView;//绿色的滚动条
    
    
    //显示收藏内容的背景ScrollView
    UIScrollView                    * _contentScrollView;
    
    UIView                          * _favorProductsView;
    FavorProductsCollectionView     * _favorProductsCollectionView;
    
    UIView                          * _favorTopicssView;
    UITableView                     * _favorTopicsTable;

    UIView                          * _favorStoriesView;
    FavorStoriesCollectionView      * _favorStoriesCollectionView;

    UIView                          * _favorShopsView;
    UITableView                     * _favorShopsTable;
    
    //FooterView
    UIView              * _footerView;

    //保存数据的数组
    NSMutableArray      * _favorProductsArray;
    NSMutableArray      * _favorTopicsArray;
    NSMutableArray      * _favorStoriesArray;
    NSMutableArray      * _favorShopsArray;

}

@end
