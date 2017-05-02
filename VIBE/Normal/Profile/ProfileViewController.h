//
//  ProfileViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/5/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "MineProfileModal.h"

@interface ProfileViewController : BasicViewController
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
    
    
    
}

@end
