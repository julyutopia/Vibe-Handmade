//
//  HomeViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeBannerModal.h"
#import "HomeTopicModal.h"
#import "HomeProductModal.h"

#import "AppDelegate.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
//    AppDelegate * delegatee = (AppDelegate *) [UIApplication sharedApplication];
//    [delegatee.rootVC.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];

    
    self.naviBarType = 0;
    
    [self.backBtn setHidden:YES];
    [self.titleLabel setHidden:YES];
    [self.titleImgView setHidden:NO];


    UIImageView * blurBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [blurBackImgView setImage:[UIImage imageNamed:@"home_Blur"]];
    [self.view addSubview:blurBackImgView];    
    
    _recommandTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_recommandTableView setBackgroundView:nil];
    [_recommandTableView setBackgroundColor:[UIColor clearColor]];
    [_recommandTableView setDelegate:self];
    [_recommandTableView setDataSource:self];
    [_recommandTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _recommandTableView.contentInset = UIEdgeInsetsMake(height_headerview, 0, 0, 0);
    _recommandTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview, 0, 0, 0);

    [self.view addSubview:_recommandTableView];
    
    _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
    [_footerView setBackgroundColor:[UIColor clearColor]];
    
    
    [self.view bringSubviewToFront:self.topNavView];
    [self.view bringSubviewToFront:self.titleImgView];
    
    //初始化保存数据的数组
    _bannerInfoModalArray = [[NSMutableArray alloc]init];
    _topicModalArray = [[NSMutableArray alloc]init];
    _productsModalArray = [[NSMutableArray alloc]init];
    
    [self initData];
}


