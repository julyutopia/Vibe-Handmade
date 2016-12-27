//
//  DiscoverTableView.m
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverTableView.h"

@implementation DiscoverTableView

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
        
        _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
        
        _discoverHotTagsArray = [[NSMutableArray alloc]init];
        _discoverAlbumsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setDiscoverTableWithHotTagsArray:(NSArray *)hotTags AlbumsArray:(NSArray *)albums;
{
    if (hotTags.count && albums.count) {
        
        [_discoverHotTagsArray removeAllObjects];
        [_discoverHotTagsArray addObjectsFromArray:hotTags];
        
        [_discoverAlbumsArray removeAllObjects];
        [_discoverAlbumsArray addObjectsFromArray:albums];
        
        [self reloadData];
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==0 || section ==2) {
        return 15;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section ==0 || section ==2) {
        return _sectionFooterView;
    }
    return nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 1;
    }
    if (section ==2) {
        return _discoverAlbumsArray.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        NSString * identifierString = @"DiscoverHotTagTableViewCellIdentifier";
        DiscoverHotTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverHotTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        [cell setDiscoverHotTagCellWithContent:_discoverHotTagsArray];
        return cell;
    }
    
    if (indexPath.section == 1) {
        NSString * identifierString = @"DiscoverAlbumTopTableViewCellIdentifier";
        DiscoverAlbumTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverAlbumTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        return cell;
    }
    
    if (indexPath.section == 2) {
        NSString * identifierString = @"DiscoverAlbumTableViewCellIdentifier";
        DiscoverAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[DiscoverAlbumTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        BOOL isLast = NO;
        if (indexPath.row == _discoverAlbumsArray.count -1) {
            isLast = YES;
        }
        
        DiscoverTopicModal * modal = [_discoverAlbumsArray objectAtIndex:indexPath.row];
        [cell setDiscoverAlbumWithModal:modal IsLast:isLast];
        
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
    if (indexPath.section == 0)
    {
        float _singTagViewWidth = (kScreenWidth -20 -20 - 5 *2)/3;
        float _singTagViewHeight = _singTagViewWidth/16 *9;
        return 44 +_singTagViewHeight *2 +5 +10;
    }
    
    if (indexPath.section ==1)
    {
        return 44;
    }
    
    if (indexPath.section ==2)
    {
        return (kScreenWidth -20 -20)/16*9 +10;
    }
    return 0;
}

@end




