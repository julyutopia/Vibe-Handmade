//
//  MoreSettingTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoreSettingTableViewCellDelegate;

@interface MoreSettingTableViewCell : UITableViewCell
{
    float         _singleSettingCellHeight;
    
    UIView          * _backView;
    
    CAShapeLayer    * _maskLayer;

    GLImageView     * _tapView;
    
    UIImageView     * _iconImgView;
    
    UILabel         * _settingLabel;
    
    UISwitch        * _notificationSwitch;
    UIImageView     * _arrowImgView;
    UILabel         * _cacheNumberLabel;
    
    UIButton        * _logOutBtn;
    
    UIView          * _gapLineView;
}

@property (weak, nonatomic) id<MoreSettingTableViewCellDelegate> delegate;

-(void)setMoreSettingCellWithIndex:(NSInteger )index;

@end

@protocol MoreSettingTableViewCellDelegate <NSObject>

-(void)moreSettingViewCellTapWithIndex:(NSInteger )index;

-(void)moreSettingViewCellDidLogout;

@end