-(void)initData
{
    NSMutableArray * bArray = [NSMutableArray array];

    HomeBannerModal * bannerModal1 = [[HomeBannerModal alloc]init];
    [bannerModal1 setImgURL:@"https://aecpm.alicdn.com/simba/img/TB1vO1RLXXXXXX7XXXXSutbFXXX.jpg"];
    [bArray addObject:bannerModal1];
    HomeBannerModal * bannerModal2 = [[HomeBannerModal alloc]init];
    [bannerModal2 setImgURL:@"https://img.alicdn.com/tps/TB1FH2gLXXXXXXwaXXXXXXXXXXX-720-400.jpg"];
    [bArray addObject:bannerModal2];
    HomeBannerModal * bannerModal3 = [[HomeBannerModal alloc]init];
    [bannerModal3 setImgURL:@"https://img.alicdn.com/tps/TB1031WKVXXXXbvXXXXXXXXXXXX-720-400.jpg"];
    [bArray addObject:bannerModal3];
    
    [_bannerInfoModalArray removeAllObjects];
    [_bannerInfoModalArray addObjectsFromArray:bArray];
    
    
    NSMutableArray * tArray = [NSMutableArray array];
    
    HomeTopicModal * topicModal1 = [[HomeTopicModal alloc]init];
    [topicModal1 setImgURL:@"https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/TB1gihYGFXXXXaiXFXXXXXXXXXX_!!0-item_pic.jpg_460x460Q90.jpg"];
    [tArray addObject:topicModal1];
    HomeTopicModal * topicModal2 = [[HomeTopicModal alloc]init];
    [topicModal2 setImgURL:@"https://gdp.alicdn.com/bao/uploaded/i3/62769856/TB2r7AxtFXXXXcrXpXXXXXXXXXX_!!62769856.jpg_350x350.jpg"];
    [tArray addObject:topicModal2];
    HomeTopicModal * topicModal3 = [[HomeTopicModal alloc]init];
    [topicModal3 setImgURL:@"https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/TB121aUIVXXXXa6XpXXXXXXXXXX_!!0-item_pic.jpg_460x460Q90.jpg"];
    [tArray addObject:topicModal3];
    HomeTopicModal * topicModal4 = [[HomeTopicModal alloc]init];
    [topicModal4 setImgURL:@"https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1033697014/TB2XiNXlVXXXXaPXpXXXXXXXXXX_!!1033697014.png_460x460Q90.jpg"];
    [tArray addObject:topicModal4];
    
    [_topicModalArray removeAllObjects];
    [_topicModalArray addObjectsFromArray:tArray];
    
    
    
    NSMutableArray * pArray = [NSMutableArray array];
    
    HomeProductModal * productModal1 = [[HomeProductModal alloc]init];
    [productModal1 setProductTitle:@"2016欧美手钩比基尼套装 性感沙滩手工编织纯棉裹胸泳衣泳装"];
    [productModal1 setProductImgURL:@"https://gd2.alicdn.com/bao/uploaded/i2/TB1B5PxIpXXXXXnXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg"];
    [productModal1 setProductPrice:@"32.00"];
    [productModal1 setProductShopName:@"欧美泳衣尾单"];
    [productModal1 setProductFavorCount:[NSNumber numberWithInt:120]];
    [productModal1 setProductIsUserFavored:[NSNumber numberWithInt:0]];
    [pArray addObject:productModal1];
    
    HomeProductModal * productModal2 = [[HomeProductModal alloc]init];
    [productModal2 setProductTitle:@"1970s美国Indian印第安Navajo纳瓦霍绿松石贝母925纯银古董戒指男"];
    [productModal2 setProductImgURL:@"https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/TB1htR4KVXXXXceaXXXXXXXXXXX_!!0-item_pic.jpg_460x460Q90.jpg"];
    [productModal2 setProductPrice:@"1280.00"];
    [productModal2 setProductShopName:@"VintageFactory"];
    [productModal2 setProductFavorCount:[NSNumber numberWithInt:0]];
    [productModal2 setProductIsUserFavored:[NSNumber numberWithInt:1]];
    [pArray addObject:productModal2];
    
    HomeProductModal * productModal3 = [[HomeProductModal alloc]init];
    [productModal3 setProductTitle:@"小花自制*手工钩花波西米亚嬉皮吉普赛贝壳串珠光脚凉鞋脚饰脚链"];
    [productModal3 setProductImgURL:@"https://gd4.alicdn.com/imgextra/i4/69965683/TB2bgJOtFXXXXcmXXXXXXXXXXXX_!!69965683.jpg"];
    [productModal3 setProductPrice:@"38.00"];
    [productModal3 setProductShopName:@"小花的铺子"];
    [productModal3 setProductFavorCount:[NSNumber numberWithInt:202]];
    [productModal3 setProductIsUserFavored:[NSNumber numberWithInt:1]];
    [pArray addObject:productModal3];
    
    HomeProductModal * productModal4 = [[HomeProductModal alloc]init];
    [productModal4 setProductTitle:@"绝版|纯手工制作神秘埃及香薰灯|越薰越香的香薰灯"];
    [productModal4 setProductImgURL:@"https://gd4.alicdn.com/bao/uploaded/i4/TB1F233JXXXXXbaXXXXXXXXXXXX_!!0-item_pic.jpg"];
    [productModal4 setProductPrice:@"188.00"];
    [productModal4 setProductShopName:@"植觉香道馆"];
    [productModal4 setProductFavorCount:[NSNumber numberWithInt:180]];
    [productModal4 setProductIsUserFavored:[NSNumber numberWithInt:0]];
    [pArray addObject:productModal4];
    
    
    HomeProductModal * productModal5 = [[HomeProductModal alloc]init];
    [productModal5 setProductTitle:@"【日本製】手工磨砂翻毛斜跨包休闲民族风牛仔风单肩男女通用背包"];
    [productModal5 setProductImgURL:@"https://gd4.alicdn.com/bao/uploaded/i4/587098047/TB29bLAkXXXXXXRXpXXXXXXXXXX_!!587098047.jpg_400x400.jpg"];
    [productModal5 setProductPrice:@"650.00"];
    [productModal5 setProductShopName:@"Asian Daysart"];
    [productModal5 setProductFavorCount:[NSNumber numberWithInt:0]];
    [productModal5 setProductIsUserFavored:[NSNumber numberWithInt:0]];
    [pArray addObject:productModal5];
    
    HomeProductModal * productModal6 = [[HomeProductModal alloc]init];
    [productModal6 setProductTitle:@"美国购回 墨西哥手工织成彩虹毯床盖沙发垫野餐垫桌布沙滩垫披肩"];
    [productModal6 setProductImgURL:@"https://gd1.alicdn.com/bao/uploaded/i1/31284278/TB2GlgvpVXXXXX4XFXXXXXXXXXX_!!0-taoxiaopu_sell.jpg_400x400.jpg"];
    [productModal6 setProductPrice:@"480.00"];
    [productModal6 setProductShopName:@"pinkshasha 墨西哥手工刺繡"];
    [productModal6 setProductFavorCount:[NSNumber numberWithInt:2]];
    [productModal6 setProductIsUserFavored:[NSNumber numberWithInt:1]];
    [pArray addObject:productModal6];
    
    
    [_productsModalArray removeAllObjects];
    [_productsModalArray addObjectsFromArray:pArray];
    
    [_recommandTableView reloadData];
}


