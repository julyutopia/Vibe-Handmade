//
//  DiscoverStoryBigView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverStoryBigView.h"

@implementation DiscoverStoryBigView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float width = frame.size.width;
        
        float whiteViewWidth = width -30;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, frame.size.height)];
        [self addSubview:_backView];
        
        _blurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, width -12, width -12)];
        [_blurImgView setHidden:YES];
        [_blurImgView setBackgroundColor:[UIColor whiteColor]];
        [_blurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_blurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_blurImgView.layer setShadowOpacity:1.0f];
        [_blurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_blurImgView];
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];
        
        _whiteContentView = [[UIView alloc]initWithFrame:CGRectMake(15, width -20 -120, whiteViewWidth, 120)];
        [_whiteContentView setBackgroundColor:RGBA(255, 255, 255, 98)];
        [_whiteContentView.layer setCornerRadius:4.0f];
        [_whiteContentView.layer setMasksToBounds:YES];
        [_backView addSubview:_whiteContentView];
        
        UIView * smallBlurView1 = [[UIView alloc]initWithFrame:CGRectMake(12, width -20 -120 +5, whiteViewWidth -6, 110)];
        [smallBlurView1 setBackgroundColor:DefaultWhite];
        [smallBlurView1 setAlpha:0.7f];
        [smallBlurView1.layer setCornerRadius:4.0f];
        [smallBlurView1.layer setMasksToBounds:YES];
        [_backView insertSubview:smallBlurView1 belowSubview:_whiteContentView];
        
        UIView * smallBlurView2 = [[UIView alloc]initWithFrame:CGRectMake(9, width -20 -120 +10, whiteViewWidth -12, 100)];
        [smallBlurView2 setBackgroundColor:DefaultWhite];
        [smallBlurView2 setAlpha:0.4f];
        [smallBlurView2.layer setCornerRadius:4.0f];
        [smallBlurView2.layer setMasksToBounds:YES];
        [_backView insertSubview:smallBlurView2 belowSubview:smallBlurView1];
        
        
        _timeStampLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, whiteViewWidth -50, 15)];
        [_timeStampLabel setTextAlignment:NSTextAlignmentLeft];
        [_timeStampLabel setTextColor:Default_Text_Gray_Color];
        [_timeStampLabel setFont:[VibeFont fontWithName:Font_English_Regular size:14]];
        [_whiteContentView addSubview:_timeStampLabel];
        
        
        _storyTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 20 +15,  whiteViewWidth -50, 20)];
        
        if (iPhone5) {
            [_storyTitleLabel setFrame:CGRectMake(25, 20 +20,  whiteViewWidth -50, 20)];
        }
        if (iPhone6plus) {
            [_storyTitleLabel setFrame:CGRectMake(25, 20 +12,  whiteViewWidth -50, 20)];
        }
        
        [_storyTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_storyTitleLabel setTextColor:Default_Text_Dark_Color];
        [_storyTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:15]];
        [_whiteContentView addSubview:_storyTitleLabel];

        
        _photosContentView = [[UIView alloc]initWithFrame:CGRectMake(25, 50, whiteViewWidth -50, 55)];
        [_photosContentView setBackgroundColor:[UIColor clearColor]];
        [_whiteContentView addSubview:_photosContentView];
        
        
        _tapBackImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
        [_tapBackImgView addTarget:self action:@selector(discoverStoryBigViewClick) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_tapBackImgView];
        
        
        _bigStoryPhotosArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setDiscoverStoryBigViewWithModal:(DiscoverStoryModal *)modal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverStoryImgUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_blurImgView setImage:image];
        [_blurImgView setHidden:NO];
        
    }];
    
    [_timeStampLabel setText:modal.discoverStoryTimeStamp];
    [_storyTitleLabel setText:modal.discoverStoryTitle];
 
    
    if (_bigStoryPhotosArray.count) {
        return;
    }
    
    [_bigStoryPhotosArray removeAllObjects];
    [_bigStoryPhotosArray addObjectsFromArray:modal.discoverStoryContentPhotos];

    NSInteger photosCount = _bigStoryPhotosArray.count;
    
    float singleSmallPhotoWidth = (_photosContentView.frame.size.width - 10 *4) /5;
    
    float photoImgViewOriginY = _photosContentView.frame.size.height -singleSmallPhotoWidth;
    
    if (photosCount >4) {
       _bigStoryPhotosArray = (NSMutableArray *)[_bigStoryPhotosArray subarrayWithRange:NSMakeRange(0, 4)];
    
        UIView * showMoreView = [[UIView alloc]initWithFrame:CGRectMake(_photosContentView.frame.size.width -singleSmallPhotoWidth, photoImgViewOriginY, singleSmallPhotoWidth, singleSmallPhotoWidth)];
        [showMoreView setBackgroundColor:DefaultBlue];
        [showMoreView.layer setCornerRadius:4.0f];
        [showMoreView.layer setMasksToBounds:YES];
        [_photosContentView addSubview:showMoreView];
        
        UILabel * showNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, singleSmallPhotoWidth, singleSmallPhotoWidth)];
        [showNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [showNumberLabel setTextColor:DefaultWhite];
        [showNumberLabel setFont:[VibeFont fontWithName:Font_English_Bold size:13]];
        [showNumberLabel setText:[NSString stringWithFormat:@"+%ld",photosCount -4]];
        [showMoreView addSubview:showNumberLabel];
    }
    
    
    //设置小图片
    for (int i =0; i <_bigStoryPhotosArray.count; i ++) {
        
        UIImageView * photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake((singleSmallPhotoWidth +10) *i, photoImgViewOriginY, singleSmallPhotoWidth, singleSmallPhotoWidth)];
        NSString * photoURL = [_bigStoryPhotosArray objectAtIndex:i];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:photoURL] placeholderImage:nil];
        [photoImgView.layer setCornerRadius:4];
        [photoImgView.layer setMasksToBounds:YES];
        [photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_photosContentView addSubview:photoImgView];
    }
  
}


-(void)discoverStoryBigViewClick
{
    if ([_delegate respondsToSelector:@selector(discoverStoryBigViewClick)]) {
        [_delegate discoverStoryBigViewClick];
    }
}



@end



