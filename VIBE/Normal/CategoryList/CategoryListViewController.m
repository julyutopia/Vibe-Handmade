//
//  CategoryListViewController.m
//  VIBE
//
//  Created by Li Haii on 2016/12/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryListViewController.h"

@interface CategoryListViewController ()

@end

@implementation CategoryListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.line setAlpha:0.0f];
    
    [self setIsWideNaviView:YES];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Category_List_Filter"] forState:UIControlStateNormal];
    
    _categoryProductsListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_categoryProductsListTable setBackgroundView:nil];
    [_categoryProductsListTable setBackgroundColor:[UIColor clearColor]];
    [_categoryProductsListTable setDelegate:self];
    [_categoryProductsListTable setDataSource:self];
    [_categoryProductsListTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _categoryProductsListTable.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    _categoryProductsListTable.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    [self.view insertSubview:_categoryProductsListTable belowSubview:self.topNavView];
    
    [self setContentData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _categoryProductsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_categoryProductsArray.count) {
        
        NSString * identifierString = @"CategoryListProductCellIdentifier";
        CategoryListProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[CategoryListProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        VibeProductModal * modal = [_categoryProductsArray objectAtIndex:indexPath.row];
        
        BOOL isLastCell = NO;
        if (indexPath.row == _categoryProductsArray.count -1) {
            isLastCell = YES;
        }
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
    if (indexPath.row == 0 || indexPath.row == _categoryProductsArray.count -1) {
        return (kScreenWidth-20)/4 +10;
    }
    else{
        return (kScreenWidth-20)/4;
    }
    return 0;
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_categoryProductsListTable]) {
        
        _tableViewOffsetY = scrollView.contentOffset.y;
        //隐藏 topNaviView 投影
        if (_tableViewOffsetY <= -Wide_Navi_View_Height +10) {
            if (self.line.alpha == 1.0f) {
                [UIView animateWithDuration:0.2 animations:^{
                    [self.line setAlpha:0.0f];
                }];
            }
        }
        else{
            if (self.line.alpha == 0.0f) {
                [UIView animateWithDuration:0.2 animations:^{
                    [self.line setAlpha:1.0f];
                }];
            }
        }
    }
}


