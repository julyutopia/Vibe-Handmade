//
//  CategoryBottomTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryBottomTableViewCell.h"

@implementation CategoryBottomTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float widthhh = 75;
        float heightt = 14;
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _backView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backView setAlpha:0.3];
        [_backView setFrame:CGRectMake( 15, 0, kScreenWidth -30, 15 +heightt +10)];
        
        
        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        
        [self addSubview:_backView];
        
        _iconImgView = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -widthhh)/2, 15, widthhh, heightt)];
        [_iconImgView setBackgroundImage:[UIImage imageNamed:@"Category_All"] forState:UIControlStateNormal];
        [_iconImgView addTarget:self action:@selector(showAllCategory) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_iconImgView];
    }
    
    return self;
}


-(void)showAllCategory
{
    if ([_delegate respondsToSelector:@selector(categoryCellShowAll)]) {
        [_delegate categoryCellShowAll];
    }
}


@end



