//
//  SearchProductsAllTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchProductsAllTableViewCell.h"

@implementation SearchProductsAllTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float bottomHeight = 37;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, bottomHeight)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        
        _showAllTopicBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -148)/2, 5, 148, 27)];
        [_showAllTopicBtn setBackgroundImage:[UIImage imageNamed:@"Search_Result_Products_All"] forState:UIControlStateNormal];
        [_showAllTopicBtn addTarget:self action:@selector(showAllSearchProducts) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_showAllTopicBtn];
    }
    
    return self;
}


-(void)showAllSearchProducts
{
    if ([_delegateee respondsToSelector:@selector(searchProductShowAllResults)]) {
        [_delegateee searchProductShowAllResults];
    }
}


@end
