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
        
        [cell setDiscoverTopicCellWithInfo:[AppDelegate sharedAppDelegate].discoverTopicsArray];
        
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
    if (indexPath.section == 0) {
        
        float singleTagViewWidth = (kScreenWidth -50 - 12 *3) /4;
        
        return 20 +20 + singleTagViewWidth *2 +12;
    }
    
    
    if (indexPath.section == 1) {
        
        return 400;
    }
    
    
    return 0;
}


@end











