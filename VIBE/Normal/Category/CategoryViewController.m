//
//  CategoryViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryViewController.h"

CGFloat const kSFFocusViewLayoutStandardHeight = 300;

static NSString * const kSFCollectionViewReuseIdentifier = @"__kSFCollectionViewReuseIdentifier";

static NSString *kRecommandSectionHeadCell = @"kRecommandSectionHeadCell";


@interface CategoryViewController ()

@end

#define CategoryCollectionIndent @"CategoryCollectionIndent"

@implementation CategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];

    self.naviBarType = 0;
    
    [self.backBtn setHidden:YES];
    [self.titleLabel setHidden:YES];
    [self.titleImgView setHidden:YES];
    
    [self.topNavView setHidden:YES];
    
    
    UIImageView * blurBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [blurBackImgView setImage:[UIImage imageNamed:@"Category_Blur"]];
    [self.view addSubview:blurBackImgView];
    
    
    _categoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_categoryTableView setBackgroundView:nil];
    [_categoryTableView setBackgroundColor:[UIColor clearColor]];
    [_categoryTableView setDelegate:self];
    [_categoryTableView setDataSource:self];
    [_categoryTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _categoryTableView.contentInset = UIEdgeInsetsMake(height_headerview, 0, 0, 0);
    _categoryTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview, 0, 0, 0);
    [self.view addSubview:_categoryTableView];

    _categoryFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_categoryFooterView setBackgroundColor:[UIColor clearColor]];
    
    
    _headerView = [[UIImageView alloc]initWithFrame:self.topNavView.frame];
    [_headerView setImage:[UIImage imageNamed:@"Green_Header"]];
    [_headerView setUserInteractionEnabled:YES];
    [self.view addSubview:_headerView];
    
    _searchView = [[CategorySearchView alloc]initWithFrame:CGRectMake(20, 28, kScreenWidth -40, 24)];
    [_searchView setDelegate:self];
    [_headerView addSubview:_searchView];
    
//    [self.view bringSubviewToFront:_headerView];
    
    _categoryHotArray = [[NSMutableArray alloc]init];
    _categorysArray = [[NSMutableArray alloc]init];
    _categoryStoresArray = [[NSMutableArray alloc]init];
    [self setContentData];
    
}



