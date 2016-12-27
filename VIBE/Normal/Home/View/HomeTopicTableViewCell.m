//
//  HomeTopicTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeTopicTableViewCell.h"

#import "HomeTopicModal.h"

@implementation HomeTopicTableViewCell

@synthesize delegate = _delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _topicImageWidth = (kScreenWidth - 15 -10 -15)/2;
        
        _topicInfoArray = [[NSMutableArray alloc]init];
        
        _topicBackView = [[UIERealTimeBlurView alloc]initWithFrame:CGRectZero];
        [_topicBackView setBackgroundColor:RGBA(0, 0, 0, 20)];
        [_topicBackView setHidden:YES];
        [self addSubview:_topicBackView];
        
        float titleImgWidth = 100;
        float titleImgHeight = 19;
        
        
        _topicTopTitleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -titleImgWidth)/2, 15, titleImgWidth, titleImgHeight)];
        [_topicTopTitleImgView setBackgroundColor:[UIColor clearColor]];
        [_topicTopTitleImgView setImage:[UIImage imageNamed:@"Home_Topic"]];
        [_topicTopTitleImgView setHidden:YES];
        [_topicBackView addSubview:_topicTopTitleImgView];
        
        _topicImageOriginY = 15 +titleImgHeight +10;
        
        _topicImagesBackView = [[UIView alloc]initWithFrame:CGRectZero];
        [_topicImagesBackView setBackgroundColor:[UIColor clearColor]];
        [_topicBackView addSubview:_topicImagesBackView];
        
        _showAllTopicBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_showAllTopicBtn setBackgroundImage:[UIImage imageNamed:@"Home_All_Topic"] forState:UIControlStateNormal];
        [_showAllTopicBtn addTarget:self action:@selector(showAllTopic) forControlEvents:UIControlEventTouchUpInside];
        [_topicBackView addSubview:_showAllTopicBtn];
    }
    
    return self;
}


-(void)setTopicCellWithContent:(NSArray *)topicArray
{
    if (_topicInfoArray.count == 0) {
        
        [_topicInfoArray removeAllObjects];
        [_topicInfoArray addObjectsFromArray:topicArray];
        
        NSInteger imagesRows = topicArray.count/2 +topicArray.count%2;
        
        float imagesHeight = (_topicImageWidth +10)*imagesRows -10;
        
        [_topicTopTitleImgView setHidden:NO];
        [_topicImagesBackView  setFrame:CGRectMake(0, _topicImageOriginY, kScreenWidth, imagesHeight)];
        
        float allTopicBtnWidth = 100;
        float allTopicBtnHeight = 14;

        [_showAllTopicBtn setFrame:CGRectMake( (kScreenWidth -allTopicBtnWidth)/2, _topicImageOriginY +imagesHeight +15, allTopicBtnWidth, allTopicBtnHeight)];
        
        float totalHeight = _topicImageOriginY +imagesHeight +15 +allTopicBtnHeight +10;
        
        [_topicBackView setFrame:CGRectMake(0, 0, kScreenWidth, totalHeight)];
        
        //清除已有专题图
        for (GLImageView * imgView in _topicImagesBackView.subviews) {
            [imgView removeFromSuperview];
        }
        //添加专题图
        for (int i =0; i <topicArray.count; i++) {
            
            int xxx = (int)i/2;
            GLImageView * topicImgView = [[GLImageView alloc]initWithFrame:CGRectMake(15 + i%2 *(_topicImageWidth+10), xxx * (_topicImageWidth +10), _topicImageWidth, _topicImageWidth)];
            [topicImgView setBackgroundColor:[UIColor clearColor]];
            [topicImgView setTag:5000 +i];
            [topicImgView setContentMode:UIViewContentModeScaleAspectFit];
            [topicImgView addTarget:self action:@selector(topicDidTap:) forControlEvents:UIControlEventTouchUpInside];
            
            HomeTopicModal * modal = [topicArray objectAtIndex:i];
            NSString * imgURL = modal.imgURL;
            [topicImgView sd_setImageWithURL:[NSURL URLWithString:imgURL] placeholderImage:nil];
            
            [_topicImagesBackView addSubview:topicImgView];
        }
        
        [_topicBackView setHidden:NO];
    }
    
}



-(void)topicDidTap:(GLImageView *)topicImgView
{
    NSInteger indexxx = topicImgView.tag -5000;

    if ([_delegate respondsToSelector:@selector(homeTopicCellTapIndex:)]) {
        [_delegate homeTopicCellTapIndex:indexxx];
    }
}

-(void)showAllTopic
{
    if ([_delegate respondsToSelector:@selector(homeTopicShowAll)]) {
        [_delegate homeTopicShowAll];
    }
}




@end




















