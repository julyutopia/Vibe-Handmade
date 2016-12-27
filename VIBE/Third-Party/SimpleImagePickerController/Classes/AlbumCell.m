//
//  AlbumCell.m
//  TheThing
//
//  Created by Leno on 15/7/17.
//  Copyright (c) 2015年 Leno. All rights reserved.
//

#import "AlbumCell.h"

@implementation AlbumCell

@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        GLImageView * _backImgView;
//        AMBlurView * _backView;
//        
//        UIImageView * _photoImgView;
//        
//        UILabel     * _albumLabel;
//        
//        UILabel     * _countLabel;
//        UILabel     * _zhangLabel;
        
        _backImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_backImgView setBackgroundColor:[UIColor clearColor]];
        [_backImgView addTarget:self action:@selector(didChooseAlbum:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backImgView];
        
        
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [_photoImgView setBackgroundColor:[UIColor clearColor]];
        [_photoImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_photoImgView.layer setMasksToBounds:YES];
        [_backImgView addSubview:_photoImgView];
        
        
        _albumLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, kScreenWidth -60 -60, 20)];
        [_albumLabel setTextAlignment:NSTextAlignmentLeft];
        [_albumLabel setTextColor:DefaultQYTextColor80];
        [_albumLabel setFont:[UIFont fontWithName:Default_Font size:16]];
        [_backImgView addSubview:_albumLabel];
        
        
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth - 25 -80 -1, 21, 80, 20)];
        [_countLabel setTextAlignment:NSTextAlignmentRight];
        [_countLabel setTextColor:DefaultQYTextColor40];
        [_countLabel setFont:[UIFont fontWithName:Default_Number_Font size:17]];
        [_backImgView addSubview:_countLabel];
        
        
        _zhangLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth -25, 20, 15, 20)];
        [_zhangLabel setTextAlignment:NSTextAlignmentCenter];
        [_zhangLabel setTextColor:DefaultQYTextColor40];
        [_zhangLabel setFont:[UIFont fontWithName:Default_Font size:13]];
        [_zhangLabel setText:@"张"];
        [_backImgView addSubview:_zhangLabel];

    }
    
    return self;
}


-(void)setAlbumCellWithImage:(UIImage *)image Title:(NSString *)title Count:(NSInteger )count WithAlbumIndex:(NSInteger )index
{
    [_backImgView setTag:index];
 
    [_photoImgView setImage:image];
    
    [_albumLabel setText:title];
    
    [_countLabel setText:[NSString stringWithFormat:@"%ld",count]];
}


-(void)didChooseAlbum:(GLImageView *)sender
{
    if ([_delegate respondsToSelector:@selector(didSelectAlbumWithIndex:)]) {
        [_delegate didSelectAlbumWithIndex:sender.tag];
    }
}


@end

