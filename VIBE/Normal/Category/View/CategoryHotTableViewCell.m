//
//  CategoryHotTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryHotTableViewCell.h"

@implementation CategoryHotTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float contentWidth = (kScreenWidth -15 - 30 *4) / 4.5;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, contentWidth +10)];
        [_backView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_backView];
        
        _hotScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, contentWidth)];
        [_hotScrollView setBackgroundColor:[UIColor clearColor]];
        [_hotScrollView setPagingEnabled:NO];
        [_hotScrollView setShowsHorizontalScrollIndicator:NO];
        [_backView addSubview:_hotScrollView];
        
        
        _hotContentArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setHotCellWithContent:(NSArray *)content
{
    if (_hotContentArray.count == 0) {

        [_hotContentArray addObjectsFromArray:content];

        float contentWidth = (kScreenWidth -15 - 30 *4) / 4.5;
        [_hotScrollView setContentSize:CGSizeMake(15 + (contentWidth +30) *5 -5, contentWidth)];
        
        for (int i =0; i < content.count; i ++) {
            
            GLImageView * hotIconImgView = [[GLImageView alloc]initWithFrame:CGRectMake(15 +(contentWidth +30) *i, 0, contentWidth, contentWidth)];
            [hotIconImgView.layer setCornerRadius:contentWidth/2];
            [hotIconImgView.layer setMasksToBounds:YES];
            [hotIconImgView setContentMode:UIViewContentModeScaleAspectFill];
            
            CategoryHotModal * modal = [content objectAtIndex:i];
            [hotIconImgView sd_setImageWithURL:[NSURL URLWithString:modal.categoryHotImgURL] placeholderImage:nil];
            
            [hotIconImgView setTag:6000 +i];
            [hotIconImgView addTarget:self action:@selector(tapCategoryHot:) forControlEvents:UIControlEventTouchUpInside];
            
            [_hotScrollView addSubview:hotIconImgView];
        }
    }
    
}


-(void)tapCategoryHot:(GLImageView *)hotImgView
{
    NSInteger hotImgViewTag = hotImgView.tag -6000;
    
    if ([_delegate respondsToSelector:@selector(categoryHotCellTapIndex:)]) {
        [_delegate categoryHotCellTapIndex:hotImgViewTag];
    }
}





@end
