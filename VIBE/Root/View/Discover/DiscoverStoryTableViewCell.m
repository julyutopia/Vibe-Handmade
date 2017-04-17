//
//  DiscoverStoryTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverStoryTableViewCell.h"

@implementation DiscoverStoryTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Title_Color];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_titleLabel setText:@"故事"];
        [self.contentView addSubview:_titleLabel];
        
        
        _showMoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -25 -50, 0, 50, 20)];
        [_showMoreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_showMoreBtn setTitleColor:DefaultBlue forState:UIControlStateNormal];
        [_showMoreBtn setTitleColor:DefaultBlue_Pressed forState:UIControlStateHighlighted];
        [_showMoreBtn.titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_showMoreBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:_showMoreBtn];
        
        
        float bigStoryViewWidth = kScreenWidth -50;
        
        _bigStoryView = [[DiscoverStoryBigView alloc]initWithFrame:CGRectMake(25, 20 +20, bigStoryViewWidth, bigStoryViewWidth +5)];
        [_bigStoryView setDelegate:self];
        [self.contentView addSubview:_bigStoryView];
        
        
        float smallStoryViewWidth = (kScreenWidth -50 - 15)/2;
        float smallStoryViewHeight = smallStoryViewWidth/16 *9 +50;
        
        
        _leftSmallStoryView = [[DiscoverStorySmallView alloc]initWithFrame:CGRectMake(25, 20 +20 +bigStoryViewWidth +15, smallStoryViewWidth, smallStoryViewHeight)];
        [self.contentView addSubview:_leftSmallStoryView];
        
        _rightSmallStoryView = [[DiscoverStorySmallView alloc]initWithFrame:CGRectMake(kScreenWidth -25 -smallStoryViewWidth, 20 +20 +bigStoryViewWidth +15, smallStoryViewWidth, smallStoryViewHeight)];
        [self.contentView addSubview:_rightSmallStoryView];
        
        
        _storysArray = [[NSMutableArray alloc]init];
        
    }
    
    
    return self;
}


-(void)setDiscoverStoryCellWithInfo:(NSArray *)infoArray
{
    if (_storysArray.count) {
        return;
    }
    
    [_storysArray removeAllObjects];
    [_storysArray addObjectsFromArray:infoArray];
    
    //设置大故事
    if (_storysArray.count >0) {
        
        DiscoverStoryModal * modal = [_storysArray objectAtIndex:0];
        [_bigStoryView setDiscoverStoryBigViewWithModal:modal];
    }
    
    //设置小故事
    if (_storysArray.count >1) {
        DiscoverStoryModal * modal = [_storysArray objectAtIndex:1];
        [_leftSmallStoryView setDiscoverStorySmallViewWithModal:modal];
    }
    if (_storysArray.count >2) {
        DiscoverStoryModal * modal = [_storysArray objectAtIndex:2];
        [_rightSmallStoryView setDiscoverStorySmallViewWithModal:modal];
    }
    
}

#pragma mark -点击 StoryView的代理方法

#pragma mark -点击大图的StoryView
-(void)discoverStoryBigViewClick
{
    if ([_delegate respondsToSelector:@selector(discoverStoryCellClickWithIndex:)]) {
        [_delegate discoverStoryCellClickWithIndex:0];
    }
}


@end






