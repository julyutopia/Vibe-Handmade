//
//  RecommandCategoryTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandCategoryTableViewCell.h"

@implementation RecommandCategoryTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _categoryCellHeight = 42.6666666666 *sizeRate * 2 +8;
        
        _showCategoryView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth -30, _categoryCellHeight)];
        [_showCategoryView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_showCategoryView];
        
        _categoryArray = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}


-(void)setCategoryCellWithArray:(NSArray *)cates
{
    if (_categoryArray.count) {
        return;
    }
    
    [_categoryArray removeAllObjects];
    [_categoryArray addObjectsFromArray:cates];

    float singleWidth  = 51.2 *sizeRate;
    float singleHeight = 42.6666666666 * sizeRate;
    
    for (int i =0; i < _categoryArray.count; i ++) {
        
        RecommandCategoryModal * modal = [_categoryArray objectAtIndex:i];
        if (i < 5) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleWidth+11) *i, 0, singleWidth, singleHeight)];
            [btn setTag:5000 +i];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryImgURL] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_showCategoryView addSubview:btn];
        }
        if (i >= 5) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleWidth+11) * (i -5), singleHeight +8, singleWidth, singleHeight)];
            [btn setTag:5000 +i];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryImgURL] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_showCategoryView addSubview:btn];
        }
    }
 
    
//    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
//    [btn setBackgroundColor:[UIColor blueColor]];
//    [btn addTarget:self action:@selector(ssssss) forControlEvents:UIControlEventTouchUpInside];
//    [_showCategoryView addSubview:btn];

}


-(void)categoryImgClicked:(GLImageView *)imgBtn
{
    NSInteger indexxxx = imgBtn.tag - 5000;
    if (indexxxx < _categoryArray.count && [_delegate respondsToSelector:@selector(recommandCategoryCellTapWithIndex:)])
    {
        [_delegate recommandCategoryCellTapWithIndex:indexxxx];
    }
    
}


@end






