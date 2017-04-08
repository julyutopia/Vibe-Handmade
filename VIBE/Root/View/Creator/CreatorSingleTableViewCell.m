//
//  CreatorSingleTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/8.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorSingleTableViewCell.h"

@implementation CreatorSingleTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        float photoViewWidth = kScreenWidth -50;
        
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(25, 0, photoViewWidth, photoViewWidth +2)];
        [self.contentView addSubview:_backView];
 
        _blurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, photoViewWidth -12, photoViewWidth -12)];
        [_blurImgView setHidden:YES];
        [_blurImgView setBackgroundColor:[UIColor whiteColor]];
        [_blurImgView.layer setShadowColor:RGBA(100, 100, 100, 20).CGColor];
        [_blurImgView.layer setShadowOffset:CGSizeMake(6, 6)];
        [_blurImgView.layer setShadowOpacity:1.0f];
        [_blurImgView.layer setShadowRadius:8.0f];
        [_backView addSubview:_blurImgView];
        
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photoViewWidth, photoViewWidth)];
        [_photoImgView.layer setCornerRadius:4.0f];
        [_photoImgView.layer setMasksToBounds:YES];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_photoImgView];
        
        float singlePhotoViewWidth = ((kScreenWidth -50 - 15 *2 - 25 *2) -10 *4)/5;
        
        float whiteContentViewWidth = photoViewWidth -30;
        float whiteContentViewHeight = 15 +25 + 10 +15 +10 +singlePhotoViewWidth +10;
        
        _whiteContentView = [[UIView alloc]initWithFrame:CGRectMake(15, photoViewWidth -whiteContentViewHeight -15, whiteContentViewWidth, whiteContentViewHeight)];
        [_whiteContentView setBackgroundColor:RGBA(255, 255, 255, 98)];
        [_whiteContentView.layer setCornerRadius:4.0f];
        [_whiteContentView.layer setMasksToBounds:YES];
        [_photoImgView addSubview:_whiteContentView];
        
        
        _smallBlurView1 = [[UIView alloc]initWithFrame:CGRectMake(12, photoViewWidth -whiteContentViewHeight -10, whiteContentViewWidth -6, whiteContentViewHeight -10)];
        [_smallBlurView1 setBackgroundColor:DefaultWhite];
        [_smallBlurView1 setAlpha:0.7f];
        [_smallBlurView1.layer setCornerRadius:4.0f];
        [_smallBlurView1.layer setMasksToBounds:YES];
        [_tapBackImgView insertSubview:_smallBlurView1 belowSubview:_whiteContentView];
        
        _smallBlurView2 = [[UIView alloc]initWithFrame:CGRectMake(9, photoViewWidth -whiteContentViewHeight -5, whiteContentViewWidth -12, whiteContentViewHeight -20)];
        [_smallBlurView2 setBackgroundColor:DefaultWhite];
        [_smallBlurView2 setAlpha:0.4f];
        [_smallBlurView2.layer setCornerRadius:4.0f];
        [_smallBlurView2.layer setMasksToBounds:YES];
        [_tapBackImgView insertSubview:_smallBlurView2 belowSubview:_smallBlurView1];
        
        
        _creatorShopTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, whiteContentViewWidth -50, 25)];
        [_creatorShopTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_creatorShopTitleLabel setTextColor:Default_Text_Dark_Color];
        [_creatorShopTitleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:21]];
        [_whiteContentView addSubview:_creatorShopTitleLabel];
        
        _creatorSloganLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 15 +23 +10,  whiteContentViewWidth -50, 15)];
        [_creatorSloganLabel setTextAlignment:NSTextAlignmentLeft];
        [_creatorSloganLabel setTextColor:Default_Text_Gray_Color];
        [_creatorSloganLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_creatorSloganLabel setNumberOfLines:0];
        [_whiteContentView addSubview:_creatorSloganLabel];
        
        
        _creatorMorePhotosArray = [[NSMutableArray alloc]init];
        
        
        _photosContentView = [[UIView alloc]initWithFrame:CGRectMake(25,  15 +23 +10 +15 +10, whiteContentViewWidth -50, singlePhotoViewWidth)];
        [_photosContentView setBackgroundColor:[UIColor clearColor]];
        [_whiteContentView addSubview:_photosContentView];
        
        
        _tapBackImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, photoViewWidth, photoViewWidth)];
        [_photoImgView addSubview:_tapBackImgView];
        
    }
    
    return self;
}


