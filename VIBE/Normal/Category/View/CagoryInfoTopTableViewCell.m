//
//  CagoryInfoTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CagoryInfoTopTableViewCell.h"

@implementation CagoryInfoTopTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        float widthhh = 94;
        float heightt = 19;
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        _backView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, 15 +heightt +15)];
        [_backView setAlpha:0.3];
    
        
        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        
        [self addSubview:_backView];
        
//        UIBlurEffect *ceffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

//        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(15, 15 +heightt +10, kScreenWidth -30, 5)];
//        [_bottomView setAlpha:0.5];
//        [_bottomView setBackgroundColor:[UIColor whiteColor]];
//        [self addSubview:_bottomView];
        
        
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -widthhh)/2, 15, widthhh, heightt)];
        [_iconImgView setImage:[UIImage imageNamed:@"Category_Top_Icon"]];
        [self addSubview:_iconImgView];
    }
    
    return self;
}


@end