#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 15;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        return _footerView;
    }
    
    return nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==3) {
        return _productsModalArray.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && _bannerInfoModalArray.count) {
        
        NSString * indentifier = @"HomeBannerTableViewCellIdentifier";
        
        HomeBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[HomeBannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        [cell setDelegate:self];
        [cell setBannerContent:_bannerInfoModalArray];
        
        return cell;
    }
    
    
    if (indexPath.section == 1 && _topicModalArray.count) {
        
        NSString * indentifier = @"HomeTopicTableViewCellIdentifier";
        
        HomeTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[HomeTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        [cell setDelegate:self];
        [cell setTopicCellWithContent:_topicModalArray];
        
        return cell;
    }
    
    if (indexPath.section ==2) {
        
        NSString * indentifier = @"HomeProductTopTableViewCellIdentifier";
        
        HomeProductTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[HomeProductTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setCell];
        return cell;
    }
    
    if (indexPath.section ==3) {
        NSString * indentifier = @"HomeProductTableViewCellIdentifier";
        
        HomeProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[HomeProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        HomeProductModal * productModal = [_productsModalArray objectAtIndex:indexPath.row];
        BOOL isLast = NO;
        if (indexPath.row == _productsModalArray.count -1) {
            isLast = YES;
        }
        [cell setProductCellWithModal:productModal WithIndex:indexPath.row IsLast:isLast];
        [cell setDelegate:self];
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
    if (indexPath.section ==0 && _bannerInfoModalArray.count) {
        return 130 *sizeRate;
    }
    
    if (indexPath.section ==1 && _topicModalArray.count) {
  
        float topicImageWidth = (kScreenWidth - 15 -10 -15)/2;
        float titleImgHeight = 19;
        float topicImageOriginY = 15 +titleImgHeight +10;
        NSInteger imagesRows = _topicModalArray.count/2 +_topicModalArray.count%2;
        
        float imagesHeight = (topicImageWidth +10)*imagesRows -10;
        
        float allTopicBtnHeight = 14;
        
        float totalHeight = topicImageOriginY +imagesHeight + 15 + allTopicBtnHeight +10;

        return totalHeight;
    }
    
    
    if (indexPath.section ==2) {
        float titleImgHeight = 19;
        return 15 +titleImgHeight +11;
    }
    
    
    if (indexPath.section ==3 && _productsModalArray.count) {
        
        if (indexPath.row < _productsModalArray.count -1) {
            return  100;
        }
        else{
            return  100 +TabBarHeight +40;
        }
    }
    
    return 0;    
}



#pragma mark -点击Banner的代理方法
-(void)homeBannerCellTapIndex:(NSInteger)index
{
    NSLog(@"____Banner点击：%ld_____",index);
}

#pragma mark -点击专题的代理方法
-(void)homeTopicCellTapIndex:(NSInteger)index
{
    NSLog(@"____专题点击：%ld_____",index);
}

-(void)homeTopicShowAll
{
    
}

#pragma mark -点击产品的代理方法
-(void)homeProductCellTapWithIndex:(NSInteger )index
{
    NSLog(@"____产品点击：%ld_____",index);

    if (index < _productsModalArray.count) {
        HomeProductModal * productModal = [_productsModalArray objectAtIndex:index];
    
        ProductDetailViewController * detailVC = [[ProductDetailViewController alloc]init];
        detailVC.productDetailModal = productModal;
        [self.currentVC.lcNavigationController pushViewController:detailVC];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