-(void)setCreatorSingleTableCellWithModal:(CreatorCoverModal *)modal
{
    [_photoImgView sd_setImageWithURL:[NSURL URLWithString:modal.CreatorCoverUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [_blurImgView setHidden:NO];
        [_blurImgView setImage:image];
        
    }];
    
    [_creatorShopTitleLabel setText:modal.CreatorShopTitle];
    [_creatorSloganLabel setText:modal.CreatorSloganTitle];
    
    
    float sloganLabelWidth = kScreenWidth -50 -30 -50;
    
    float sloganTitleHeight = [modal.CreatorSloganTitle getSizeWithLimitSize:CGSizeMake( sloganLabelWidth, 100) withFont:_creatorSloganLabel.font].height;

    //如超过一行显示
    if (sloganTitleHeight >20) {
        
        float photoViewWidth = kScreenWidth -50;
        
        float singlePhotoViewWidth = ((kScreenWidth -50 - 15 *2 - 25 *2) -10 *4)/5;
        float whiteContentViewWidth = kScreenWidth -50 -30;
        
        [[VibeAppTool sharedInstance] setLabelSpace:_creatorSloganLabel withText:modal.CreatorSloganTitle withFont:_creatorSloganLabel.font withLineSpacing:3.0f];
        
        sloganTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:modal.CreatorSloganTitle withFont:_creatorSloganLabel.font withWidth:sloganLabelWidth withLineSpacing:3.0];
    
        [_creatorSloganLabel setFrame:CGRectMake(25, 15 +23 +10,  whiteContentViewWidth -50, sloganTitleHeight)];
        
        float whiteContentViewHeight = 15 +25 + 10 +sloganTitleHeight +10 +singlePhotoViewWidth +10;

        [_whiteContentView setFrame:CGRectMake(15, photoViewWidth -whiteContentViewHeight -15, whiteContentViewWidth, whiteContentViewHeight)];
        [_smallBlurView1 setFrame:CGRectMake(12, photoViewWidth -whiteContentViewHeight -10, whiteContentViewWidth -6, whiteContentViewHeight -10)];
        [_smallBlurView2 setFrame:CGRectMake(9, photoViewWidth -whiteContentViewHeight -5, whiteContentViewWidth -12, whiteContentViewHeight -20)];
        
        [_photosContentView setFrame:CGRectMake(25,  15 +23 +10 +sloganTitleHeight +10, whiteContentViewWidth -50, singlePhotoViewWidth)];
    }
    else
    {
        [_creatorSloganLabel setText:modal.CreatorSloganTitle];
    }
    
    
    
    if (_creatorMorePhotosArray.count) {
        return;
    }
    
    [_creatorMorePhotosArray removeAllObjects];
    [_creatorMorePhotosArray addObjectsFromArray:modal.CreatorContentPhotos];
    
    NSInteger photosCount = _creatorMorePhotosArray.count;
    
    float singlePhotoViewWidth = ((kScreenWidth -50 - 15 *2 - 25 *2) -10 *4)/5;
    
    if (photosCount >4) {
        _creatorMorePhotosArray = (NSMutableArray *)[_creatorMorePhotosArray subarrayWithRange:NSMakeRange(0, 4)];
        
        UIView * showMoreView = [[UIView alloc]initWithFrame:CGRectMake(_photosContentView.frame.size.width -singlePhotoViewWidth, 0, singlePhotoViewWidth, singlePhotoViewWidth)];
        [showMoreView setBackgroundColor:DefaultBlue];
        [showMoreView.layer setCornerRadius:4.0f];
        [showMoreView.layer setMasksToBounds:YES];
        [_photosContentView addSubview:showMoreView];
        
        UILabel * showNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, singlePhotoViewWidth, singlePhotoViewWidth)];
        [showNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [showNumberLabel setTextColor:DefaultWhite];
        [showNumberLabel setFont:[VibeFont fontWithName:Font_English_Bold size:14]];
        [showNumberLabel setText:[NSString stringWithFormat:@"+%ld",photosCount -4]];
        [showMoreView addSubview:showNumberLabel];
    }
    
    
    //设置小图片
    for (int i =0; i <_creatorMorePhotosArray.count; i ++) {
        
        UIImageView * photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake((singlePhotoViewWidth +10) *i, 0, singlePhotoViewWidth, singlePhotoViewWidth)];
        NSString * photoURL = [_creatorMorePhotosArray objectAtIndex:i];
        [photoImgView sd_setImageWithURL:[NSURL URLWithString:photoURL] placeholderImage:nil];
        [photoImgView.layer setCornerRadius:4];
        [photoImgView.layer setMasksToBounds:YES];
        [photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_photosContentView addSubview:photoImgView];
    }
    
    
}



@end