#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 20;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section ==3) {
        return _categoryFooterView;
    }
    return nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==2 && _categorysArray.count) {
        return _categorysArray.count /3;
    }
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        NSString * indentifier = @"CategoryHotCellIdentifier";
        
        CategoryHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[CategoryHotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setHotCellWithContent:_categoryHotArray];
        
        return cell;
    }
    
    
    if (indexPath.section == 1) {

        NSString * indentifier = @"CategoryTopCellIdentifier";

        CagoryInfoTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[CagoryInfoTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        return cell;
    }
    
    if (indexPath.section ==2 && _categorysArray.count) {
        
        NSString * indentifier = @"CategoryCateCellIdentifier";
        
        CagoryCateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[CagoryCateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
            
            [cell setDelegate:self];
        }
        
        NSInteger from = indexPath.row * 3;
        
        
        CategoryModal * modal1 = nil;
        CategoryModal * modal2 = nil;
        CategoryModal * modal3 = nil;
        
        if (from < _categorysArray.count -1) {
            modal1 = [_categorysArray objectAtIndex:from];
        }
        if (from+1 < _categorysArray.count -1) {
            modal2 = [_categorysArray objectAtIndex:from+1];
        }
        if (from+2 <= _categorysArray.count -1) {
            modal3 = [_categorysArray objectAtIndex:from+2];
        }
        [cell setCategoryCellWithFirstCategory:modal1 AndSecondCategory:modal2 AndThirdCategory:modal3];
        
        return cell;
    }
 
    if (indexPath.section == 3) {
        
        NSString * indentifier = @"CategoryBotoomCellIdentifier";
        
        CategoryBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[CategoryBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        [cell setDelegate:self];
        
        return cell;
    }
   
    if (indexPath.section == 4) {
        
        NSString * indentifier = @"CategoryStoreCellIdentifier";
        
        CategoryStoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[CategoryStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setCategoryStoreCellWithContent:_categoryStoresArray];
        
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
     
        float contentWidth = (kScreenWidth -15 - 30 *4) / 4.5;
        return contentWidth +10;
    }
    
    if (indexPath.section == 1) {
        
        float imgViewHeightt = 19;
        return 15 +imgViewHeightt +15;
    }
    
    if (indexPath.section == 2 && _categorysArray.count) {
        
        float imgWidth = (kScreenWidth -30)/3;
        return imgWidth;
    }
    
    if (indexPath.section ==3) {
        
        float heightt = 14;
        return 15 +heightt +10;
    }
    
    if (indexPath.section ==4) {
        
        float titleHeightt = 19;
        int storeViewHeight = (int)(kScreenWidth -(15 +10 +20 +15))/1.5;
        return 15 +titleHeightt +15 + storeViewHeight +10 + TabBarHeight +20;
    }
    
    return 0;
}










#pragma mark 点击搜索代理方法
-(void)didTapSearchView
{
    NSLog(@"______点击搜索______");
}

#pragma mark 点击热门代理方法
-(void)categoryHotCellTapIndex:(NSInteger)index
{
    if (index < _categorysArray.count -1) {
        NSLog(@"__________点击分类的话题 %ld__________",index);
        CategoryHotModal * hotModal = [_categorysArray objectAtIndex:index];
    }
}

#pragma mark 点击分类代理方法
-(void)categoryCellTapWithModalID:(NSInteger )modalID
{
    NSLog(@"——————————点击分类ID: %ld———————————",modalID);
}

#pragma mark 点击显示全部分类代理方法
-(void)categoryCellShowAll
{
    NSLog(@"点击全部分类");
    
    AllCategoryViewController * allCateVC = [[AllCategoryViewController alloc]init];
    [self.currentVC.lcNavigationController pushViewController:allCateVC];
}

#pragma mark 点击分类店铺的代理方法
-(void)categoryCellDidTapWithStoreID:(NSInteger )storeID
{
    NSLog(@"_____点击店铺ID:%ld_________",storeID);
}



-(void)setContentData
{
    
    CategoryHotModal * hotModal1 = [[CategoryHotModal alloc]init];
    [hotModal1 setCategoryHotImgURL:@"https://img3.doubanio.com/view/dianpu_shop_icon/large/public/2fffcea2f47f45f.jpg"];
    [_categoryHotArray addObject:hotModal1];
    
    CategoryHotModal * hotModal2 = [[CategoryHotModal alloc]init];
    [hotModal2 setCategoryHotImgURL:@"https://img3.doubanio.com/view/dianpu_shop_icon/large/public/3a780b6bb62c6f2.jpg"];
    [_categoryHotArray addObject:hotModal2];
    
    CategoryHotModal * hotModal3 = [[CategoryHotModal alloc]init];
    [hotModal3 setCategoryHotImgURL:@"https://img1.doubanio.com/view/dianpu_shop_icon/large/public/00103467c96e12c.jpg"];
    [_categoryHotArray addObject:hotModal3];
    
    CategoryHotModal * hotModal4 = [[CategoryHotModal alloc]init];
    [hotModal4 setCategoryHotImgURL:@"https://img3.doubanio.com/view/dianpu_shop_icon/large/public/289aa28cf5b2c43.jpg"];
    [_categoryHotArray addObject:hotModal4];
    
    CategoryHotModal * hotModal5 = [[CategoryHotModal alloc]init];
    [hotModal5 setCategoryHotImgURL:@"https://img3.doubanio.com/view/dianpu_shop_icon/large/public/eb1de673cdbdfa0.jpg"];
    [_categoryHotArray addObject:hotModal5];
    
    
    CategoryModal * modal1 = [[CategoryModal alloc]init];
    [modal1 setCategoryIconUrl:@"http://i2.buimg.com/4851/1161518eae2429af.png"];
    [modal1 setCategoryID:[NSNumber numberWithInteger:1]];
    
    CategoryModal * modal2 = [[CategoryModal alloc]init];
    [modal2 setCategoryIconUrl:@"http://i2.buimg.com/4851/0f387bce074f2952.png"];
    [modal2 setCategoryID:[NSNumber numberWithInteger:2]];
    
    CategoryModal * modal3 = [[CategoryModal alloc]init];
    [modal3 setCategoryIconUrl:@"http://i2.buimg.com/4851/fe80138c9a514db4.png"];
    [modal3 setCategoryID:[NSNumber numberWithInteger:3]];

    CategoryModal * modal4 = [[CategoryModal alloc]init];
    [modal4 setCategoryIconUrl:@"http://i2.buimg.com/4851/ef2302bffb07a8d7.png"];
    [modal4 setCategoryID:[NSNumber numberWithInteger:4]];
  
    CategoryModal * modal5 = [[CategoryModal alloc]init];
    [modal5 setCategoryIconUrl:@"http://i2.buimg.com/4851/52c87d82c986b3a0.png"];
    [modal5 setCategoryID:[NSNumber numberWithInteger:5]];
    
    CategoryModal * modal6 = [[CategoryModal alloc]init];
    [modal6 setCategoryIconUrl:@"http://i2.buimg.com/4851/149f5b8d6016b5e6.png"];
    [modal6 setCategoryID:[NSNumber numberWithInteger:6]];
    
    CategoryModal * modal7 = [[CategoryModal alloc]init];
    [modal7 setCategoryIconUrl:@"http://i2.buimg.com/4851/729a242b9d1ca3a1.png"];
    [modal7 setCategoryID:[NSNumber numberWithInteger:7]];
    
    CategoryModal * modal8 = [[CategoryModal alloc]init];
    [modal8 setCategoryIconUrl:@"http://i2.buimg.com/4851/abcf7623fea1ac9c.png"];
    [modal8 setCategoryID:[NSNumber numberWithInteger:8]];
    
    CategoryModal * modal9 = [[CategoryModal alloc]init];
    [modal9 setCategoryIconUrl:@"http://i2.buimg.com/4851/6553093779c53042.png"];
    [modal9 setCategoryID:[NSNumber numberWithInteger:9]];
    
    [_categorysArray addObject:modal1];
    [_categorysArray addObject:modal2];
    [_categorysArray addObject:modal3];
    [_categorysArray addObject:modal4];
    [_categorysArray addObject:modal5];
    [_categorysArray addObject:modal6];
    [_categorysArray addObject:modal7];
    [_categorysArray addObject:modal8];
    [_categorysArray addObject:modal9];
    
    


    //商店
    CategoryStoreModal * storeModal1 = [[CategoryStoreModal alloc]init];
    [storeModal1 setStoreID:[NSNumber numberWithInteger:1]];
    [storeModal1 setStoreTitle:@"Dreamer手工饰品"];
    [storeModal1 setStoreOwnerName:@"lovableangel"];
    [storeModal1 setStoreIconImgURL:@"https://img.alicdn.com/bao/uploaded//524561486/TB21mWVcFXXXXaXXXXXXXXXXXXX_!!524561486-0-guide.jpg_50x50.jpg"];
    [storeModal1 setStoreSloganString:@"东南亚手工饰品生活店"];
    [storeModal1 setStoreIsFavored:YES];
    
    NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"https://gd2.alicdn.com/bao/uploaded/i2/524561486/TB2K40riVXXXXbjXpXXXXXXXXXX_!!524561486-0-taoxiaopu_sell.jpg_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"https://gd4.alicdn.com/bao/uploaded/i4/524561486/TB2sGEmhFXXXXa0XXXXXXXXXXXX_!!524561486-0-taoxiaopu_sell.jpg_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"https://gd4.alicdn.com/bao/uploaded/i4/524561486/TB2k2wScVXXXXapXpXXXXXXXXXX_!!524561486-2-taoxiaopu_sell.png_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:@"https://gd2.alicdn.com/bao/uploaded/i2/524561486/TB2hhIuhFXXXXctXpXXXXXXXXXX_!!524561486-0-taoxiaopu_sell.jpg_400x400.jpg" forKey:@"storeImageURL"];
    
    NSMutableArray * arr1 = [NSMutableArray array];
    [arr1 addObject:dict1];
    [arr1 addObject:dict2];
    [arr1 addObject:dict3];
    [arr1 addObject:dict4];
    

    
    
    CategoryStoreModal * storeModal2 = [[CategoryStoreModal alloc]init];
    [storeModal2 setStoreID:[NSNumber numberWithInteger:2]];
    [storeModal2 setStoreTitle:@"小喜xiaoxi"];
    [storeModal2 setStoreOwnerName:@"喜儿8722"];
    [storeModal2 setStoreIconImgURL:@"https://img.alicdn.com/bao/uploaded//97/9b/TB11.hqMpXXXXXQXpXXSutbFXXX.jpg_50x50.jpg"];
    [storeModal2 setStoreSloganString:@"Self Made Hand Craft"];
    [storeModal2 setStoreIsFavored:NO];
    
    NSMutableDictionary * dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:@"https://gd1.alicdn.com/bao/uploaded/i1/49085078/TB2a.GOmFXXXXa0XXXXXXXXXXXX_!!49085078.jpg_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict6 = [NSMutableDictionary dictionary];
    [dict6 setObject:@"https://gd4.alicdn.com/bao/uploaded/i4/0/TB2F9KksFXXXXa2XpXXXXXXXXXX_!!0-taoxiaopu_sell.jpg_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict7 = [NSMutableDictionary dictionary];
    [dict7 setObject:@"https://gd2.alicdn.com/bao/uploaded/i2/49085078/TB2jHwHopXXXXXpXXXXXXXXXXXX_!!0-taoxiaopu_sell.jpg_400x400.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict8 = [NSMutableDictionary dictionary];
    [dict8 setObject:@"https://gd1.alicdn.com/bao/uploaded/i1/49085078/TB2THmUopXXXXaIXpXXXXXXXXXX_!!49085078.jpg_400x400.jpg" forKey:@"storeImageURL"];
    
    NSMutableArray * arr2 = [NSMutableArray array];
    [arr2 addObject:dict5];
    [arr2 addObject:dict6];
    [arr2 addObject:dict7];
    [arr2 addObject:dict8];
 
    
    
    CategoryStoreModal * storeModal3 = [[CategoryStoreModal alloc]init];
    [storeModal3 setStoreID:[NSNumber numberWithInteger:3]];
    [storeModal3 setStoreTitle:@"YUJ workshop"];
    [storeModal3 setStoreOwnerName:@"二流堂"];
    [storeModal3 setStoreIconImgURL:@"https://img.alicdn.com/bao/uploaded//83/1c/T1c_RqFrBXXXb1upjX.jpg_50x50.jpg"];
    [storeModal3 setStoreSloganString:@"Vintage古着单品、传统民族手工艺品和世界各地的流浪嬉皮手工艺人所制作的服装饰品。"];
    [storeModal3 setStoreIsFavored:YES];
    
    NSMutableDictionary * dict9 = [NSMutableDictionary dictionary];
    [dict9 setObject:@"https://img.alicdn.com/bao/uploaded/i2/TB1rBepIpXXXXcPXFXXXXXXXXXX_!!0-item_pic.jpg_230x230.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict10 = [NSMutableDictionary dictionary];
    [dict10 setObject:@"https://img.alicdn.com/bao/uploaded/i4/TB1WQxcHVXXXXXkXXXXXXXXXXXX_!!0-item_pic.jpg_230x230.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict11 = [NSMutableDictionary dictionary];
    [dict11 setObject:@"https://img.alicdn.com/bao/uploaded/i1/TB1JFVbHFXXXXXzXXXXXXXXXXXX_!!0-item_pic.jpg_230x230.jpg" forKey:@"storeImageURL"];
    NSMutableDictionary * dict12 = [NSMutableDictionary dictionary];
    [dict12 setObject:@"https://img.alicdn.com/bao/uploaded/i4/TB1lNlRIFXXXXXzXXXXXXXXXXXX_!!0-item_pic.jpg_230x230.jpg" forKey:@"storeImageURL"];
    
    NSMutableArray * arr3 = [NSMutableArray array];
    [arr3 addObject:dict9];
    [arr3 addObject:dict10];
    [arr3 addObject:dict11];
    [arr3 addObject:dict12];

    
    
    
    storeModal1.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr1];
    [_categoryStoresArray addObject:storeModal1];

    storeModal2.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr2];
    [_categoryStoresArray addObject:storeModal2];
 
    storeModal3.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr3];
    [_categoryStoresArray addObject:storeModal3];

    
    [_categoryTableView reloadData];
}






-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
