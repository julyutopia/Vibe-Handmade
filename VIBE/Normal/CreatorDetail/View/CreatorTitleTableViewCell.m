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

        
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:RGBA(255, 255, 255, 100)];
        [self addSubview:_backView];
        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:16]];
        [_titleLabel setTextColor:DefaultQYTextColor80];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setNumberOfLines:0];
        [_backView addSubview:_titleLabel];
        
        
        _showInfoView = [[UIView alloc]init];
        [_showInfoView setBackgroundColor:[UIColor clearColor]];
        [_backView addSubview:_showInfoView];
        
        
        _shopImgView = [[UIImageView alloc]init];
        [_shopImgView setImage:[UIImage imageNamed:@"Creator_Top_Shop"]];
        [_showInfoView addSubview:_shopImgView];
        
        
        _shopLabel = [[UILabel alloc]init];
        [_shopLabel setTextAlignment:NSTextAlignmentLeft];
        [_shopLabel setTextColor:RGBA(174, 176, 182, 100)];
        [_shopLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:13]];
        [_showInfoView addSubview:_shopLabel];
        
        
        _favorCountImgView = [[UIImageView alloc]init];
        [_favorCountImgView setImage:[UIImage imageNamed:@"Creator_Detail_Like"]];
        [_showInfoView addSubview:_favorCountImgView];
        
        
        _favorCountLabel = [[UILabel alloc]init];
        [_favorCountLabel setTextAlignment:NSTextAlignmentRight];
        [_favorCountLabel setTextColor:RGBA(174, 176, 182, 100)];
        [_favorCountLabel setFont:[VibeFont fontWithName:Default_Number_Font size:13]];
        [_showInfoView addSubview:_favorCountLabel];

        
        _seprateLineView = [[UIView alloc]init];
        [_seprateLineView setBackgroundColor:RGBA(250, 247, 247, 100)];
        [_backView addSubview:_seprateLineView];
        
    }
    
    
    return self;
}


-(void)setCreatorDetailTitleCellWithModal:(CreatorDetailModal *)modal
{
    NSString * detailTitle = modal.creatorTitle;
    NSString * shopName = modal.creatorShopName;
    NSString * favoredCount = [NSString stringWithFormat:@"%@",modal.creatorFavorNumber];
    
    float titleHeight = [detailTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 200) withFont:_titleLabel.font].height +1;
    
    float showInfoViewHeight = 15;
    
    [_backView setFrame:CGRectMake(0, 0, kScreenWidth, 20 +titleHeight +15 +showInfoViewHeight +20 +20)];
    
    [_seprateLineView setFrame:CGRectMake(15, _backView.frame.size.height -20 -2, kScreenWidth -30, 2)];
    [_seprateLineView.layer setCornerRadius:1.0f];
    
    [_titleLabel setFrame:CGRectMake(15 , 20, kScreenWidth -30, titleHeight)];
    [_titleLabel setText:detailTitle];

    
    [_showInfoView setFrame:CGRectMake(15, 20 +titleHeight +15, kScreenWidth -30, showInfoViewHeight)];
    
    
    
    float shopImgViewWidth = 13;
    float shopImgViewHeight = 11;
    
    [_shopImgView setFrame:CGRectMake(0, (showInfoViewHeight -shopImgViewHeight)/2, shopImgViewWidth, shopImgViewHeight)];
    
//    float shopHeight = [shopName getSizeWithLimitSize:CGSizeMake(200, 20) withFont:_shopLabel.font].height;
    [_shopLabel setFrame:CGRectMake(shopImgViewWidth +3, 0, 200, showInfoViewHeight)];
    [_shopLabel setText:shopName];

    
    float favorCountHeight = [favoredCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorCountLabel.font].height;
    float favorCountWidth  = [favoredCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorCountLabel.font].width;

    
    [_favorCountLabel setFrame:CGRectMake(kScreenWidth -30 -favorCountWidth, 0, favorCountWidth, favorCountHeight)];
    [_favorCountLabel setText:favoredCount];
    
    float favorImgViewWidth = 12;
    float favorImgViewHeight = 10;

    [_favorCountImgView setFrame:CGRectMake(kScreenWidth -30 -favorCountWidth -5 -favorImgViewWidth, (showInfoViewHeight -favorImgViewHeight)/2, favorImgViewWidth, favorImgViewHeight)];
    
}



@end



