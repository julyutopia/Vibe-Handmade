//
//  ProductDetailInfoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/11/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailInfoTableViewCell.h"

@implementation ProductDetailInfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _priceLabelHeight =0;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25 +10 +14 +15)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
//        _showmoneyView = [[VibeShowMoneyView alloc]init];
//        _showmoneyView.isShowMoneyMiddle = YES;
//        [_showmoneyView.moneyLabel.layer setShadowColor:RGBA(122, 122, 122,40).CGColor];
//        [_showmoneyView.moneyLabel.layer setShadowOffset:CGSizeMake(0, 1)];
//        [_showmoneyView.moneyLabel.layer setShadowRadius:8.0f];
//        [_showmoneyView.moneyLabel.layer setShadowOpacity:0.8f];
//        
//        [_showmoneyView.priceLabel.layer setShadowColor:RGBA(122, 122, 122,40).CGColor];
//        [_showmoneyView.priceLabel.layer setShadowOffset:CGSizeMake(0, 1)];
//        [_showmoneyView.priceLabel.layer setShadowRadius:8.0f];
//        [_showmoneyView.priceLabel.layer setShadowOpacity:0.8f];
//        
//        [_backView addSubview:_showmoneyView];
        
        _gradientTagView = [[GradientTagCloudView alloc]init];
        [_backView addSubview:_gradientTagView];
        
        _infoImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -345)/2, 20 +15, 345, 14)];
        [_infoImgView setImage:[UIImage imageNamed:@"Detail_Detail"]];
        [_backView addSubview:_infoImgView];
    }
    
    return self;
}


-(void)setInfoCellWithPrice:(NSString *)price AndTags:(NSArray *)tagsArray
{
    
//     CGSize showMoneySize = [_showmoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:Default_Money_Font size:17] GapWidth:2 PriceFont:[VibeFont fontWithName:Default_Price_Font size:23] Price:price TextColor:DefaultGreen];
//    [_showmoneyView setFrame:CGRectMake(15, -2, showMoneySize.width, showMoneySize.height)];
    
//    float tagViewWidth = kScreenWidth -30 - showMoneySize.width -10;
    
    float totalWidth = 4;
    for (int i=0; i <tagsArray.count; i ++) {
        
        NSString * tagString = [tagsArray objectAtIndex:i];
        float width = [tagString getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 20) withFont:[UIFont fontWithName:Default_Font_Middle size:11]].width;
        totalWidth = totalWidth +4 +width +4 +8;
    }
    
    [_gradientTagView setFrame:CGRectMake(15, 4, totalWidth, 18)];
    [_gradientTagView setGradientTagCloudWithMaxWidth:totalWidth MaxHeight:18 WithFont:[UIFont fontWithName:Default_Font_Middle size:11] AndTags:tagsArray];
}


@end
