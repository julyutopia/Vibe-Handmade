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
        [_iconImgView setBackgroundColor:[UIColor clearColor]];
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
        
        
        _notificationSwitch = [[UISwitch alloc]init];
        float switchWidth = _notificationSwitch.frame.size.width;
        float switchHeight = _notificationSwitch.frame.size.height;
        [_notificationSwitch setFrame:CGRectMake(_backView.frame.size.width -switchWidth -15, (_singleSettingCellHeight -switchHeight)/2, switchWidth, switchHeight)];
        [_notificationSwitch setOn:YES];
        [_notificationSwitch setHidden:YES];
        [_backView addSubview:_notificationSwitch];
        
        
        _arrowImgView = [[UIImageView alloc]initWithFrame:CGRectMake(_backView.frame.size.width -12 -15, (_singleSettingCellHeight -12)/2, 12, 12)];
        [_arrowImgView setImage:[UIImage imageNamed:@"Arrow_Right_Black"]];
        [_arrowImgView setHidden:YES];
        [_backView addSubview:_arrowImgView];
        

        _cacheNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(_backView.frame.size.width -100 -15, 0, 100, _singleSettingCellHeight)];
        [_cacheNumberLabel setTextAlignment:NSTextAlignmentRight];
        [_cacheNumberLabel setTextColor:DefaultQYTextColor50];
        [_cacheNumberLabel setFont:[VibeFont fontWithName:Default_Font_Small size:12]];
        [_cacheNumberLabel setHidden:YES];
        [_backView addSubview:_cacheNumberLabel];
        
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
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Clock"]];
            [_settingLabel setText:@"消息推送"];
            [_notificationSwitch setHidden:NO];
            
            
            break;
            
        case 1:
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Message"]];
            [_settingLabel setText:@"意见反馈"];
            [_arrowImgView setHidden:NO];
            
            break;
            
        case 2:
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Clean"]];
            [_settingLabel setText:@"清理缓存"];

            [_cacheNumberLabel setHidden:NO];
            [_cacheNumberLabel setText:[self getCacheDataContent]];
            
            break;
            
        case 3:
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Rate"]];

            [_settingLabel setText:@"前往AppStore评分"];
            [_arrowImgView setHidden:NO];

            break;
            
        case 4:
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Light"]];

            [_settingLabel setText:@"关于VIBE"];
            [_arrowImgView setHidden:NO];

            break;
            
        case 5:
            
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Share"]];

            [_settingLabel setText:@"分享应用"];
            [_arrowImgView setHidden:NO];

            break;
            
        case 6:
            
            //未登录，则此cell为最后一条
            if (![VibeAppTool isUserLogIn]) {
                if (!_maskLayer) {
                    _maskLayer =[[CAShapeLayer alloc] init];
                    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
                    _maskLayer.frame = _backView.bounds;
                    _maskLayer.path = maskPath.CGPath;
                    _backView.layer.mask = _maskLayer;
                }
            }
            [_iconImgView setImage:[UIImage imageNamed:@"Setting_Flag"]];
            [_settingLabel setText:@"VIBE公众号"];
            [_arrowImgView setHidden:NO];
            
            break;
            
        case 7:
            
            //已登录，则此cell为最后一条
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



-(NSString *)getCacheDataContent
{
    int cacheSize = (int)[[SDImageCache sharedImageCache] getSize];

    int kb = 1024;
    int mb = kb * 1024;
    
    double sizeeeee = (double)cacheSize/mb;
    
    NSString * sizeString = [NSString stringWithFormat:@"%f",sizeeeee];
    if (sizeString.length >5) {
        sizeString = [sizeString substringToIndex:4];
    }
    sizeString = [NSString stringWithFormat:@"%@ MB",sizeString];
    
    return sizeString;
}


@end


