//
//  CreatorTitleTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorTitleTableViewCell.h"

@implementation CreatorTitleTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        UILabel         * _titleLabel;//专题名
//        UIImageView     * _shopImgView;
//        UILabel         * _shopLabel;//店铺名字
//        UIImageView     * _favorCountImgView;//喜欢数
//        UILabel         * _favorCountLabel;
//        UIView          * _seprateLineView;//分隔线

        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setBackgroundColor:[UIColor redColor]];
        [_titleLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:15]];
        [_titleLabel setTextColor:DefaultQYTextColor80];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setNumberOfLines:0];
        [self addSubview:_titleLabel];
        
    }
    
    return self;
}


-(void)setCreatorDetailTitleCellWithModal:(CreatorDetailModal *)modal
{
    NSString * detailTitle = modal.creatorTitle;
    NSString * shopName = modal.creatorShopName;
    
    NSString * favoredCount = [NSString stringWithFormat:@"%@",modal.creatorFavorNumber];
    
    
    float titleHeight = [detailTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:_titleLabel.font].height;
    [_titleLabel setFrame:CGRectMake(15 , 20, kScreenWidth -30, titleHeight)];
    [_titleLabel setText:detailTitle];
    
}


@end
