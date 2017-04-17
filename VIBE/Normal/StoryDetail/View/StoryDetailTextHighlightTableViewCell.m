//
//  StoryDetailTextHighlightTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "StoryDetailTextHighlightTableViewCell.h"

@implementation StoryDetailTextHighlightTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth, 0)];
        [self.contentView addSubview:_backView];
        
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 19, 13)];
        [_iconImgView setImage:[UIImage imageNamed:@"Topic_Highlight_Icon"]];
        [_backView addSubview:_iconImgView];
        
        _highlightTextLabel = [[UILabel alloc]init];
        [_highlightTextLabel setTextAlignment:NSTextAlignmentLeft];
        [_highlightTextLabel setTextColor:DefaultGreen];
        [_highlightTextLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:17]];
        [_highlightTextLabel setNumberOfLines:0];
        [_backView addSubview:_highlightTextLabel];
        
    }
    
    return self;
}

-(void)setStoryDetailTextHighlightCellWithInfo:(NSString *)detail
{
    float hightlightTextWidth = kScreenWidth -60 -28 -40;
    
    NSString * hightlightText = detail;
    
    float hightlightTextHeight = [hightlightText getSizeWithLimitSize:CGSizeMake(hightlightTextWidth, 500) withFont:_highlightTextLabel.font].height;
    
    if (hightlightTextHeight >20) {
        
        [[VibeAppTool sharedInstance] setLabelSpace:_highlightTextLabel withText:hightlightText withFont:_highlightTextLabel.font withLineSpacing:4.0f];
        
        hightlightTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:hightlightText withFont:_highlightTextLabel.font withWidth:hightlightTextWidth withLineSpacing:4.0] +2.0;
    }
    else{
        
        [_highlightTextLabel setText:hightlightText];
    }
    
    [_highlightTextLabel setFrame:CGRectMake(28, 6, hightlightTextWidth, hightlightTextHeight)];
    
    [_backView setFrame:CGRectMake(60, 0, kScreenWidth -60, 6 +hightlightTextHeight)];
}


@end


