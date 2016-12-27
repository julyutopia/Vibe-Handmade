//
//  MineFavorTopicsTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineFavorTopicsTableViewCell.h"

@implementation MineFavorTopicsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        float widthhh = 72;
        float topHeightt = 15;
        float imgViewHeight = (kScreenWidth -30 -10 -10 - 15 *3 )/3.5;
        
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, topHeightt +25 +imgViewHeight +15)];
        [_backView setBackgroundColor:RGBA(20, 20, 20, 40)];
        [_backView.layer setCornerRadius:4];
        [_backView.layer setMasksToBounds:YES];
        [self addSubview:_backView];
        
        
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( 15 +10, 15, widthhh, topHeightt)];
        [_titleImgView setImage:[UIImage imageNamed:@"Favor_Topic"]];
        [self addSubview:_titleImgView];
        
        

        _showTopicsScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(15 +10, 15 +25, kScreenWidth -30 -10 -10, imgViewHeight)];
        [_showTopicsScrollView setBackgroundColor:[UIColor clearColor]];
        [_showTopicsScrollView setPagingEnabled:NO];
        [_showTopicsScrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:_showTopicsScrollView];
     
        
        _topicsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setTopicCellWithModals:(NSArray *)array
{
    if (_topicsArray.count == 0) {
        [_topicsArray addObjectsFromArray:array];
        
//        float topHeightt = 15;
        
        float imgViewHeight = (kScreenWidth -30 -10 -10 - 15 *3 )/3.5;
        float productGap = 15;

//        [_backView setHidden:NO];
//        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, topHeightt +25 +imgViewHeight +15)];
//
        
        if (array.count >3) {
            [_showTopicsScrollView setContentSize:CGSizeMake((imgViewHeight +15) *array.count -15 +100, imgViewHeight)];
            
            float moreBtnWidth = 64;
            float moreBtnHeight = 16;
            
            float moreBtnLeftOrigin = _showTopicsScrollView.contentSize.width - 100 + (100 - moreBtnWidth)/2;
            
            UIButton * showMoreBtn = [[UIButton alloc]initWithFrame:CGRectMake( moreBtnLeftOrigin, (imgViewHeight -moreBtnHeight)/2, moreBtnWidth, moreBtnHeight)];
            [showMoreBtn setBackgroundImage:[UIImage imageNamed:@"Mine_Products_All"] forState:UIControlStateNormal];
            [showMoreBtn addTarget:self action:@selector(clickShowMoreTopics) forControlEvents:UIControlEventTouchUpInside];
            [_showTopicsScrollView addSubview:showMoreBtn];
        }
        
        for (int i =0; i <_topicsArray.count; i++) {
            
            HomeTopicModal * modal = [_topicsArray objectAtIndex:i];
            
            GLImageView * productImgView = [[GLImageView alloc]initWithFrame:CGRectMake( (imgViewHeight +productGap) *i, 0, imgViewHeight, imgViewHeight)];
            [productImgView setTag: 8000 +i];
            [productImgView addTarget:self action:@selector(tapProductImgView:) forControlEvents:UIControlEventTouchUpInside];
            [productImgView sd_setImageWithURL:[NSURL URLWithString:modal.imgURL] placeholderImage:nil];
            
            [_showTopicsScrollView addSubview:productImgView];
        }
    }
    
}


-(void)tapProductImgView:(GLImageView *)productImgView
{
    NSInteger indexxx = productImgView.tag -8000;
    if ([_delegate respondsToSelector:@selector(showMineFavorTopicWithIndex:)] && indexxx <= _topicsArray.count -1) {
        
        [_delegate showMineFavorTopicWithIndex:indexxx];
    }
}


//MineFavorTopicsTableViewCellDelegate

-(void)clickShowMoreTopics
{
    if ([_delegate respondsToSelector:@selector(showAllMineFavorTopics)]) {
        [_delegate showAllMineFavorTopics];
    }
}


@end
