//
//  TopicDtailPhotoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TopicDtailPhotoTableViewCell.h"

@implementation TopicDtailPhotoTableViewCell

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
        
//        //设置左边的圆角
//        CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
//        maskLayer.frame = _backView.bounds;
//        maskLayer.path = maskPath.CGPath;
//        _backView.layer.mask = maskLayer;
        
        
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


-(void)setTopicDetailPhotoCellWithInfo:(NSArray *)photosArray
{
    if (_morePhotosArray.count) {
        return;
    }
    
    [_morePhotosArray removeAllObjects];
    [_morePhotosArray addObjectsFromArray:photosArray];
    
    [_morePhotosScrollView setContentSize:CGSizeMake((_singlePhotoHeight +12) *_morePhotosArray.count , _singlePhotoHeight)];
    
    for (int i =0; i < _morePhotosArray.count; i ++) {
        
        NSString * photoURL = [_morePhotosArray objectAtIndex:i];
        
        GLImageView * photoImgView = [[GLImageView alloc]initWithFrame:CGRectMake((_singlePhotoHeight +12) *i, 0, _singlePhotoHeight, _singlePhotoHeight)];
        [photoImgView.layer setCornerRadius:4.0f];
        [photoImgView.layer setMasksToBounds:YES];
        [photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:photoURL] placeholderImage:nil];
        [photoImgView setTag:7000 +i];
        [photoImgView addTarget:self action:@selector(tapTopicDetailPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [_morePhotosScrollView addSubview:photoImgView];
    }

}


-(void)tapTopicDetailPhoto:(GLImageView *)imageView
{
    NSInteger index = imageView.tag - 7000;
    NSString * imageURL = [_morePhotosArray objectAtIndex:index];
    if ([_delegate respondsToSelector:@selector(topicDtailPhotoTableViewShowImageWithURL:)]) {
        [_delegate topicDtailPhotoTableViewShowImageWithURL:imageURL];
    }
}


@end



