//
//  DiscoverAlbumTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "DiscoverTopicTableViewCell.h"

@implementation DiscoverTopicTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:Default_Text_Title_Color];
        [_titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_titleLabel setText:@"专题"];
        [self.contentView addSubview:_titleLabel];
        
        
        _showMoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -25 -50, 0, 50, 20)];
        [_showMoreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_showMoreBtn setTitleColor:DefaultBlue forState:UIControlStateNormal];
        [_showMoreBtn setTitleColor:DefaultBlue_Pressed forState:UIControlStateHighlighted];
        [_showMoreBtn.titleLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]];
        [_showMoreBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:_showMoreBtn];
    
        float bigAlbumViewHeight = (kScreenWidth -50)/16*9 +15;
        
        _bigAlbumView = [[DiscoverTopicBigView alloc]initWithFrame:CGRectMake(25, 20 +20, kScreenWidth -50, bigAlbumViewHeight)];
        [self.contentView addSubview:_bigAlbumView];
        
        
        float smallAlbumViewHeight = (kScreenWidth -50 - 15 *2)/3;
        
        _firstTopicSmallView = [[DiscoverTopicSmallView alloc]initWithFrame:CGRectMake(25 , 20 +20 +bigAlbumViewHeight +15, smallAlbumViewHeight, smallAlbumViewHeight)];
        [self.contentView addSubview:_firstTopicSmallView];
        
        _secondTopicSmallView = [[DiscoverTopicSmallView alloc]initWithFrame:CGRectMake(25 +smallAlbumViewHeight +15, 20 +20 +bigAlbumViewHeight +15, smallAlbumViewHeight, smallAlbumViewHeight)];
        [self.contentView addSubview:_secondTopicSmallView];
        
        _thirdTopicSmallView = [[DiscoverTopicSmallView alloc]initWithFrame:CGRectMake(25 +(smallAlbumViewHeight +15) *2, 20 +20 +bigAlbumViewHeight +15, smallAlbumViewHeight, smallAlbumViewHeight)];
        [self.contentView addSubview:_thirdTopicSmallView];
     
        
        _topicsArray = [[NSMutableArray alloc]init];
    }
    
    
    return self;
}


-(void)setDiscoverTopicCellWithInfo:(NSArray *)infoArray
{
    if (_topicsArray.count) {
        return;
    }
    
    [_topicsArray removeAllObjects];
    [_topicsArray addObjectsFromArray:infoArray];
    
    //设置大专题
    if (_topicsArray.count >0) {
        
        DiscoverTopicModal * topicModal = [_topicsArray objectAtIndex:0];
        [_bigAlbumView setTopicBigViewWithModal:topicModal];
    }
    
    //设置第一个小专题
    if (_topicsArray.count >1) {
        DiscoverTopicModal * topicModal = [_topicsArray objectAtIndex:1];
        [_firstTopicSmallView setTopicSmallViewWithModal:topicModal];
    }
    //设置第二个小专题
    if (_topicsArray.count >2) {
        DiscoverTopicModal * topicModal = [_topicsArray objectAtIndex:2];
        [_secondTopicSmallView setTopicSmallViewWithModal:topicModal];
    }
    //设置第三个小专题
    if (_topicsArray.count >3) {
        DiscoverTopicModal * topicModal = [_topicsArray objectAtIndex:3];
        [_thirdTopicSmallView setTopicSmallViewWithModal:topicModal];
    }
    
}






@end











