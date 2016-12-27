//
//  RecommandTopicHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandTopicHeaderTableViewCell.h"

@implementation RecommandTopicHeaderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float topHeight = 44;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, topHeight)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -98)/2, 13, 98, 19)];
        [_titleImgView setImage:[UIImage imageNamed:@"Recommand_Topic"]];
        [_backView addSubview:_titleImgView];
    }
    
    return self;
}

@end
