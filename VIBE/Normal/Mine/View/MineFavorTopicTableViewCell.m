//
//  MineFavorTopicTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/2/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "MineFavorTopicTableViewCell.h"

@implementation MineFavorTopicTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _contentHeight = (kScreenWidth -60)/3;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -60, _contentHeight +10)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _topicView = [[RecommandTopicView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth -60, _contentHeight)];
        [_backView addSubview:_topicView];
        
        GLImageView * topicImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth -60, _contentHeight)];
        [topicImgView addTarget:self action:@selector(didTapTopicBackView) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:topicImgView];
        
    }
    
    return self;
}



-(void)setMineFavorTopicCellModal:(VibeTopicModal *)modal WithIndex:(NSInteger )index IsLast:(BOOL )isLast
{
    _topicIndex = index;
    
    [_topicView.topicTitleLabel setFont:[VibeFont fontWithName:Default_Font_Bold size:14]];
    [_topicView setTopicViewWithTopic:modal];
    
    if (isLast == YES) {
        [_backView setFrame:CGRectMake(10, 0, kScreenWidth -60, _contentHeight +20)];
    }
}


-(void)didTapTopicBackView
{
    if ([_delegate respondsToSelector:@selector(mineFavorTopicCellClickWithIndex:)]) {
        [_delegate mineFavorTopicCellClickWithIndex:_topicIndex];
    }
    
}


@end
