//
//  ProductDetailGuessHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/11/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailGuessHeaderTableViewCell.h"

@implementation ProductDetailGuessHeaderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, 15 +15 +16 +10)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(10, 15, kScreenWidth -40, 15 +16 +10)];
        [_headerView setBackgroundColor:RGBA(245, 245, 245, 90)];
        [_backView addSubview:_headerView];
        
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headerView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _headerView.bounds;
        maskLayer.path = maskPath.CGPath;
        _headerView.layer.mask = maskLayer;
        
        _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -40 -93)/2 ,15, 93, 16)];
        [_headerImgView setImage:[UIImage imageNamed:@"Detail_Guess_Header"]];
        [_headerView addSubview:_headerImgView];
    }
    
    return self;
}

@end
