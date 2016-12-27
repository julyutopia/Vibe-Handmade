//
//  RecommandTopicTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandTopicTableViewCell.h"

@implementation RecommandTopicTableViewCell

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
        
        GLImageView * topicImgView = [[GLImageView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -40, _contentHeight)];
        [topicImgView addTarget:self action:@selector(didTapTopic) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:topicImgView];
    }
    
    
    return self;
}


-(void)setRecommandTopicCellWithModal:(VibeTopicModal *)modal
{
    _topicID = [modal.topicID integerValue];
    [_topicView setTopicViewWithTopic:modal];
}

-(void)didTapTopic
{
    if ([_delegate respondsToSelector:@selector(recommandTopicCellClickWithIndex:)]) {
        [_delegate recommandTopicCellClickWithIndex:_topicID];
    }
}

@end


