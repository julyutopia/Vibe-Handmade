//
//  ItemDetailInfoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailInfoTableViewCell.h"

@implementation ItemDetailInfoTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_backView];
        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Dark_Color_90];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]];
        [_backView addSubview:_titleLabel];
        
        _infoDetailLabel = [[UILabel alloc]init];
        [_infoDetailLabel setTextAlignment:NSTextAlignmentLeft];
        [_infoDetailLabel setTextColor:Default_Text_Gray_Color];
        [_infoDetailLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_infoDetailLabel setNumberOfLines:0];
        [_backView addSubview:_infoDetailLabel];
    }
    
    return self;
}

-(void)setItemDetailInfoCellWithModal:(ItemDetailModal *)modal
{
    NSString * title = @"详细描述";
    
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 20) withFont:_titleLabel.font].height;
    [_titleLabel setFrame:CGRectMake(0, 0, 100, titleHeight)];
    [_titleLabel setText:title];
    
    NSString * info = modal.itemDetailInfo;
    
    float infoHeight = [info getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:_infoDetailLabel.font].height;
    
    //如果超过一行显示
    if (infoHeight >20) {
        
        [[VibeAppTool sharedInstance] setLabelSpace:_infoDetailLabel withText:info withFont:_infoDetailLabel.font withLineSpacing:3.0f];

        infoHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:info withFont:_infoDetailLabel.font withWidth:kScreenWidth -60 -20 withLineSpacing:3.0] +2.0f;
        
        [_infoDetailLabel setFrame:CGRectMake(0, titleHeight +20, kScreenWidth -60 -20, infoHeight)];
    }
    else{
        
        [_infoDetailLabel setFrame:CGRectMake(0, titleHeight +20, kScreenWidth -60 -20, infoHeight)];
        [_infoDetailLabel setText:info];
    }
    
    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60 -20, titleHeight +20 +infoHeight)];
    
}


@end