#pragma mark -设置假数据
-(void)setContentData
{
    _categoryDetailModal = [[CategoryModal alloc]init];
    
    [_categoryDetailModal setCategoryTitle:@"女装"];
    
    NSMutableDictionary * detailDict0 = [[NSMutableDictionary alloc]init];
    [detailDict0 setObject:@"全部分类" forKey:@"categorySetName"];
 
    NSMutableDictionary * detailDict1 = [[NSMutableDictionary alloc]init];
    [detailDict1 setObject:@"T恤" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict2 = [[NSMutableDictionary alloc]init];
    [detailDict2 setObject:@"外套" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict3 = [[NSMutableDictionary alloc]init];
    [detailDict3 setObject:@"背心" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict4 = [[NSMutableDictionary alloc]init];
    [detailDict4 setObject:@"裙" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict5 = [[NSMutableDictionary alloc]init];
    [detailDict5 setObject:@"裤子" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict6 = [[NSMutableDictionary alloc]init];
    [detailDict6 setObject:@"配饰" forKey:@"categorySetName"];
    
    NSMutableArray * setArray = [[NSMutableArray alloc]initWithObjects:detailDict0, detailDict1, detailDict2, detailDict3,
                                                                        detailDict4, detailDict5, detailDict6, nil];
    _categoryDetailModal.categorySetArray = setArray;
    
    
    
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
    
    VibeProductModal * productModal4 = [[VibeProductModal alloc]init];
    [productModal4 setProductTitle:@"印度进口手工平织羊毛Kilim地毯 基利姆地毯 民族挂毯"];
    [productModal4 setProductImgURL:@"https://gd1.alicdn.com/imgextra/i1/0/TB1Upa1KVXXXXcvXVXXXXXXXXXX_!!0-item_pic.jpg"];
    [productModal4 setProductFavorCount:[NSNumber numberWithInt:21]];
    [productModal4 setProductPrice:@"768.00"];
    
    VibeProductModal * productModal5 = [[VibeProductModal alloc]init];
    [productModal5 setProductTitle:@"泰国原创设计师设计嬉皮手工吉普赛民族毛线耳环"];
    [productModal5 setProductImgURL:@"https://gd1.alicdn.com/imgextra/i3/738557733/TB20by_npXXXXXfXXXXXXXXXXXX_!!738557733.jpg"];
    [productModal5 setProductFavorCount:[NSNumber numberWithInt:237]];
    [productModal5 setProductPrice:@"158.00"];
    
    VibeProductModal * productModal6 = [[VibeProductModal alloc]init];
    [productModal6 setProductTitle:@"定制手工曼达拉上帝之眼mandala曼陀罗挂饰"];
    [productModal6 setProductImgURL:@"https://img.alicdn.com/imgextra/i3/1053084693/TB29Bm6fXXXXXbnXpXXXXXXXXXX_!!1053084693.jpg"];
    [productModal6 setProductFavorCount:[NSNumber numberWithInt:623]];
    [productModal6 setProductPrice:@"368.00"];

    _categoryProductsArray = [[NSMutableArray alloc]initWithObjects:productModal1,productModal2,productModal3,productModal4,
                                                                    productModal5,productModal6,productModal1,productModal2,
                                                                    productModal3,productModal4,productModal5,productModal6, nil];
    
    
    [self.titleLabel setText:_categoryDetailModal.categoryTitle];
    
    if (!_categorySetSegment) {
        
        //取得最宽的分类标题宽度
        float segmentTitleWidth = 0.0f;
        
        NSMutableArray * setArray = [[NSMutableArray alloc]init];
        for (int i =0; i <_categoryDetailModal.categorySetArray.count; i++) {
            
            NSDictionary * dict = [_categoryDetailModal.categorySetArray objectAtIndex:i];
            NSString * setName = [dict objectForKey:@"categorySetName"];
            [setArray addObject:setName];
            
            float setNameWidth = [setName getSizeWithLimitSize:CGSizeMake(100, 20) withFont: [UIFont fontWithName:Default_Font size:16]].width;
            
            if (setNameWidth >= segmentTitleWidth) {
                segmentTitleWidth = setNameWidth;
            }
        }
        
        _categorySetSegment = [[YUSegment alloc]initWithTitles:setArray style:YUSegmentStyleLine];
        [_categorySetSegment setFrame:CGRectMake(15, Wide_Navi_View_Height - 44, kScreenWidth -30, 44)];
        [_categorySetSegment setSegmentWidth:segmentTitleWidth +10];
        [_categorySetSegment.indicator setBackgroundColor:DefaultPinkColor];
        [_categorySetSegment addTarget:self action:@selector(categorySetNameDidChange) forControlEvents:UIControlEventValueChanged];
        [self.topNavView addSubview:_categorySetSegment];
        
        
        _filterView = [[CategoryListFilterView alloc]initWithFrame:CGRectMake(0, height_headerview, kScreenWidth, kScreenHeight -height_headerview) WithSingleItemHeight:50.0f];
        [_filterView setDelegateee:self];
        [_filterView setFilterWithImageNamesFirstNormal:@"Filter_Default_Normal" FirstSelected:@"Filter_Default_Selected" SecondNormal:@"Filter_Hot_Normal" SecondSelected:@"Filter_Hot_Selected" ThirdNormal:@"Filter_Price_Normal" ThirdSelected:@"Filter_Price_Selected" ButtonWidth:73 ButtonHeight:14];
        [self.view addSubview:_filterView];
    }
    
}


#pragma mark -点击 右侧筛选按钮
-(void)rightBtnClicked:(id)sender
{
    if (_filterView.isFilterViewShown == YES) {
        [_filterView hideFilterView];
        return;
    }
    
    [UIView animateWithDuration:0.25f animations:^{
        
        [_categorySetSegment setAlpha:0.0f];
        [self.line setAlpha:0.0f];
        [self.topNavView setBackgroundColor:RGBA(255, 255, 255, 100)];
        
        [_filterView showFilterView];
        [_categoryProductsListTable setUserInteractionEnabled:NO];
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark -筛选View已隐藏
-(void)categoryListFilrerViewDidHide
{
    [UIView animateWithDuration:0.15f animations:^{
        
        [_categorySetSegment setAlpha:1.0f];
        if (_tableViewOffsetY > -Wide_Navi_View_Height +10) {
            [self.line setAlpha:1.0f];
        }
        [self.topNavView setBackgroundColor:RGBA(255, 255, 255, 85)];
    }
    completion:^(BOOL finished){
        [_categoryProductsListTable setUserInteractionEnabled:YES];
    }];
}


#pragma mark -筛选FilterView的代理
-(void)categoryListFilterViewClickWithIndex:(NSInteger)index
{
    NSLog(@"_______%ld_________",index);
}

#pragma mark - 点击商品Cell代理方法
-(void)categoryListProductCellClickWithIndex:(NSInteger)index
{
    VibeProductModal * productModal = [_categoryProductsArray objectAtIndex:index];
    NewProductDetailViewController * productDetailVC = [[NewProductDetailViewController alloc]init];
    productDetailVC.productDetailModal = productModal;
    [self.lcNavigationController pushViewController:productDetailVC];
}


#pragma mark -点击导航分类的名字
-(void)categorySetNameDidChange
{
    NSLog(@"点击分类index：%ld  ---  %@",_categorySetSegment.selectedIndex,[_categoryDetailModal.categorySetArray objectAtIndex:_categorySetSegment.selectedIndex]);
}


#pragma mark -ViewWillApear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
