//
//  TopicDetailRelatedHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2016/12/21.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "TopicDetailRelatedHeaderTableViewCell.h"

@implementation TopicDetailRelatedHeaderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(5, 0, kScreenWidth -10, 5 +15 +16 +5)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, kScreenWidth -30, 15 +16 +5)];
        [_headerView setBackgroundColor:RGBA(245, 245, 245, 90)];
        [_backView addSubview:_headerView];
        
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headerView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _headerView.bounds;
        maskLayer.path = maskPath.CGPath;
        _headerView.layer.mask = maskLayer;
        
        _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -30 -87)/2 ,15, 87, 16)];
        [_headerImgView setImage:[UIImage imageNamed:@"Topic_Detail_Related_Header"]];
        [_headerView addSubview:_headerImgView];
    }
    
    return self;
}


@end



