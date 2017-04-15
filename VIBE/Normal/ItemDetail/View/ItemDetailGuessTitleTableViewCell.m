//
//  ItemDetailGuessTitleTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/12.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailGuessTitleTableViewCell.h"

@implementation ItemDetailGuessTitleTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Dark_Color_90];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]];
        [self.contentView addSubview:_titleLabel];
        
        NSString * title = @"猜你喜欢";
        
        float titleHeight = [title getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_titleLabel.font].height;
        [_titleLabel setFrame:CGRectMake(60, 0, 100, titleHeight)];
        [_titleLabel setText:title];
    }
    
    return self;
}




@end
