//
//  CreatorDetailTextBoldTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDetailTextBoldTableViewCell.h"

@implementation CreatorDetailTextBoldTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth, 0)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_backView];
        
        _showTextLabel = [[UILabel alloc]init];
        [_showTextLabel setTextAlignment:NSTextAlignmentLeft];
        [_showTextLabel setTextColor:Default_Text_Dark_Color_80];
        [_showTextLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:18]];
        [_showTextLabel setNumberOfLines:0];
        [_backView addSubview:_showTextLabel];
    }
    
    return self;
}


-(void)setCreatorDetailTextBoldCellWithInfo:(NSString *)detail
{
    NSString * text = detail;
    
    float textHeight = [text getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:_showTextLabel.font].height;
    
    //超过一行显示
    if (textHeight > 22)
    {
        [[VibeAppTool sharedInstance] setLabelSpace:_showTextLabel withText:text withFont:_showTextLabel.font withLineSpacing:6.0f];
        
        textHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:text withFont:_showTextLabel.font withWidth:kScreenWidth -60 -20 withLineSpacing:6.0] +2.0f;
    }
    else{
        [_showTextLabel setText:text];
    }
    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60, textHeight)];
    
    [_showTextLabel setFrame:CGRectMake(0, 0, kScreenWidth -60 -20, textHeight)];
    
}


@end
