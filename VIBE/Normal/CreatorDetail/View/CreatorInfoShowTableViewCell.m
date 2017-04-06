//
//  CreatorInfoShowTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/3/24.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorInfoShowTableViewCell.h"

@implementation CreatorInfoShowTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _detailInfoLabel = [[UILabel alloc]init];
        [_detailInfoLabel setBackgroundColor:[UIColor clearColor]];
        [_detailInfoLabel setNumberOfLines:0];
        [_detailInfoLabel setHidden:YES];
        [self addSubview:_detailInfoLabel];
        
        _detailImgView = [[GLImageView alloc]init];
        [_detailImgView setHidden:YES];
        [_detailImgView setContentMode:UIViewContentModeScaleToFill];
        [_detailImgView.layer setCornerRadius:2.0f];
        [_detailImgView.layer setMasksToBounds:YES];
        [_detailImgView addTarget:self action:@selector(clickTopicImageView:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_detailImgView];
        
        //图片默认高度
        self.imageHeight = 30;
        
        //没有加载出图片
        self.didLoadImage = NO;
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicatorView setHidesWhenStopped:YES];
        [self addSubview:_activityIndicatorView];
        
    }
    
    return self;
}


-(void)setCreatorDetailShowTableCellWithInfo:(NSDictionary *)dict IsLastCell:(BOOL )isLast
{
    NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
    NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];
    
    if (isLast) {
        self.isLastCell = YES;
        _lastCellHeight = 5.0f;
    }
    else{
        self.isLastCell = NO;
        _lastCellHeight = 0.0f;
    }
    
    if ([type isEqualToString:Detail_Show_Text_Small]) {
        [_detailInfoLabel setHidden:NO];
        [_detailImgView setHidden:YES];
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font_Small size:14] Color:RGBA(60, 77, 102, 100) Text:content LineSpace:5.0];
    }
    
    else if ([type isEqualToString:Detail_Show_Text_Middle]) {
        [_detailInfoLabel setHidden:NO];
        [_detailImgView setHidden:YES];
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font size:15] Color:RGBA(63, 70, 80, 100) Text:content  LineSpace:5.0];
    }
    
    else if ([type isEqualToString:Detail_Show_Text_Bold]) {
        [_detailInfoLabel setHidden:NO];
        [_detailImgView setHidden:YES];
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font_Middle size:16] Color:DefaultQYTextColor70 Text:content  LineSpace:6.0];
    }
    
    else if ([type isEqualToString:Detail_Show_Image]) {
        
        [_detailInfoLabel setHidden:YES];
        [_detailImgView setHidden:NO];
        
        [_backView setFrame:CGRectMake(5, 0, kScreenWidth -10, 30 +_lastCellHeight)];
        [_activityIndicatorView setCenter:CGPointMake(kScreenWidth/2, 15)];
        [_activityIndicatorView startAnimating];
        [self setCellImageWithURL:content];
        
    }

}


-(void)setCellTextLabelWithFont:(UIFont *)font Color:(UIColor *)color Text:(NSString *)text LineSpace:(CGFloat )lineSpace
{
    [[VibeAppTool sharedInstance] setLabelSpace:_detailInfoLabel withText:text withFont:font withLineSpacing:lineSpace];
    
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:text withFont:font withWidth:kScreenWidth -40 withLineSpacing:lineSpace];
    [_detailInfoLabel setFrame:CGRectMake(15, 3, kScreenWidth -30, labelHeght +1)];
    [_detailInfoLabel setTextColor:color];
    
    [_backView setFrame:CGRectMake(0, 0, kScreenWidth, labelHeght +10 +_lastCellHeight)];
}


-(void)setCellImageWithURL:(NSString *)imageURL
{
    [_detailImgView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.didLoadImage = YES;
        [_detailImgView setImage:image];
        
        float imageHeight = [self calculateImageHeight];
        
        self.imageHeight = imageHeight +10;
        
        [_activityIndicatorView stopAnimating];
        [_detailImgView setFrame:CGRectMake(15, 5, kScreenWidth -30, imageHeight)];
        [_backView setFrame:CGRectMake(0, 0, kScreenWidth, imageHeight +10 +_lastCellHeight)];
    }];
}


-(float)calculateImageHeight
{
    if (self.didLoadImage == YES) {
        
        UIImage * image = _detailImgView.image;
        
        float imageWidthhh = image.size.width;
        float imageHeightt = image.size.height;
        
        if (imageWidthhh >=kScreenWidth -30) {
            imageHeightt = imageHeightt / (imageWidthhh/ (kScreenWidth -30));
        }
        else{
            imageHeightt = imageHeightt * (kScreenWidth -30)/ imageWidthhh;
        }
        return imageHeightt;
    }
    
    return 30;
}


-(void)clickTopicImageView:(GLImageView *)imgView
{
    if (imgView.sd_imageURL) {
        
        NSString * imgURL = [imgView.sd_imageURL absoluteString];
        
//        if (imgURL && [_delegate respondsToSelector:@selector(topicDetailInfoCellDidTapImageWithURL:)]) {
//            [_delegate topicDetailInfoCellDidTapImageWithURL:imgURL];
//        }
    }
    
    
}


@end
