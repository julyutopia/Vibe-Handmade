//
//  CreatorTableView.m
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CreatorTableView.h"

@implementation CreatorTableView

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

        _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];

        _creatorArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setCreatorTableWithContent:(NSArray *)array
{
    if (array.count) {
        [_creatorArray removeAllObjects];
        [_creatorArray addObjectsFromArray:array];
        [self reloadData];
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _creatorArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_creatorArray.count) {
        
        CreatorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatorCellIdentifier"];
        if (cell == nil) {
            cell = [[CreatorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CreatorCellIdentifier"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        
        [cell setDelegate:self];
        
        CreatorCoverModal * modal = [_creatorArray objectAtIndex:indexPath.row];
        [cell setCreatorCellWithModal:modal WithIndex:indexPath.row];
        
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
//    if (indexPath.row ==  _creatorArray.count -1) {
//       return (kScreenWidth -20)/16 *9 +10;
//    }
    return (kScreenWidth -20)/16 *9 +10;
}


#pragma mark -点击Cell的代理方法
-(void)creatorCoverCellTapIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(creatorTableViewTapWithIndex:)]) {
        [_delegateee creatorTableViewTapWithIndex:index];
    }
}

@end




