//
//  SearchResultViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/1/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNaviBar];
    [self initTableview];
}


-(void)initNaviBar
{
    [self.backBtn setHidden:NO];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setFrame:CGRectMake(kScreenWidth -15 -18, 30, 18, 18)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Navi_Search"] forState:UIControlStateNormal];
}

-(void)initTableview
{
    _resultsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_resultsTableView setBackgroundView:nil];
    [_resultsTableView setBackgroundColor:[UIColor clearColor]];
    [_resultsTableView setDelegate:self];
    [_resultsTableView setDataSource:self];
    [_resultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _resultsTableView.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    _resultsTableView.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    [self.view insertSubview:_resultsTableView belowSubview:self.topNavView];

    
    _topicHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_topicHeaderView setBackgroundColor:[UIColor clearColor]];
    
}


#pragma mark -tableview delegate & datasource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    //只有产品，没有专题
    if (_productsArray.count >0 && _topicsArray.count ==0) {
        return 1;
    }
    //只有专题，没有产品
    if (_productsArray.count ==0 && _topicsArray.count >0) {
        return 1;
    }
    //既有产品，也有专题
    if (_productsArray.count >0 && _topicsArray.count >0) {
        return 2;
    }
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_productsArray.count >0 && _topicsArray.count ==0) {
        return _productsArray.count +1;
    }
    
    if (_productsArray.count ==0 && _topicsArray.count >0) {
        return _topicsArray.count +1;
    }
    if (_productsArray.count >0 && _topicsArray.count >0) {
        if (section == 0) {
            return _productsArray.count +2;
        }
        if (section == 1) {
            return _topicsArray.count +2;
        }
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 15;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return _topicHeaderView;
    }
    return nil;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_productsArray.count >0 && _topicsArray.count ==0) {
        
//        NSString * identifierString = @"CategoryListProductCellIdentifier";
//        CategoryListProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
//        if (cell == nil) {
//            cell = [[CategoryListProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            [cell setBackgroundColor:[UIColor clearColor]];
//            [cell setBackgroundView:nil];
//        }
//        return cell;
        
    }
    if (_productsArray.count ==0 && _topicsArray.count >0)
    {
        
    }
    
    if (_productsArray.count >0 && _topicsArray.count >0)
    {
        
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
    return 0;
}


#pragma mark -点击搜索按钮
-(void)rightBtnClicked:(id)sender
{
    if (!_searchView) {
        _searchView = [[VibeSearchView alloc]initWithFrame:self.view.frame];
        [_searchView setDelegateee:self];
        [self.view addSubview:_searchView];
    }
    
    [_searchView showSearchView];
    
    [self hideTopviewSubviews];
}

#pragma mark -显示/隐藏 导航栏控件
-(void)hideTopviewSubviews
{
    [UIView animateWithDuration:0.15f animations:^{
        
        [self.backBtn setAlpha:0.0f];
        [self.rightButton setAlpha:0.0f];
 
    }];
}

-(void)showTopviewSubviews
{
    [UIView animateWithDuration:1.2f animations:^{
        
        [self.backBtn setAlpha:1.0f];
        [self.rightButton setAlpha:1.0f];
        
    }];
}

-(void)searchViewDidHide
{
    [self showTopviewSubviews];
}

#pragma mark -点击搜索关键字
-(void)searchViewDidSearch:(NSString *)keyword
{
    
}

@end
