//
//  DiscoverTagTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverTagTableViewCell.h"

@implementation DiscoverTagTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Title_Color];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_titleLabel setText:@"热门标签"];
        [self.contentView addSubview:_titleLabel];
        
        
        float singleTagViewWidth = (kScreenWidth -50 - 12 *3) /4;
        
        _hotTagView = [[UIView alloc]initWithFrame:CGRectMake(25, 20 +20, kScreenWidth -50, singleTagViewWidth *2 +12)];
        [_hotTagView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_hotTagView];
        
        
        _hotTagsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setHotTagCellWithInfo:(NSArray *)array
{
    if (_hotTagsArray.count) {
        return;
    }
    
    [_hotTagsArray removeAllObjects];
    [_hotTagsArray addObjectsFromArray:array];
    
    
    float singleTagViewWidth = (kScreenWidth -50 - 12 *3) /4;

    for (int i =0; i < _hotTagsArray.count; i ++) {
        
        DiscoverTagModal * modal = [_hotTagsArray objectAtIndex:i];
        
        if (i < 4) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleTagViewWidth+12) *i, 0, singleTagViewWidth, singleTagViewWidth)];
            [btn setTag:6000 +i];
            [btn.layer setCornerRadius:4.0f];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.discoverTagImgUrl] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_hotTagView addSubview:btn];
            
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, singleTagViewWidth -10, singleTagViewWidth -10)];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            [titleLabel setTextColor:DefaultWhite];
            [titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]];
            [titleLabel setText:modal.discoverTagTitle];
            [btn addSubview:titleLabel];
        }
        
        if (i >= 4 && i <= 7) {
            GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleTagViewWidth+12) * (i -4), singleTagViewWidth +12, singleTagViewWidth, singleTagViewWidth)];
            [btn setTag:6000 +i];
            [btn.layer setCornerRadius:4.0f];
            [btn sd_setImageWithURL:[NSURL URLWithString:modal.discoverTagImgUrl] placeholderImage:nil];
            [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_hotTagView addSubview:btn];
            
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, singleTagViewWidth -10, singleTagViewWidth -10)];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            [titleLabel setTextColor:DefaultWhite];
            [titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]];
            [titleLabel setText:modal.discoverTagTitle];
            [btn addSubview:titleLabel];
        }
    }

}



-(void)categoryImgClicked:(GLImageView *)btn
{

}


@end


