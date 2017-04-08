//
//  NewCreatorTableView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "NewCreatorTableView.h"

@implementation NewCreatorTableView

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
    return [AppDelegate sharedAppDelegate].creatorsArray.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //双数行显示
    if (indexPath.section %2 == 0) {
                
        NSString * identifierString = @"CreatorDoubleTableViewCellIdentifier";
        
        CreatorDoubleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[CreatorDoubleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
    
        [cell setCreatorDoubleTableCellWithModal:[[AppDelegate sharedAppDelegate].creatorsArray objectAtIndex:indexPath.section]];
        
        return cell;
    }
    
    
    else if (indexPath.section %2 == 1){
        NSString * identifierString = @"CreatorSingleTableViewCellIdentifier";
        
        CreatorSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[CreatorSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setCreatorSingleTableCellWithModal:[[AppDelegate sharedAppDelegate].creatorsArray objectAtIndex:indexPath.section]];
        
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
    if (indexPath.section %2 == 0) {
        
        CreatorCoverModal * modal = [[AppDelegate sharedAppDelegate].creatorsArray objectAtIndex:indexPath.section];
        
        NSString * sloganTitle = modal.CreatorSloganTitle;

        
        float sloganTitleHeight = [sloganTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -50, 100) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]].height;
        
        //如果超过一行显示
        if (sloganTitleHeight >20) {
            
            sloganTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:modal.CreatorSloganTitle withFont:[VibeFont fontWithName:Font_Chinese_Regular size:14] withWidth:kScreenWidth -50 withLineSpacing:4.0];
        }
        
        float photoImgViewHeight = (kScreenWidth -50)/16 *9;
        
        float singleMorePhotoViewWidth = (kScreenWidth -50 - 12 *4) /5;
        
        float totalViewHeight = photoImgViewHeight +15 +27 +8 +sloganTitleHeight +15 +singleMorePhotoViewWidth;
        return totalViewHeight;
    }
    
    else{
        
        return kScreenWidth -50 +2;
    }
    
    
    return 600;
}

@end
