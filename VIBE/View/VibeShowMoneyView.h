//
//  VibeShowMoneyView.h
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VibeShowMoneyView : UIView
{
    UIView  * _backView;

    UILabel * _moneyLabel;
    UILabel * _priceLabel;
}

@property(retain,nonatomic)UILabel * moneyLabel;
@property(retain,nonatomic)UILabel * priceLabel;

@property(assign, nonatomic)BOOL isShowMoneyMiddle;

-(CGSize )setMoneyViewWithMoneyFont:(UIFont *)moneyFont GapWidth:(float)gapWidth PriceFont:(UIFont *)priceFont Price:(NSString *)priceString TextColor:(UIColor *)textColor;

-(void)setMoneyTextColor:(UIColor *)moneyColor PriceColor:(UIColor *)priceColor;

@end
