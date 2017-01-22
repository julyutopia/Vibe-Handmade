//
//  SearchTopicRoundHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/1/22.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchTopicRoundHeaderTableViewCell.h"

@implementation SearchTopicRoundHeaderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, 10)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
    }
    
    return self;
}


@end
