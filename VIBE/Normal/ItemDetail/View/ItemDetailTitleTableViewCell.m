//
//  ItemDetailTitleTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailTitleTableViewCell.h"

@implementation ItemDetailTitleTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

        _itemTitleLabel = [[UILabel alloc]init];
        [_itemTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemTitleLabel setTextColor:Default_Text_Dark_Color_90];
        [_itemTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:18]];
        [self.contentView addSubview:_itemTitleLabel];
        
        
        _moneyLabel = [[UILabel alloc]init];
        [_moneyLabel setTextAlignment:NSTextAlignmentLeft];
        [_moneyLabel setTextColor:DefaultGreen];
        [_moneyLabel setFont:[VibeFont fontWithName:Font_English_Bold size:15]];
        [self.contentView addSubview:_moneyLabel];

        
        _itemPriceLabel = [[UILabel alloc]init];
        [_itemPriceLabel setTextAlignment:NSTextAlignmentLeft];
        [_itemPriceLabel setTextColor:DefaultGreen];
        [_itemPriceLabel setFont:[VibeFont fontWithName:Font_English_Bold size:18]];
        [self.contentView addSubview:_itemPriceLabel];
    }
    
    return self;
}


-(void)setDetailTitleCellWithModal:(ItemDetailModal *)modal
{
    float titleLabelHeight = [modal.itemTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 30) withFont:_itemTitleLabel.font].height +1.0f;
   
    NSString * money = @"￥";
    float moneyLabelWidth = [money getSizeWithLimitSize:CGSizeMake(30, 30) withFont:_moneyLabel.font].width;
    float moneyLabelHeight = [money getSizeWithLimitSize:CGSizeMake(30, 30) withFont:_moneyLabel.font].height;
    
    float priceLabelHeight = [modal.itemPrice getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 30) withFont:_itemPriceLabel.font].height;
    
    [_itemTitleLabel setFrame:CGRectMake(60, 0, kScreenWidth -60 -40, titleLabelHeight)];
    [_itemTitleLabel setText:modal.itemTitle];
    
    [_moneyLabel setFrame:CGRectMake(60, titleLabelHeight +8 +(priceLabelHeight -moneyLabelHeight)/2, moneyLabelWidth, moneyLabelHeight)];
    [_moneyLabel setText:money];
    
    [_itemPriceLabel setFrame:CGRectMake(60 +moneyLabelWidth +4, titleLabelHeight +8, kScreenWidth -60 -40, priceLabelHeight)];
    [_itemPriceLabel setText:[NSString stringWithFormat:@"%@",modal.itemPrice]];
}


@end




