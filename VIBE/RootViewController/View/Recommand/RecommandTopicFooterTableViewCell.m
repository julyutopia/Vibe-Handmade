//
//  RecommandTopicFooterTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandTopicFooterTableViewCell.h"

@implementation RecommandTopicFooterTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float bottomHeight = 30;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, bottomHeight)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
    
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        
        _showAllTopicBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -84)/2, 2, 84, 19)];
        [_showAllTopicBtn setBackgroundImage:[UIImage imageNamed:@"Recommand_Topic_All"] forState:UIControlStateNormal];
        [_showAllTopicBtn setBackgroundImage:[UIImage imageNamed:@"Recommand_Topic_All_HL"] forState:UIControlStateHighlighted];
        [_showAllTopicBtn addTarget:self action:@selector(showAllTopic) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_showAllTopicBtn];
    }
    
    return self;
}


-(void)showAllTopic
{
    
}

@end


