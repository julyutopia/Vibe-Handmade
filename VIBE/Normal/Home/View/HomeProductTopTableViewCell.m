//
//  HomeProductTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeProductTopTableViewCell.h"

@implementation HomeProductTopTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float titleImgWidth = 100;
        float titleImgHeight = 19;
        
        _productTopBackView = [[UIERealTimeBlurView alloc]initWithFrame:CGRectZero];
        [_productTopBackView setBackgroundColor:RGBA(0, 0, 0, 20)];
        [_productTopBackView setHidden:YES];
        [self addSubview:_productTopBackView];
        
        _productTitleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -titleImgWidth)/2, 15, titleImgWidth, titleImgHeight)];
        [_productTitleImgView setBackgroundColor:[UIColor clearColor]];
        [_productTitleImgView setImage:[UIImage imageNamed:@"Home_Discover"]];
        [_productTopBackView addSubview:_productTitleImgView];
    }
    
    return self;
}

-(void)setCell
{
    float titleImgHeight = 19;
    [_productTopBackView setFrame:CGRectMake(0, 0, kScreenWidth, 15 +titleImgHeight +11)];
    [_productTopBackView setHidden:NO];
}


@end
