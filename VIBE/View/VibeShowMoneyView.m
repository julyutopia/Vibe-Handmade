//
//  VibeShowMoneyView.m
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeShowMoneyView.h"

@implementation VibeShowMoneyView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                
        self.userInteractionEnabled = YES;
        
        _backView = [[UIView alloc]initWithFrame:frame];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_backView];
        
        _moneyLabel = [[UILabel alloc]init];
        [_moneyLabel setTextAlignment:NSTextAlignmentLeft];
        [_moneyLabel setText:@"￥"];
        [_backView addSubview:_moneyLabel];
        
        _priceLabel = [[UILabel alloc]init];
        [_priceLabel setTextAlignment:NSTextAlignmentLeft];
        [_backView addSubview:_priceLabel];
    }
    
    return self;
}


-(CGSize )setMoneyViewWithMoneyFont:(UIFont *)moneyFont GapWidth:(float)gapWidth PriceFont:(UIFont *)priceFont Price:(NSString *)priceString TextColor:(UIColor *)textColor
{
    [_moneyLabel setFont:moneyFont];
    [_priceLabel setFont:priceFont];
    
    [_moneyLabel setTextColor:textColor];
    [_priceLabel setTextColor:textColor];
    
    NSString * moneyString = _moneyLabel.text;
    
    CGSize moneySize = [moneyString getSizeWithLimitSize:CGSizeMake(20, 20) withFont:moneyFont];
    CGSize priceSize = [priceString getSizeWithLimitSize:CGSizeMake(200, 20) withFont:priceFont];
    [_backView setFrame:CGRectMake(0, 0, moneySize.width +gapWidth +priceSize.width, priceSize.height)];

    //居中显示
    if (self.isShowMoneyMiddle == YES) {
        [_moneyLabel setFrame:CGRectMake(0, 1, moneySize.width, _backView.frame.size.height)];
        [_priceLabel setFrame:CGRectMake(moneySize.width +gapWidth, 0, priceSize.width, _backView.frame.size.height)];
    }
    //底部
    else{
        [_moneyLabel setFrame:CGRectMake(0, _backView.frame.size.height -moneySize.height, moneySize.width, moneySize.height)];
        [_priceLabel setFrame:CGRectMake(moneySize.width +gapWidth, _backView.frame.size.height -priceSize.height, priceSize.width, priceSize.height)];
    }
  
    [_priceLabel setText:priceString];
    
    
    return CGSizeMake(moneySize.width +gapWidth +priceSize.width, priceSize.height +1);
}


@end
