//
//  FavorStoryView.m
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FavorStoryView.h"

@implementation FavorStoryView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        GLImageView * _backView;
//        UIImageView * _storyImgView;
//        UIButton    * _storyFavorBtn;
//        UILabel     * _storyTitleLabel;
        
        
        float width = frame.size.width;
        float height = frame.size.width;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        [self addSubview:_backView];
        
        _storyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        [_storyImgView.layer setCornerRadius:4.0f];
        [_storyImgView.layer setMasksToBounds:YES];
        [_storyImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_storyImgView];
        
        _storyTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, width +10, width, 18)];
        [_storyTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_storyTitleLabel setTextColor:Default_Text_Gray_Color];
        [_storyTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:15]];
        [_backView addSubview:_storyTitleLabel];
        
    }
    
    
    return self;
}


-(void)setFavorStoryViewWithModal:(DiscoverStoryModal *)modal
{
    [_storyImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverStoryImgUrl] placeholderImage:nil];
    [_storyTitleLabel setText:modal.discoverStoryTitle];
}


@end
