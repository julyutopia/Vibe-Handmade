//
//  RecommandCateTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandCateTableViewCell.h"

@implementation RecommandCateTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Title_Color];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_titleLabel setText:@"热门分类"];
        [self.contentView addSubview:_titleLabel];
        
        float categoryViewWidth = ((kScreenWidth -50) - 12 *4)/5;
        
        _categoryView = [[UIView alloc]initWithFrame:CGRectMake(25, 20 +20, kScreenWidth -50, categoryViewWidth *2 +12)];
        [_categoryView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_categoryView];
    
        _cateArray = [[NSMutableArray alloc]init];

    }
    
    return self;
    
}


-(void)setCateCellWithInfo:(NSArray *)array
{
    if (_cateArray.count) {
        return;
    }
    
    [_cateArray removeAllObjects];
    [_cateArray addObjectsFromArray:array];
    
    
    float categoryViewWidth = ((kScreenWidth -50) - 12 *4)/5;

    
    for (int i =0; i < _cateArray.count; i ++) {
        
        RecommandCateModal * modal = [_cateArray objectAtIndex:i];
        if (i < 5) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (categoryViewWidth+12) *i, 0, categoryViewWidth, categoryViewWidth)];
            [btn setTag:5000 +i];
            [btn.layer setCornerRadius:4.0f];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryIconImgURL] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_categoryView addSubview:btn];
        }
        if (i >= 5 && i <= 9) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (categoryViewWidth+12) * (i -5), categoryViewWidth +12, categoryViewWidth, categoryViewWidth)];
            [btn setTag:5000 +i];
            [btn.layer setCornerRadius:4.0f];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryIconImgURL] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_categoryView addSubview:btn];
        }
    }

}


-(void)categoryImgClicked:(GLImageView *)btn
{
    NSInteger indexxx = btn.tag - 5000;

    if ([_delegateee respondsToSelector:@selector(recommandCateCellDidClickCategoryWithIndex:)]) {
        [_delegateee recommandCateCellDidClickCategoryWithIndex:indexxx];
    }
    
}

@end


