//
//  ProductDetailShowTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/11/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailShowTableViewCell.h"

@implementation ProductDetailShowTableViewCell

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
        [self addSubview:_detailInfoLabel];
        
//        _detailImgView = [[GLImageView alloc]init];
//        [_detailImgView setHidden:YES];
//        [_detailImgView setContentMode:UIViewContentModeScaleToFill];
//        [self addSubview:_detailImgView];
//        
//        //图片默认高度
//        self.imageHeight = 30;
//        
//        //没有加载出图片
//        self.didLoadImage = NO;
//        
//        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//        [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
//        [_activityIndicatorView setHidesWhenStopped:YES];
//        [self addSubview:_activityIndicatorView];
    }
    
    return self;
}


-(void)setDetailShowTableCellWithInfo:(NSDictionary *)dict
{
    NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
    NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];

    if ([type isEqualToString:@"text_Small"]) {
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font_Small size:14] Color:RGBA(60, 77, 102, 100) Text:content LineSpace:4.0];
    }
    
    else if ([type isEqualToString:@"text_Middle"]) {
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font size:14] Color:RGBA(107, 114, 138, 70) Text:content  LineSpace:4.0];
    }
    
    else if ([type isEqualToString:@"text_Bold"]) {
        
        [self setCellTextLabelWithFont:[VibeFont fontWithName:Default_Font size:16] Color:RGBA(53, 64, 101, 50) Text:content  LineSpace:5.0];
    }
    
}


-(void)setCellTextLabelWithFont:(UIFont *)font Color:(UIColor *)color Text:(NSString *)text LineSpace:(CGFloat )lineSpace
{
    [[VibeAppTool sharedInstance] setLabelSpace:_detailInfoLabel withText:text withFont:font withLineSpacing:lineSpace];
    
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:text withFont:font withWidth:kScreenWidth -50 withLineSpacing:lineSpace];
    [_detailInfoLabel setFrame:CGRectMake(15, 15, kScreenWidth -30 -20, labelHeght +2)];
    [_detailInfoLabel setTextColor:color];
    
    [_backView setFrame:CGRectMake(0, 0, kScreenWidth,15 +labelHeght +2)];
}

//-(void)setCellImageWithURL:(NSString *)imageURL
//{
//    [_detailImgView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        self.didLoadImage = YES;
//        [_detailImgView setImage:image];
//        
//        float imageHeight = [self calculateImageHeight];
//        
//        self.imageHeight = imageHeight +15;
//        
//        [_activityIndicatorView stopAnimating];
//        [_detailImgView setFrame:CGRectMake(15, 10, kScreenWidth -30, imageHeight)];
//        [_backView setFrame:CGRectMake(0, 0, kScreenWidth, imageHeight +15)];
//    }];
//}
//
//
//-(float)calculateImageHeight
//{
//    if (self.didLoadImage == YES) {
//        UIImage * image = _detailImgView.image;
//        
//        float imageWidthhh = image.size.width;
//        float imageHeightt = image.size.height;
//        
//        if (imageWidthhh >=kScreenWidth -30) {
//            imageHeightt = imageHeightt / (imageWidthhh/ (kScreenWidth -30));
//        }
//        else{
//            imageHeightt = imageHeightt * (kScreenWidth -30)/ imageWidthhh;
//        }
//        return imageHeightt;
//    }
//   
//    return 30;
//}


@end


