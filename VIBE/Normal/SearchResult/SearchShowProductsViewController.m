//
//  SearchShowProductsViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/1/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchShowProductsViewController.h"

@interface SearchShowProductsViewController ()

@end

@implementation SearchShowProductsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:DefaultBackgroundColor];

    [self initNaviBar];
    [self initTableview];
    [self setDataContent];
}


-(void)initNaviBar
{
    [self.backBtn setHidden:NO];
    [self.titleLabel setText:[NSString stringWithFormat:@"'%@'的商品搜索结果",self.searchKeyword]];
}


-(void)initTableview
{
    _resultsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_resultsTableView setBackgroundView:nil];
    [_resultsTableView setBackgroundColor:[UIColor clearColor]];
    [_resultsTableView setDelegate:self];
    [_resultsTableView setDataSource:self];
    [_resultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_resultsTableView setShowsVerticalScrollIndicator:NO];
    _resultsTableView.contentInset = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    _resultsTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    [self.view insertSubview:_resultsTableView belowSubview:self.topNavView];

    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
}


#pragma mark -tableview delegate & datasource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_productsArray.count) {
        return _productsArray.count;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _sectionFooterView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_productsArray.count) {
     
        NSString * identifierString = @"ProductsCellIdentifier";
        SearchProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[SearchProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        if (indexPath.row == 0) {
            cell.isFirstCell = YES;
        }
        
        BOOL isLastCell = NO;
        if (indexPath.row == _productsArray.count -1) {
            isLastCell = YES;
        }
        
        VibeProductModal * modal = [_productsArray objectAtIndex:indexPath.row];
        [cell setProductCellWithModal:modal WithIndex:indexPath.row IsLastCell:isLastCell];
        [cell setDelegateee:self];
        
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
    if (_productsArray.count) {
        return (kScreenWidth-20)/4;
    }
    
    return 0;
}


#pragma mark -productCell代理方法
-(void)searchProductCellClickWithProductID:(NSInteger)productID
{
    NewProductDetailViewController * productDetailVC = [[NewProductDetailViewController alloc]init];
    VibeProductModal * productModal;
    for (VibeProductModal *modal in _productsArray) {
        if ([modal.productID integerValue] == productID) {
            productModal = modal;
        }
    }
    productDetailVC.productDetailModal = productModal;
    [self.lcNavigationController pushViewController:productDetailVC];
}


-(void)setDataContent
{
    if (!_productsArray) {
        _productsArray = [[NSMutableArray alloc]init];
    }
    
    VibeProductModal * productModal1 = [[VibeProductModal alloc]init];
    [productModal1 setProductTitle:@"印度进口手工平织羊毛Kilim地毯 基利姆地毯 民族挂毯"];
    [productModal1 setProductImgURL:@"https://gd1.alicdn.com/imgextra/i1/0/TB1Upa1KVXXXXcvXVXXXXXXXXXX_!!0-item_pic.jpg"];
    [productModal1 setProductFavorCount:[NSNumber numberWithInt:21]];
    [productModal1 setProductPrice:@"768.00"];
    
    VibeProductModal * productModal2 = [[VibeProductModal alloc]init];
    [productModal2 setProductTitle:@"泰国原创设计师设计嬉皮手工吉普赛民族毛线耳环"];
    [productModal2 setProductImgURL:@"https://gd1.alicdn.com/imgextra/i3/738557733/TB20by_npXXXXXfXXXXXXXXXXXX_!!738557733.jpg"];
    [productModal2 setProductFavorCount:[NSNumber numberWithInt:237]];
    [productModal2 setProductPrice:@"158.00"];
    
    VibeProductModal * productModal3 = [[VibeProductModal alloc]init];
    [productModal3 setProductTitle:@"定制手工曼达拉上帝之眼mandala曼陀罗挂饰"];
    [productModal3 setProductImgURL:@"https://img.alicdn.com/imgextra/i3/1053084693/TB29Bm6fXXXXXbnXpXXXXXXXXXX_!!1053084693.jpg"];
    [productModal3 setProductFavorCount:[NSNumber numberWithInt:623]];
    [productModal3 setProductPrice:@"368.00"];
    
    [_productsArray addObject:productModal1];
    [_productsArray addObject:productModal2];
    [_productsArray addObject:productModal3];
    [_productsArray addObject:productModal1];
    [_productsArray addObject:productModal2];
    [_productsArray addObject:productModal3];
    [_productsArray addObject:productModal1];
    [_productsArray addObject:productModal2];
    [_productsArray addObject:productModal3];
    
    [_resultsTableView reloadData];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
