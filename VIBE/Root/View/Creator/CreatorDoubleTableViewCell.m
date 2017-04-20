//
//  CreatorDoubleTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDoubleTableViewCell.h"

@implementation CreatorDoubleTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        float photoImgViewWidth = kScreenWidth -50;
        float photoImgViewHeight = photoImgViewWidth/16 *9;
        
        _singleMorePhotoViewWidth = (kScreenWidth -50 - 12 *4) /5;
        
        
        float totalViewHeight = photoImgViewHeight +15 +27 +8 +16 +17 +_singleMorePhotoViewWidth;
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(25, 0, kScreenWidth -50, totalViewHeight)];
        [_backView addTarget:self action:@selector(creatorDoubleViewTap) forControlEvents:UIControlEventTouchUpInside];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_backView];
        
        
        _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoImgViewWidth -12, photoImgViewHeight -12)];
        [_backBlurImgView setHidden:YES];
        [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
        [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_backBlurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_backBlurImgView.layer setShadowOpacity:1.0f];
        [_backBlurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_backBlurImgView];
        
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoImgViewWidth, photoImgViewHeight)];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];
        
        _shopTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, photoImgViewHeight +15, kScreenWidth -50, 27)];
        [_shopTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_shopTitleLabel setTextColor:Default_Text_Dark_Color];
        [_shopTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:23]];
        [_backView addSubview:_shopTitleLabel];
        
        _sloganLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, photoImgViewHeight +15 +27 +8, kScreenWidth -50, 16)];
        [_sloganLabel setTextAlignment:NSTextAlignmentLeft];
        [_sloganLabel setTextColor:Default_Text_Gray_Color];
        [_sloganLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]];
        [_sloganLabel setNumberOfLines:0];
        [_backView addSubview:_sloganLabel];
   
        
        _morePhotosView = [[UIView alloc]initWithFrame:CGRectMake(0, photoImgViewHeight +15 +27 +8 +16 +15 , kScreenWidth -50, _singleMorePhotoViewWidth)];
        [_morePhotosView setUserInteractionEnabled:NO];
        [_morePhotosView setBackgroundColor:[UIColor clearColor]];
        [_backView addSubview:_morePhotosView];
        
    
        _creatorMorePhotosArray = [[NSMutableArray alloc]init];
    }
    
    
    return self;
}


-(void)setCreatorDoubleTableCellWithModal:(CreatorCoverModal *)modal WithIndex:(NSInteger )index
{
    _cellIndex = index;
    
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.CreatorCoverUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [_backBlurImgView setHidden:NO];
        [_backBlurImgView setImage:image];
        
    }];
    
    
    float photoImgViewHeight = (kScreenWidth -50)/16 *9;
    
    [_shopTitleLabel setText:modal.CreatorShopTitle];
    
    float sloganTitleHeight = [modal.CreatorSloganTitle getSizeWithLimitSize:CGSizeMake( kScreenWidth -50, 100) withFont:_sloganLabel.font].height;
    
    NSLog(@"_______%@______%g_________",modal.CreatorSloganTitle,sloganTitleHeight);
    
    //超过一行显示
    if (sloganTitleHeight >20) {
        
        [[VibeAppTool sharedInstance] setLabelSpace:_sloganLabel withText:modal.CreatorSloganTitle withFont:_sloganLabel.font withLineSpacing:4.0f];
        
        sloganTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:modal.CreatorSloganTitle withFont:_sloganLabel.font withWidth:kScreenWidth -50 withLineSpacing:4.0];
    }
    else{
        [_sloganLabel setText:modal.CreatorSloganTitle];
    }
    
    NSLog(@"~~~~~ %g ~~~~~~",sloganTitleHeight);
    
    
    [_sloganLabel setFrame:CGRectMake(0, photoImgViewHeight +15 +27 +8, kScreenWidth -50, sloganTitleHeight)];
    [_morePhotosView setFrame:CGRectMake(0, photoImgViewHeight +15 +27 +8 +sloganTitleHeight +15 , kScreenWidth -50, _singleMorePhotoViewWidth)];
    
    float totalViewHeight = photoImgViewHeight +15 +27 +8 +sloganTitleHeight +15 +_singleMorePhotoViewWidth;
    [_backView setFrame:CGRectMake(25, 0, kScreenWidth -50, totalViewHeight)];
    
    if (_creatorMorePhotosArray.count) {
        return;
    }
    
    [_creatorMorePhotosArray removeAllObjects];
    [_creatorMorePhotosArray addObjectsFromArray:modal.CreatorContentPhotos];
    
    NSInteger photosCount = _creatorMorePhotosArray.count;
    
    
    if (photosCount >4) {
        _creatorMorePhotosArray = (NSMutableArray *)[_creatorMorePhotosArray subarrayWithRange:NSMakeRange(0, 4)];
        
        UIView * showMoreView = [[UIView alloc]initWithFrame:CGRectMake(_morePhotosView.frame.size.width -_singleMorePhotoViewWidth, 0, _singleMorePhotoViewWidth, _singleMorePhotoViewWidth)];
        [showMoreView setBackgroundColor:DefaultBlue];
        [showMoreView.layer setCornerRadius:4.0f];
        [showMoreView.layer setMasksToBounds:YES];
        [_morePhotosView addSubview:showMoreView];
        
        UILabel * showNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _singleMorePhotoViewWidth, _singleMorePhotoViewWidth)];
        [showNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [showNumberLabel setTextColor:DefaultWhite];
        [showNumberLabel setFont:[VibeFont fontWithName:Font_English_Bold size:14]];
        [showNumberLabel setText:[NSString stringWithFormat:@"+%ld",photosCount -4]];
        [showMoreView addSubview:showNumberLabel];
    }
    
    
    //设置小图片
    for (int i =0; i <_creatorMorePhotosArray.count; i ++) {
        
        UIImageView * photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake((_singleMorePhotoViewWidth +12) *i, 0, _singleMorePhotoViewWidth, _singleMorePhotoViewWidth)];
        NSString * photoURL = [_creatorMorePhotosArray objectAtIndex:i];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:photoURL] placeholderImage:nil];
        [photoImgView.layer setCornerRadius:4];
        [photoImgView.layer setMasksToBounds:YES];
        [photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_morePhotosView addSubview:photoImgView];
    }

}


-(void)creatorDoubleViewTap
{
    if ([_delegate respondsToSelector:@selector(creatorDoubleCellDidTapWithIndex:)]) {
        [_delegate creatorDoubleCellDidTapWithIndex:_cellIndex];
    }
}


@end








