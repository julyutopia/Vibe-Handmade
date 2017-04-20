//
//  StoryDetailPhotoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "StoryDetailPhotoTableViewCell.h"

@implementation StoryDetailPhotoTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _singlePhotoHeight = (kScreenWidth -60 -20 -12 *3)/3.5;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60, _singlePhotoHeight)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [_backView.layer setMasksToBounds:YES];
        [self.contentView addSubview:_backView];
        
        _morePhotosScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -60 -20, _singlePhotoHeight)];
        [_morePhotosScrollView.layer setCornerRadius:4.0f];
        [_morePhotosScrollView.layer setMasksToBounds:YES];
        [_morePhotosScrollView setBackgroundColor:[UIColor clearColor]];
        [_morePhotosScrollView setBounces:YES];
        [_morePhotosScrollView setShowsHorizontalScrollIndicator:NO];
        [_backView addSubview:_morePhotosScrollView];
        
        
        _morePhotosArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}



-(void)setStoryDetailPhotoCellWithInfo:(NSArray *)photosArray
{
    if (_morePhotosArray.count) {
        return;
    }
    
    [_morePhotosArray removeAllObjects];
    [_morePhotosArray addObjectsFromArray:photosArray];
    
    [_morePhotosScrollView setContentSize:CGSizeMake((_singlePhotoHeight +12) *_morePhotosArray.count -12, _singlePhotoHeight)];
    
    for (int i =0; i < _morePhotosArray.count; i ++) {
        
        NSString * photoURL = [_morePhotosArray objectAtIndex:i];
        
        GLImageView * photoImgView = [[GLImageView alloc]initWithFrame:CGRectMake((_singlePhotoHeight +12) *i, 0, _singlePhotoHeight, _singlePhotoHeight)];
        [photoImgView.layer setCornerRadius:4.0f];
        [photoImgView.layer setMasksToBounds:YES];
        [photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:photoURL] placeholderImage:nil];
        [photoImgView setTag:3000 +i];
        [photoImgView addTarget:self action:@selector(tapStoryDetailPhotoView:) forControlEvents:UIControlEventTouchUpInside];
        [_morePhotosScrollView addSubview:photoImgView];
    }
}


-(void)tapStoryDetailPhotoView:(GLImageView *)photoImgView
{
    NSInteger index = photoImgView.tag - 3000;
    if ([_delegate respondsToSelector:@selector(storyDetailPhotoTableViewShowImages:WithIndex:)]) {
        [_delegate storyDetailPhotoTableViewShowImages:_morePhotosArray WithIndex:index];
    }
}


@end
