//
//  NewRecommandTableView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "NewRecommandTableView.h"

@implementation NewRecommandTableView

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
    if (section == 0) {
        if ( [[VibeAppTool sharedInstance]isUserLogIn]) {
            return 15;
        }
        else{
            return 0;
        }
    }
    
    if (section == 1) {
        return 10;
    }
    
    if (section == 3) {
        return 5;
    }
    
    return 25;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _sectionFooterView;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 4) {
        return [AppDelegate sharedAppDelegate].recommandItemsArray.count /2;
    }
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Hello
    if (indexPath.section == 0) {
        
        NSString * identifierString = @"RecommandHelloCellIdentifier";
        
        RecommandHelloTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandHelloTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        [cell setHelloTableCellInfo];
        
        return cell;
    }
    
    
    //Banner
    if (indexPath.section == 1 ) {
        
        NSString * identifierString = @"RecommandTopCellIdentifier";
        
        RecommandTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        NSArray * topInfoArray = [AppDelegate sharedAppDelegate].recommandTopArray;
        [cell setRecommandTopCellWithInfos:topInfoArray];
        
        return cell;
    }

    //分类
    if (indexPath.section == 2 ) {
        
        NSString * identifierString = @"RecommandCateCellIdentifier";
        
        RecommandCateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandCateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        NSArray * cateArray = [AppDelegate sharedAppDelegate].recommandCateArray;
        [cell setCateCellWithInfo:cateArray];
        
        return cell;
    }
    
    //为你而选
    if (indexPath.section == 3) {
        
        NSString * identifierString = @"RecommandPickCellIdentifier";
        
        RecommandPickTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandPickTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setRecommandPickItem:[AppDelegate sharedAppDelegate].recommnadPickModal];
        
        return cell;
    }
    
    //精选商品
    if (indexPath.section == 4) {
        
        NSString * identifierString = @"RecommandItemCellIdentifier";
        
        RecommandItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandItemsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegateee:self];
        
        RecommandItemModal * leftModal = [[AppDelegate sharedAppDelegate].recommandItemsArray objectAtIndex:indexPath.row *2];
        RecommandItemModal * rightModal = [[AppDelegate sharedAppDelegate].recommandItemsArray objectAtIndex:indexPath.row *2 +1];
        
        [cell setItemsCellWithLeftItem:leftModal AndRightItem:rightModal];
        
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
        //登录时显示Hello
        if ([[VibeAppTool sharedInstance] isUserLogIn]) {
            return 16;
        }
        else{
            return 0;
        }
    }
    
    if (indexPath.section == 1) {
        
        float topViewWidth = kScreenWidth -50;
        float topViewHeight = topViewWidth/16*9;
        return topViewHeight +Blur_Back_Height;
    }
    
    if (indexPath.section ==2) {
        
        float categoryViewWidth = ((kScreenWidth -50) - 12 *4)/5;
        return 20 +20 +categoryViewWidth *2 +12;
    }
    
    if (indexPath.section == 3) {
        
        float pickHeight = 20 +20 + (kScreenWidth -50) +20;
        return pickHeight;
    }
    
    if (indexPath.section == 4) {
        
        float itemWidth = ((kScreenWidth -55) -25)/2;
        float itemHeight = itemWidth +55;
        
        return itemHeight +12;
    }
    
    return 0;
}


#pragma mark -Table的代理方法
-(void)recommandItemCellDidClickItemWithID:(NSInteger)itemID
{
    if ([self.delegateee respondsToSelector:@selector(recommandTableViewShowItemDetailWithID:)]) {
        [self.delegateee recommandTableViewShowItemDetailWithID:itemID];
    }
}



@end






