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
    if (section == 1) {
        return 10;
    }
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _sectionFooterView;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_itemDetailModal.itemGuessArray.count /2 >0) {
        return 6;
    }
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //猜你喜欢 商品Cell
    if (_itemDetailModal.itemGuessArray.count/2 && section == 5) {
        return _itemDetailModal.itemGuessArray.count/2;
    }
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
        
        [cell setDelegateee:self];
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
        
        [cell setDelegate:self];
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
    
    //猜你喜欢Cell
    if (_itemDetailModal.itemGuessArray.count /2 >0) {

        //标题
        if (indexPath.section == 4) {
            NSString * identifierString = @"ItemDetailGuessTitleTableViewCellIdentifier";
            
            ItemDetailGuessTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[ItemDetailGuessTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
        }
        
        //产品
        if (indexPath.section == 5) {
            NSString * identifierString = @"ItemDetailGuessTableViewCellIdentifier";
            
            ItemDetailGuessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[ItemDetailGuessTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            
            RecommandItemModal * leftModal;
            RecommandItemModal * rightModal;
            
            //左边
            if (indexPath.row *2 < _itemDetailModal.itemGuessArray.count) {
                leftModal = [_itemDetailModal.itemGuessArray objectAtIndex:indexPath.row *2];
            }
            //右边
            if (indexPath.row *2 +1 < _itemDetailModal.itemGuessArray.count) {
                rightModal = [_itemDetailModal.itemGuessArray objectAtIndex:indexPath.row *2 +1];
            }
            
            [cell setDelegateee:self];
            [cell setItemDetailGuessCellWithLeftItem:leftModal AndRightItem:rightModal];
            
            return cell;
        }
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
        
        float singlePhotoHeight = (kScreenWidth -60 -20 -12 *3)/3.5;
        return singlePhotoHeight;
    }
    if (indexPath.section == 3) {
        
        NSString * title = @"详细描述";
        
        float titleHeight = [title getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 20) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]].height;
        
        NSString * info = _itemDetailModal.itemDetailInfo;
        
        float infoHeight = [info getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]].height;
        
        //如果超过一行显示
        if (infoHeight >20) {
            infoHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:info withFont:[VibeFont fontWithName:Font_Chinese_Regular size:14] withWidth:kScreenWidth -60 -20 withLineSpacing:6.0] +2.0f;
        }
        
        float totalHeight = titleHeight +20 +infoHeight;
        return totalHeight;
    }
    
    //猜你喜欢Cell
    if (_itemDetailModal.itemGuessArray.count /2 > 0) {
        
        if (indexPath.section == 4) {
            
            NSString * title = @"猜你喜欢";
            float titleHeight = [title getSizeWithLimitSize:CGSizeMake(kScreenWidth -100, 20) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:12]].height;
            
            return titleHeight;
        }
        
        else if (indexPath.section == 5){
            
            float itemWidth = ((kScreenWidth -60 -20) -20)/2;
            float itemHeight = itemWidth +55;
            
            return itemHeight +20;
        }
    }
    
    return 0;
}



#pragma mark Cell的代理方法

//点击分享按钮
-(void)ItemDetailTopCellTapShareBtn
{

}

//点击收藏按钮
-(void)ItemDetailTopCellTapFavorBtn
{

}

//点击购买按钮
-(void)ItemDetailTopCellTapBuyBtn
{

}

//点击详情图片
-(void)itemDetailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger)index
{
    if (imagesArray.count && index <= imagesArray.count -1) {
        [XLPhotoBrowser showPhotoBrowserWithImages:imagesArray currentImageIndex:index];
    }
}

//点击 猜你喜欢 单品的代理
-(void)itemDetailGuessCellDidClickItemWithID:(NSInteger)itemID
{
    ItemDetailViewController * itemDetailVC = [[ItemDetailViewController alloc]init];
    itemDetailVC.itemDetailID = itemID;
    [self.lcNavigationController pushViewController:itemDetailVC];
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
