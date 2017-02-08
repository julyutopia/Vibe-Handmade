//
//  ProductDetailInfoTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/11/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailInfoTableViewCell.h"

@implementation ProductDetailInfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, 44)];
        [_backView setBackgroundColor:RGBA(250, 250, 250, 95)];
        [self addSubview:_backView];
        
        _infoImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -56)/2,  10, 56, 23)];
        [_infoImgView setImage:[UIImage imageNamed:@"Product_Describ"]];
        [_backView addSubview:_infoImgView];
    }
    
    return self;
}


@end
