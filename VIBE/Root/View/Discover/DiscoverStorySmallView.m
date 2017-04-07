//
//  DiscoverStorySmallView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverStorySmallView.h"

@implementation DiscoverStorySmallView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _backImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_backImgView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_backImgView];
        
        float width = frame.size.width;
        float photoHeight = width/16 *9;
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, photoHeight)];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backImgView addSubview:_photoImgView];
        
        
        _timeStampLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, photoHeight +10, width, 15)];
        [_timeStampLabel setTextAlignment:NSTextAlignmentLeft];
        [_timeStampLabel setTextColor:Default_Text_Gray_Color];
        [_timeStampLabel setFont:[VibeFont fontWithName:Font_English_Regular size:14]];
        [_backImgView addSubview:_timeStampLabel];
        
        _storyTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, photoHeight +10 +20, width, 20)];
        [_storyTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_storyTitleLabel setTextColor:Default_Text_Dark_Color];
        [_storyTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:15]];
        [_backImgView addSubview:_storyTitleLabel];
        
    }
    
    return self;
}


-(void)setDiscoverStorySmallViewWithModal:(DiscoverStoryModal *)modal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverStoryImgUrl] placeholderImage:nil];
    [_timeStampLabel setText:modal.discoverStoryTimeStamp];
    [_storyTitleLabel setText:modal.discoverStoryTitle];
}


@end




