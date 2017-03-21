//
//  CreatorHeaderTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorHeaderTableViewCell.h"

@implementation CreatorHeaderTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float headerHeight = kScreenWidth/16 *9;
        
        _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, headerHeight)];
        [_headerImgView setBackgroundColor:[UIColor redColor]];
        [_headerImgView setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_headerImgView];
    }
    
    return self;
}


-(void)setHeaderCellWithURL:(NSString *)imageURL
{
    [_headerImgView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil];
}




@end
