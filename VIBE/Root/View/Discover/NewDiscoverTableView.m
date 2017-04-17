//
//  NewDiscoverTableView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "NewDiscoverTableView.h"

@implementation NewDiscoverTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    
    if (self) {
        
        [self setBackgroundView:nil];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setDelegate:self];
        [self setDataSource:self];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self setShowsVerticalScrollIndicator:NO];
        
        _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];

    }
    
    return self;
}



#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 25;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _sectionFooterView;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //热门标签
    if (indexPath.section == 0) {
     
        NSString * identifierString = @"DiscoverTagTableViewCellIdentifier";
        
        DiscoverTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setHotTagCellWithInfo:[AppDelegate sharedAppDelegate].discoverTagsArray];
        
        return cell;
    }
    
    
    //专题
    if (indexPath.section == 1) {
        
        NSString * identifierString = @"DiscoverTopicTableViewCellIdentifier";
        
        DiscoverTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setDiscoverTopicCellWithInfo:[AppDelegate sharedAppDelegate].discoverTopicsArray];
        
        return cell;
    }
    
    
    //故事
    if (indexPath.section == 2) {
        
        NSString * identifierString = @"DiscoverStoryTableViewCellIdentifier";
        
        DiscoverStoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverStoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setDiscoverStoryCellWithInfo:[AppDelegate sharedAppDelegate].discoverStorysArray];
        
        return cell;
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionFillOrderCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FunctionFillOrderCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //标签
    if (indexPath.section == 0) {
        
        float singleTagViewWidth = (kScreenWidth -50 - 12 *3) /4;
        
        return 20 +20 + singleTagViewWidth *2 +12;
    }
    //专题
    if (indexPath.section == 1) {
        
        float bigAlbumViewHeight = (kScreenWidth -50)/16*9 +15;
        float smallAlbumViewHeight = (kScreenWidth -50 - 15 *2)/3;
        return  20 +20 +bigAlbumViewHeight +15 +smallAlbumViewHeight;        
    }
    //故事
    if (indexPath.section == 2) {
        
        float bigStoryViewWidth = kScreenWidth -50;
        float smallStoryViewWidth = (kScreenWidth -50 - 15)/2;
        float smallStoryViewHeight = smallStoryViewWidth/16 *9 +50;
        
        return 20 +20 +bigStoryViewWidth +15 +smallStoryViewHeight;
    }
    
    
    return 0;
}


#pragma mark -Cell的代理方式

-(void)discoverTagCellDidClickTagWithIndex:(NSInteger)index
{
    DiscoverTagModal * modal = [[AppDelegate sharedAppDelegate].discoverTagsArray objectAtIndex:index];
    if ([_delegateee respondsToSelector:@selector(discoverTableShowTagDetailWithTagModal:)]) {
        [_delegateee discoverTableShowTagDetailWithTagModal:modal];
    }
}

-(void)discoverTopicCellClickWithIndex:(NSInteger)index
{
    DiscoverTopicModal * topicModal = [[AppDelegate sharedAppDelegate].discoverTopicsArray objectAtIndex:index];
    
    if ([_delegateee respondsToSelector:@selector(discoverTableShowTopicDetailWithTopicModal:)]) {
        [_delegateee discoverTableShowTopicDetailWithTopicModal:topicModal];
    }
}

-(void)discoverStoryCellClickWithIndex:(NSInteger)index
{
    DiscoverStoryModal * storyModal = [[AppDelegate sharedAppDelegate].discoverStorysArray objectAtIndex:index];

    if ([_delegateee respondsToSelector:@selector(discoverTableShowStoryDetailWithStoryModal:)]) {
        [_delegateee discoverTableShowStoryDetailWithStoryModal:storyModal];
    }
}


@end











