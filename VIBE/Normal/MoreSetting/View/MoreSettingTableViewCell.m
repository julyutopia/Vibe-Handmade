//
//  MoreSettingTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/1/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "MoreSettingTableViewCell.h"

@implementation MoreSettingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        if (iPhone4) {
            _singleSettingCellHeight = 40;
        }
        if (iPhone5) {
            _singleSettingCellHeight = 45;
        }
        if (iPhone6) {
            _singleSettingCellHeight = 52;
        }
        if (iPhone6plus) {
            _singleSettingCellHeight = 60;
        }
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth -20 *2, _singleSettingCellHeight)];
        [_backView setBackgroundColor:RGBA(255, 255, 255, 100)];
        [self addSubview:_backView];
        
        float iconWidth = 15;
        
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, (_singleSettingCellHeight -iconWidth)/2, iconWidth, iconWidth)];
        [_iconImgView setBackgroundColor:[UIColor blueColor]];
        [_backView addSubview:_iconImgView];
        
        
        _settingLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 +iconWidth +7, 0, 120, _singleSettingCellHeight)];
        [_settingLabel setBackgroundColor:[UIColor clearColor]];
        [_settingLabel setTextAlignment:NSTextAlignmentLeft];
        [_settingLabel setTextColor:DefaultQYTextColor70];
        [_settingLabel setFont:[VibeFont fontWithName:Default_Font size:13]];
        [_backView addSubview:_settingLabel];
        
        
        _gapLineView = [[UIView alloc]initWithFrame:CGRectMake(15, _singleSettingCellHeight -1, _backView.frame.size.width -30, 1)];
        [_gapLineView setBackgroundColor:RGBA(250, 250, 250, 100)];
        [_backView addSubview:_gapLineView];
        
//        UIImageView     * _iconImgView;
//        UILabel         * _settingLabel;
//        
//        UISwitch        * notificationSwitch;
//        UIImageView     * _arrowImgView;
//        UILabel         * _cacheNumberLabel;

    }
    
    return self;
}

-(void)setMoreSettingCellWithIndex:(NSInteger )index
{
    
    switch (index) {
        case 0:
            if (!_maskLayer) {
                _maskLayer =[[CAShapeLayer alloc] init];
                UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
                _maskLayer.frame = _backView.bounds;
                _maskLayer.path = maskPath.CGPath;
                _backView.layer.mask = _maskLayer;
            }
            
            [_settingLabel setText:@"消息推送"];
            
            break;
            
        case 1:
            
            [_settingLabel setText:@"意见反馈"];

            
            break;
            
        case 2:
            
            [_settingLabel setText:@"清理缓存"];

            
            break;
            
        case 3:
            
            [_settingLabel setText:@"前往AppStore评分"];
            
            break;
            
        case 4:
            
            [_settingLabel setText:@"关于VIBE"];

            break;
            
        case 5:
            
            [_settingLabel setText:@"分享应用"];

            break;
            
        case 6:
            
            [_settingLabel setText:@"VIBE公众号"];

            break;
            
        case 7:
            
            if (!_maskLayer) {
                _maskLayer =[[CAShapeLayer alloc] init];
                UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
                _maskLayer.frame = _backView.bounds;
                _maskLayer.path = maskPath.CGPath;
                _backView.layer.mask = _maskLayer;
            }
    
            break;
            
        default:
            break;
    }
    

    
  
}

@end


