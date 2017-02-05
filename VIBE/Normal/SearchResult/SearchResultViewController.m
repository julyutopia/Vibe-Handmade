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
    
    [self.view setBackgroundColor:DefaultBackgroundColor];
    
    [self initNaviBar];
    [self initTableview];
    
    [self setDataContent];
}


-(void)initNaviBar
{
    [self.backBtn setHidden:NO];
    
    [self.titleLabel setText:[NSString stringWithFormat:@"'%@'的搜索结果",self.searchKeyword]];
    
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
    [_resultsTableView setShowsVerticalScrollIndicator:NO];
    _resultsTableView.contentInset = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    _resultsTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    [self.view insertSubview:_resultsTableView belowSubview:self.topNavView];

    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
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
    if (_productsArray.count >0 && _topicsArray.count ==0)
    {
        //搜索产品header
        if (indexPath.row == 0) {
            
            NSString * identifierString = @"ProductsHeaderCellIdentifier";
            SearchProductsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchProductsHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
            
        }
        
        //搜索产品cell
        else{
            
            NSString * identifierString = @"ProductsCellIdentifier";
            SearchProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            VibeProductModal * modal = [_productsArray objectAtIndex:indexPath.row -1];
            
            BOOL isLastCell = NO;
            if (indexPath.row == _productsArray.count) {
                isLastCell = YES;
            }
            [cell setProductCellWithModal:modal WithIndex:indexPath.row-1 IsLastCell:isLastCell];
            [cell setDelegateee:self];
            
            return cell;
            
        }
    }
    
    
    if (_productsArray.count ==0 && _topicsArray.count >0)
    {
        //搜索专题header
        if (indexPath.row == 0) {
            
            NSString * identifierString = @"TopicsHeaderCellIdentifier";
            SearchTopicHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchTopicHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
            
        }
        
        else{
            
            NSString * identifierString = @"SearchTopicCellIdentifier";
            SearchTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            [cell setDelegate:self];
            
            VibeTopicModal * modal = [_topicsArray objectAtIndex:indexPath.row -1];
            
            BOOL isLastCell = NO;
            if (indexPath.row == _topicsArray.count) {
                isLastCell = YES;
            }
            [cell setSearchTopicCellWithModal:modal IsLast:isLastCell];
            
            return cell;
            
        }
    }
    
    
    if (_productsArray.count >0 && _topicsArray.count >0)
    {
        //搜索商品列表
        if (indexPath.section == 0) {
            
            if (indexPath.row ==0) {
                
                NSString * identifierString = @"ProductsHeaderCellIdentifier";
                SearchProductsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchProductsHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                return cell;
                
            }
            
            //底部显示全部的Cell
            else if (indexPath.row == _productsArray.count +1){
                
                NSString * identifierString = @"ProductsFooterCellIdentifier";
                SearchProductsAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchProductsAllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                
                [cell setDelegateee:self];
                
                return cell;
            }
            
            else{
             
                NSString * identifierString = @"ProductsCellIdentifier";
                SearchProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                
                VibeProductModal * modal = [_productsArray objectAtIndex:indexPath.row -1];
                [cell setProductCellWithModal:modal WithIndex:indexPath.row-1 IsLastCell:NO];
                [cell setDelegateee:self];
                
                return cell;
            }
        }
        
        //搜索专题列表
        else{
            
            if (indexPath.row ==0) {
                
                NSString * identifierString = @"TopicsHeaderCellIdentifier";
                SearchTopicHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchTopicHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                return cell;

            }
            //底部显示全部的Cell
            else if (indexPath.row == _topicsArray.count +1)
            {
                
                NSString * identifierString = @"TopicsFooterCellIdentifier";
                SearchTopicAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchTopicAllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                
                [cell setDelegateee:self];
                
                return cell;
                
            }
            else{
             
                NSString * identifierString = @"SearchTopicCellIdentifier";
                SearchTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
                if (cell == nil) {
                    cell = [[SearchTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    [cell setBackgroundColor:[UIColor clearColor]];
                    [cell setBackgroundView:nil];
                }
                [cell setDelegate:self];
                
                VibeTopicModal * modal = [_topicsArray objectAtIndex:indexPath.row -1];
                [cell setSearchTopicCellWithModal:modal IsLast:NO];
                
                return cell;
                
            }
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
    if (_productsArray.count >0 && _topicsArray.count ==0)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else
        {
            return (kScreenWidth-20)/4;
        }
    }
    
    if (_productsArray.count ==0 && _topicsArray.count >0)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        else {
            float heightt = (kScreenWidth -40)/3 +10;
            return heightt;
        }
    }
    
    if (_productsArray.count >0 && _topicsArray.count >0)
    {
        //搜索商品列表
        if (indexPath.section ==0) {
            
            if (indexPath.row == 0) {
                return 44;
            }
            else if(indexPath.row == _productsArray.count +1)
            {
                return 37;
            }
            else{
                return (kScreenWidth-20)/4;
            }
        }
        //搜索专题列表
        else if (indexPath.section == 1){
            
            if (indexPath.row == 0) {
                return 44;
            }
            else if(indexPath.row == _topicsArray.count +1)
            {
                return 37;
            }
            else{
                float heightt = (kScreenWidth -40)/3 +10;
                return heightt;
            }
        }
    }
    
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
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

#pragma mark -点击搜索关键字
-(void)searchViewDidSearch:(NSString *)keyword
{
    NSLog(@"搜索列表页点击搜索");
}


#pragma mark -点击搜索商品的代理方法
-(void)searchProductCellClickWithProductID:(NSInteger )productID
{
    ProductDetailViewController * productDetailVC = [[ProductDetailViewController alloc]init];
    VibeProductModal * productModal;
    for (VibeProductModal *modal in _productsArray) {
        if ([modal.productID integerValue] == productID) {
            productModal = modal;
        }
    }
    productDetailVC.productDetailModal = productModal;
    [self.lcNavigationController pushViewController:productDetailVC];
}

#pragma mark -显示全部搜索商品的代理方法
-(void)searchProductShowAllResults
{
    SearchShowProductsViewController * showProductsVC = [[SearchShowProductsViewController alloc]init];
    showProductsVC.searchKeyword = self.searchKeyword;
    [self.lcNavigationController pushViewController:showProductsVC];
}

#pragma mark -点击搜索专题的代理方法
-(void)searchTopicCellClickWithTopicID:(NSInteger)topicID
{

}

#pragma mark -显示全部搜索专题的代理方法
-(void)searchTopicsShowAllResults
{
    SearchShowTopicsViewController * showTopicsVC = [[SearchShowTopicsViewController alloc]init];
    showTopicsVC.searchKeyword = self.searchKeyword;
    [self.lcNavigationController pushViewController:showTopicsVC];
}


#pragma mark -创建数据
-(void)setDataContent
{
    if (!_productsArray) {
        _productsArray = [[NSMutableArray alloc]init];
    }
    if (!_topicsArray) {
        _topicsArray = [[NSMutableArray alloc]init];
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
    
    VibeTopicModal * topicModal1 = [[VibeTopicModal alloc]init];
    [topicModal1 setTopicImgURL:@"http://p1.bpimg.com/567571/ee75e81e22b17865.png"];
    [topicModal1 setTopicTitle:@"迷醉于土耳其的绚丽多彩"];
    [topicModal1 setTopicID:[NSNumber numberWithInteger:1]];
    NSArray * tagArray1 = [NSArray arrayWithObjects:@"旅行",@"民族风",@"土耳其",@"异域", nil];
    topicModal1.topicTagsArray = [NSArray arrayWithArray:tagArray1];
    [topicModal1 setTopicLookedNumber:[NSNumber numberWithInteger:873]];
    [topicModal1 setTopicFavorNumber:[NSNumber numberWithInteger:302]];
    
    VibeTopicModal * topicModal2 = [[VibeTopicModal alloc]init];
    [topicModal2 setTopicImgURL:@"http://p1.bpimg.com/567571/aec75762d5f7a4c0.png"];
    [topicModal2 setTopicTitle:@"食之精,器之美"];
    [topicModal2 setTopicID:[NSNumber numberWithInteger:2]];
    NSArray * tagArray2 = [NSArray arrayWithObjects:@"家居",@"美食与爱",@"木器", nil];
    topicModal2.topicTagsArray = [NSArray arrayWithArray:tagArray2];
    [topicModal2 setTopicLookedNumber:[NSNumber numberWithInteger:257]];
    [topicModal2 setTopicFavorNumber:[NSNumber numberWithInteger:51]];
    
    VibeTopicModal * topicModal3 = [[VibeTopicModal alloc]init];
    [topicModal3 setTopicImgURL:@"http://p1.bpimg.com/567571/a7d8dfbccdee4778.png"];
    [topicModal3 setTopicTitle:@"自由肆意的吉普赛风情"];
    [topicModal3 setTopicID:[NSNumber numberWithInteger:3]];
    NSArray * tagArray3 = [NSArray arrayWithObjects:@"首饰",@"手工原创",@"部落风", nil];
    topicModal3.topicTagsArray = [NSArray arrayWithArray:tagArray3];
    [topicModal3 setTopicLookedNumber:[NSNumber numberWithInteger:2416]];
    [topicModal3 setTopicFavorNumber:[NSNumber numberWithInteger:1632]];

    [_topicsArray addObject:topicModal1];
    [_topicsArray addObject:topicModal2];
    [_topicsArray addObject:topicModal3];
    
    
    [_resultsTableView reloadData];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end
