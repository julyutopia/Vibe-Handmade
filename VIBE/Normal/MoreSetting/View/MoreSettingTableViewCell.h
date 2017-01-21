//
//  MoreSettingTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreSettingTableViewCell : UITableViewCell
{
    float         _singleSettingCellHeight;

    GLImageView     * _backView;
    CAShapeLayer    * _maskLayer;
    
    UIImageView     * _iconImgView;
    
    UILabel         * _settingLabel;
    
    UISwitch        * _notificationSwitch;
    UIImageView     * _arrowImgView;
    UILabel         * _cacheNumberLabel;
    
    UIView          * _gapLineView;
}

-(void)setMoreSettingCellWithIndex:(NSInteger )index;

@end
