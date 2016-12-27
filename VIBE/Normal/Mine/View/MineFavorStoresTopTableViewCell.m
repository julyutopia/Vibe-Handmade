//
//  MineFavorStoresTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/16.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineFavorStoresTopTableViewCell.h"

@implementation MineFavorStoresTopTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float widthhh = 73;
        float heightt = 15;
        
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, heightt +25)];
        [_backView setBackgroundColor:RGBA(20, 20, 20, 40)];
        [self addSubview:_backView];
        
        
        _maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        _maskLayer.frame = _backView.bounds;
        _maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = _maskLayer;
        
        
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15 +10, 15, widthhh, heightt)];
        [_titleImgView setImage:[UIImage imageNamed:@"Favor_Shop"]];
        [self addSubview:_titleImgView];
    }
    
    return self;
}


//-(void)setCell
//{
//    float heightt = 15;
//    
//    [_backView setHidden:NO];
//    [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, heightt +25)];
//    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(3, 3)];
//    _maskLayer.frame = _backView.bounds;
//    _maskLayer.path = maskPath.CGPath;
//    _backView.layer.mask = _maskLayer;
//}



@end
