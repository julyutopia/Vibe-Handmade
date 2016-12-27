//
//  DiscoverHotTagTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverHotTagTableViewCell.h"

@implementation DiscoverHotTagTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _singTagViewWidth = (kScreenWidth -20 -20 - 5 *2)/3;
        _singTagViewHeight = _singTagViewWidth/16 *9;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -20, 44 +_singTagViewHeight *2 +5 +10)];
        [_backView.layer setCornerRadius:4];
        [_backView.layer setMasksToBounds:YES];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -115)/2, 13, 115, 19)];
        [_titleImgView setImage:[UIImage imageNamed:@"Discover_Hot_Tag_Title"]];
        [_backView addSubview:_titleImgView];
    
        _showHotTagsView = [[UIView alloc]initWithFrame:CGRectMake(10, 44, kScreenWidth -20 -20, _singTagViewHeight *2 +5)];
        [_showHotTagsView setBackgroundColor:[UIColor whiteColor]];
        [_showHotTagsView.layer setMasksToBounds:YES];
        [_backView addSubview:_showHotTagsView];
    
        _hotTagArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setDiscoverHotTagCellWithContent:(NSArray *)array
{
    if (_hotTagArray.count) {
        return;
    }
    
    [_hotTagArray removeAllObjects];
    [_hotTagArray addObjectsFromArray:array];
    
    for (int i =0; i <_hotTagArray.count; i ++) {
                
        DiscoverHotTagView * tagView = [[DiscoverHotTagView alloc]initWithFrame:CGRectMake( i%3 *(_singTagViewWidth +5), i/3 *(_singTagViewHeight +5), _singTagViewWidth, _singTagViewHeight) AndIndex:i];
        [_showHotTagsView addSubview:tagView];
        
        DiscoverHotTagModal * modal = [_hotTagArray objectAtIndex:i];
        [tagView setDiscoverHotTagViewWithModal:modal];
    }
    
}


@end



