//
//  SearchTopicTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchTopicTableViewCell.h"

@implementation SearchTopicTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _contentHeight = (kScreenWidth -40)/3;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, _contentHeight +10)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _topicView = [[RecommandTopicView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -40, _contentHeight)];
        [_backView addSubview:_topicView];
        
        _topicImgView = [[GLImageView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -40, _contentHeight)];
        [_topicImgView addTarget:self action:@selector(didTapTopic) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_topicImgView];
    }
    
    return self;
}


-(void)setSearchTopicCellWithModal:(VibeTopicModal *)modal IsLast:(BOOL )isLast
{
//    //第一行cell
//    if (self.isFirstCell) {
//        if (!_maskLayer) {
//            _maskLayer =[[CAShapeLayer alloc] init];
//        }
//        
//        [_backView setFrame:CGRectMake(10, 0, kScreenWidth -20, _contentHeight +20)];
//        [_topicView setFrame:CGRectMake(10, 10, kScreenWidth -40, _contentHeight)];
//        [_topicImgView setFrame:CGRectMake(10, 10, kScreenWidth -40, _contentHeight)];
//        
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
//        _maskLayer.frame = _backView.bounds;
//        _maskLayer.path = maskPath.CGPath;
//        _backView.layer.mask = _maskLayer;
//    }
    
    if (isLast == YES) {
        if (!_maskLayer) {
            _maskLayer =[[CAShapeLayer alloc] init];
        }
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
        _maskLayer.frame = _backView.bounds;
        _maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = _maskLayer;
    }
    
    _topicID = [modal.topicID integerValue];
    [_topicView setTopicViewWithTopic:modal];
}

-(void)didTapTopic
{
    if ([_delegate respondsToSelector:@selector(searchTopicCellClickWithTopicID:)]) {
        [_delegate searchTopicCellClickWithTopicID:_topicID];
    }
}

@end
