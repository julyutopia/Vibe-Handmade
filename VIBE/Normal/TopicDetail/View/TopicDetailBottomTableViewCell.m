//
//  TopicDetailBottomTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2016/12/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "TopicDetailBottomTableViewCell.h"

@implementation TopicDetailBottomTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _detailImgView = [[GLImageView alloc]init];
        [_detailImgView setHidden:YES];
        [_detailImgView setContentMode:UIViewContentModeScaleToFill];
        [_detailImgView.layer setCornerRadius:2.0f];
        [_detailImgView.layer setMasksToBounds:YES];
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


-(void)setTopicBottomTableCellWithInfo:(NSDictionary *)dict IsLastCell:(BOOL)isLast
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
    
    if ([type isEqualToString:@"image"]) {

        [_detailImgView setHidden:NO];
        [_backView setFrame:CGRectMake(5, 0, kScreenWidth -10, 30 +_lastCellHeight)];
        [_activityIndicatorView setCenter:CGPointMake(kScreenWidth/2, 15)];
        [_activityIndicatorView startAnimating];
        [self setCellImageWithURL:content];
    }
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
        [_backView setFrame:CGRectMake(5, 0, kScreenWidth -10, imageHeight +10 +_lastCellHeight)];
        
        if (self.isLastCell && !_maskLayer) {
        
            _maskLayer =[[CAShapeLayer alloc] init];
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
            _maskLayer.frame = _backView.bounds;
            _maskLayer.path = maskPath.CGPath;
            _backView.layer.mask = _maskLayer;
        }
        
        
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

@end
