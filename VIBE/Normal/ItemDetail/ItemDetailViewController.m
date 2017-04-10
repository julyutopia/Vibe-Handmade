//
//  ItemDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _itemDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_itemDetailTableView setBackgroundView:nil];
    [_itemDetailTableView setBackgroundColor:[UIColor clearColor]];
    [_itemDetailTableView setDelegate:self];
    [_itemDetailTableView setDataSource:self];
    [_itemDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_itemDetailTableView setShowsVerticalScrollIndicator:NO];
    [_itemDetailTableView setContentInset:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [_itemDetailTableView setScrollIndicatorInsets:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [self.view addSubview:_itemDetailTableView];
    
    
    [self.navigationView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.naviBlurView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.view bringSubviewToFront:self.navigationView];
    
    [self.view bringSubviewToFront:self.leftBtn];
    
    
    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    
    _itemDetailModal = [[ItemDetailModal alloc]init];
    _itemDetailModal = [AppDelegate sharedAppDelegate].itemDetailModal;
}


#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    
    return 20;
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
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //封图Cell
    if (indexPath.section == 0) {
        
        NSString * identifierString = @"ItemDetailTopTableViewCellIdentifier";
        
        ItemDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ItemDetailTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDetailTopCellWithModal:_itemDetailModal];
        
        return cell;
    }
    
    //标题Cell
    if (indexPath.section == 1) {
        
        NSString * identifierString = @"ItemDetailTitleTableViewCellIdentifier";
        
        ItemDetailTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ItemDetailTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDetailTitleCellWithModal:_itemDetailModal];
        
        return cell;
    }
    
    //更多图片Cell
    if (indexPath.section == 2) {
        
        NSString * identifierString = @"ItemDetailPhotoViewTableViewCellIdentifier";
        
        ItemDetailPhotoViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ItemDetailPhotoViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setItemDetailPhotoCellWithInfo:_itemDetailModal.itemMorePhotosUrlsArray];
        
        return cell;
    }
    
    //详细描述Cell
    if (indexPath.section == 3) {
        
        NSString * identifierString = @"ItemDetailInfoTableViewCellIdentifier";
        
        ItemDetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ItemDetailInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setItemDetailInfoCellWithModal:_itemDetailModal];
        
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
        
        float photoImgViewWidth = kScreenWidth -60;
        return photoImgViewWidth +30;
    }
    if (indexPath.section == 1) {
        
        float titleLabelHeight = [_itemDetailModal.itemTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 30) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:18]].height;
        
        float priceLabelHeight = [_itemDetailModal.itemPrice getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 30) withFont:[VibeFont fontWithName:Font_English_Bold size:18]].height;;
        
        return  titleLabelHeight +8 +priceLabelHeight;
    }
    if (indexPath.section == 2) {
        
        float singlePhotoHeight = (kScreenWidth -60 -15 *2)/3.5;
        return singlePhotoHeight;
    }
    if (indexPath.section == 3) {
        
        float infoHeight = 300;
        return infoHeight;
    }
    
    return 0;
}



#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
