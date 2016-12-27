//
//  DiscoverAlbumTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverAlbumTopTableViewCell.h"

@implementation DiscoverAlbumTopTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, 44)];
        [_backView.layer setMasksToBounds:YES];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _backView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backView.layer.mask = maskLayer;
        [self addSubview:_backView];
        
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -109)/2, 13, 109, 19)];
        [_titleImgView setImage:[UIImage imageNamed:@"Discover_List_Title"]];
        [_backView addSubview:_titleImgView];
    }
    
    return self;
}



@end
