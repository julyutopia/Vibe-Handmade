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
        _backViewWidth = kScreenWidth - 60 -20;
        
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_backView];
        
        _detailImgView = [[UIImageView alloc]init];
        [_detailImgView setHidden:YES];
        [_detailImgView setContentMode:UIViewContentModeScaleToFill];
        [_detailImgView.layer setCornerRadius:2.0f];
        [_detailImgView.layer setMasksToBounds:YES];
        [_backView addSubview:_detailImgView];
        
        //图片默认高度
        self.imageHeight = 30;
        //没有加载出图片
        self.didLoadImage = NO;
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicatorView setHidesWhenStopped:YES];
        
        [_backView addSubview:_activityIndicatorView];
    }
    
    return self;
}


-(void)setTopicBottomTableCellWithInfo:(NSString *)imageURL IsLastCell:(BOOL)isLast
{
    if (! isLast) {
        self.isLastCell = NO;
        _bottomHeight = 15.0f;
    }
    else{
        self.isLastCell = YES;
        _bottomHeight = 0.0f;
    }

    [_detailImgView setHidden:YES];
    
    [_backView setFrame:CGRectMake(60, 0, _backViewWidth, 30 +_bottomHeight)];
    
    [_activityIndicatorView setCenter:CGPointMake( _backViewWidth/2, 15)];
    [_activityIndicatorView startAnimating];
    
    [self setCellImageWithURL:imageURL];
    
}


-(void)setCellImageWithURL:(NSString *)imageURL
{
    [_detailImgView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_detailImgView setHidden:NO];
        
        self.didLoadImage = YES;
        
        self.imageHeight = [self calculateImageHeight];
        
        [_activityIndicatorView stopAnimating];
        
        [_detailImgView setFrame:CGRectMake(0, 0, _backViewWidth, self.imageHeight)];
        
        [_backView setFrame:CGRectMake(60, 0, _backViewWidth, self.imageHeight +_bottomHeight)];
        
        
//        if (self.isLastCell && !_maskLayer) {
//        
//            _maskLayer =[[CAShapeLayer alloc] init];
//            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
//            _maskLayer.frame = _backView.bounds;
//            _maskLayer.path = maskPath.CGPath;
//            _backView.layer.mask = _maskLayer;
//        }
        
    }];
}


-(float)calculateImageHeight
{
    if (self.didLoadImage == YES) {
        
        UIImage * image = _detailImgView.image;
        
        float imageWidthhh = image.size.width;
        float imageHeightt = image.size.height;
        
        if (imageWidthhh >=_backViewWidth) {
            imageHeightt = imageHeightt / (imageWidthhh/ _backViewWidth);
        }
        else{
            imageHeightt = imageHeightt * _backViewWidth/ imageWidthhh;
        }
        return imageHeightt;
    }
    
    return 30;
}

@end
