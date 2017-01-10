//
//  MineViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.topNavView setHidden:YES];
    
    [self setNeedsStatusBarAppearanceUpdate];

    
    _backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_backImgView setImage:[UIImage imageNamed:@"Mine_Background_Image"]];
    [self.view addSubview:_backImgView];
    
    
//    _backBlurView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight)];
//    
//    CAGradientLayer * gradientLayer = [CAGradientLayer layer];  // 设置渐变效果
//    gradientLayer.bounds = _backBlurView.bounds;
//    gradientLayer.borderWidth = 0;
//    gradientLayer.frame = _backBlurView.bounds;
//    gradientLayer.colors = [NSArray arrayWithObjects:
//                             (id)[RGBA(0, 189, 156, 60) CGColor],
//                             (id)[RGBA(146, 182, 176, 60) CGColor],
//                             (id)[RGBA(167, 187, 184, 60) CGColor],
//                             (id)[RGBA(136, 167, 162, 40) CGColor],nil];
//    
//    gradientLayer.locations  = @[@(0.25), @(0.5), @(0.75)];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(0, 1.0);
//    [_backBlurView.layer insertSublayer:gradientLayer atIndex:0];
//
//    [self.view addSubview:_backBlurView];
    
    
    _mineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_mineTableView setBackgroundView:nil];
    [_mineTableView setBackgroundColor:[UIColor clearColor]];
    [_mineTableView setDelegate:self];
    [_mineTableView setDataSource:self];
    [_mineTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _mineTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    _mineTableView.scrollIndicatorInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.view addSubview:_mineTableView];

    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_headerView setBackgroundColor:RGBA(66, 56, 87, 50)];
    [self.view addSubview:_headerView];
    
    
    _foorerView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_foorerView setBackgroundColor:[UIColor clearColor]];
    
    _mineProfileModal = [[MineProfileModal alloc]init];
    
    _favorProductsArray = [[NSMutableArray alloc]init];
    _favorStoressArray = [[NSMutableArray alloc]init];
    _favorTopicsArray = [[NSMutableArray alloc]init];
    
    [self setContentData];
    
}


#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==0 || section ==2 || section == 4 || section ==5) {
        return 20;
    }
    
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section ==0 || section ==2 || section == 4 || section ==5) {
        return _foorerView;
    }
    return nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return _favorProductsArray.count;
    }
    if (section == 4) {
        return _favorStoressArray.count;
    }
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //个人信息
    if (indexPath.section == 0) {
        
        NSString * indentifier = @"MineProfileInfoCellIdentifier";
        
        MineInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setMineInfoCellWithModal:_mineProfileModal];
        
        return cell;
    }

    
    //收藏商品标题
    if (indexPath.section == 1) {
        
        NSString * indentifier = @"MineProductsTopCellIdentifier";
        
        MineFavorProductsTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineFavorProductsTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        return cell;
    }
    
    
    //收藏商品
    if (indexPath.section == 2) {
        
        NSString * indentifier = @"MineFavorProductsTableViewCellIdentifier";
        
        MineFavorProductsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineFavorProductsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        
        HomeProductModal * productModal = [_favorProductsArray objectAtIndex:indexPath.row];
        
        BOOL isLast = NO;
        if (indexPath.row == _favorProductsArray.count -1) {
            isLast = YES;
        }
        [cell setMineFavorProductCellWithModal:productModal Index:indexPath.row IsLastCell:isLast];
        
        return cell;
    }

    

    //收藏店铺顶部
    if (indexPath.section == 3) {
        
        NSString * indentifier = @"MineStoresTopCellIdentifier";
        
        MineFavorStoresTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineFavorStoresTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        return cell;
    }
    
    //收藏店铺
    if (indexPath.section == 4) {
        
        NSString * indentifier = @"MineStoresCellIdentifier";
        
        MineFavorStoresTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineFavorStoresTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        CategoryStoreModal * modal = [_favorStoressArray objectAtIndex:indexPath.row];
        
        BOOL isLast = NO;
        if (indexPath.row == _favorStoressArray.count -1) {
            isLast = YES;
        }
        
        [cell setDelegate:self];
        [cell setMineStoreCellWithModal:modal Index:indexPath.row IsLast:isLast];
        
        return cell;
    }
    

//    //收藏店铺底部
//    if (indexPath.section == 5) {
//        
//        NSString * indentifier = @"MineStoresBottomCellIdentifier";
//        
//        MineFavorStoresBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
//        if (cell == nil) {
//            cell = [[MineFavorStoresBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            [cell setBackgroundColor:[UIColor clearColor]];
//            [cell setBackgroundView:nil];
//        }
//        
//        [cell setDelegate:self];
//        [cell setCell];
//        
//        return cell;
//    }


    //收藏专题
    if (indexPath.section == 5) {
        
        NSString * indentifier = @"MineFavorTopicsTableViewCellIdentifier";
        
        MineFavorTopicsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil) {
            cell = [[MineFavorTopicsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        [cell setDelegate:self];
        [cell setTopicCellWithModals:_favorTopicsArray];
        
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
        
        return _infoCellHeight;
    }
    
    if (indexPath.section ==1) {
        float heightt = 15;
        return heightt +25;
    }
    
    if (indexPath.section ==2 && _favorProductsArray.count) {

        //最后一个收藏产品
        if (indexPath.row == _favorProductsArray.count -1) {
            return 100 +40;
        }
        else{
            return 100;
        }
    }

    
    if (indexPath.section ==3 && _favorStoressArray.count) {
        float heightt = 15;
        return heightt +25;
    }
    
    if (indexPath.section == 4) {
        float imgViewHeight = (kScreenWidth -30 -10 -10 - 15 *3 )/4;
        float totalHeight = 10 +55 +15 +imgViewHeight + 10;
        
        if (indexPath.row == _favorStoressArray.count -1) {
            return totalHeight +40;
        }
        else{
            return totalHeight;
        }
    }
    
    
    if (indexPath.section ==5 && _favorTopicsArray.count) {
        float topHeight = 15 +25;
        
        float imgViewHeight = (kScreenWidth -30 -10 -10 - 15 *3 )/3.5;

        return topHeight +imgViewHeight +15 +TabBarHeight +10;
    }
    
    return 0;
}



-(void)setContentData
{
    NSString * userName = @"用户名";
    UIFont * userNameFont = [VibeFont fontWithName:Default_Font size:16];
    
    NSString * userSign = @"签名";
    UIFont * userSignFont = [VibeFont fontWithName:Default_Font size:12];
    
    CGSize nameSize = [userName getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 22) withFont:userNameFont];
    CGSize signSize = [userSign getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 22) withFont:userSignFont];
    
    
    NSString * followCount = @"100";
    UIFont * font = [VibeFont fontWithName:Default_Font_Bold size:18];
    
    CGSize followFontSize = [followCount getSizeWithLimitSize:CGSizeMake(100, 30) withFont:font];
    
    float heighttt = 30 +73 +10 +nameSize.height +10 +signSize.height +20 +followFontSize.height +4;
    
    
    _infoCellHeight = heighttt;
    
    
    [_mineProfileModal setUserID:[NSNumber numberWithInteger:1]];
    [_mineProfileModal setUserAvatarImgURL:@"http://img.xiami.net/images/artistlogo/37/14701379266237_2.jpg"];
    [_mineProfileModal setUserName:@"里海ૐ"];
    [_mineProfileModal setUserDescribe:@"每个不曾起舞的日子，都是对生命的辜负"];
    
    [_mineProfileModal setUserFollowingNumber:[NSNumber numberWithInteger:12]];
    [_mineProfileModal setUserFollowedNumber:[NSNumber numberWithInteger:5]];
    
    
    HomeProductModal * product1 = [[HomeProductModal alloc]init];
    [product1 setProductID:[NSNumber numberWithInteger:1]];
    [product1 setProductTitle:@"【非常墨西哥】玛雅人的Tequila（龙舌兰）酒杯"];
    [product1 setProductImgURL:@"https://gd1.alicdn.com/bao/uploaded/i1/TB1RZl8IVXXXXbeXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg"];
    [product1 setProductShopName:@"嬉皮设计师希腊"];
    [product1 setProductPrice:@"38.00"];
    [product1 setProductFavorCount:[NSNumber numberWithInteger:12]];
    [_favorProductsArray addObject:product1];
    
    HomeProductModal * product2 = [[HomeProductModal alloc]init];
    [product2 setProductID:[NSNumber numberWithInteger:2]];
    [product2 setProductTitle:@"私人定制 抹茶色牛皮包 纯手工制作斜挎包 独一无二"];
    [product2 setProductImgURL:@"https://gd3.alicdn.com/bao/uploaded/i3/TB19jsZJpXXXXbTXpXXXXXXXXXX_!!0-item_pic.jpg"];
    [product2 setProductShopName:@"静怡姐姐的店铺"];
    [product2 setProductPrice:@"138.00"];
    [product2 setProductFavorCount:[NSNumber numberWithInteger:48]];
    [_favorProductsArray addObject:product2];
   
    HomeProductModal * product3 = [[HomeProductModal alloc]init];
    [product3 setProductID:[NSNumber numberWithInteger:2]];
    [product3 setProductTitle:@"私人定制 抹茶色牛皮包 纯手工制作斜挎包 独一无二"];
    [product3 setProductImgURL:@"https://gd3.alicdn.com/bao/uploaded/i3/TB19jsZJpXXXXbTXpXXXXXXXXXX_!!0-item_pic.jpg"];
    [product3 setProductShopName:@"静怡姐姐的店铺"];
    [product3 setProductPrice:@"138.00"];
    [product3 setProductFavorCount:[NSNumber numberWithInteger:48]];
    [_favorProductsArray addObject:product3];
    
    
    CategoryStoreModal * storeModal1 = [[CategoryStoreModal alloc]init];
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
    
    
    
    
    
    
    NSMutableDictionary * tagDict1 = [NSMutableDictionary dictionary];
    [tagDict1 setObject:@"民族首饰" forKey:@"tagName"];
    NSMutableDictionary * tagDict2 = [NSMutableDictionary dictionary];
    [tagDict2 setObject:@"天然手工" forKey:@"tagName"];
    NSMutableDictionary * tagDict3 = [NSMutableDictionary dictionary];
    [tagDict3 setObject:@"Rasta雷鬼" forKey:@"tagName"];
    NSMutableArray * arr4 = [NSMutableArray arrayWithObjects:tagDict1, tagDict2, tagDict3, nil];
    
    
    NSMutableDictionary * tagDict4 = [NSMutableDictionary dictionary];
    [tagDict4 setObject:@"手工编织" forKey:@"tagName"];
    NSMutableDictionary * tagDict5 = [NSMutableDictionary dictionary];
    [tagDict5 setObject:@"皮革小物" forKey:@"tagName"];
    NSMutableArray * arr5 = [NSMutableArray arrayWithObjects:tagDict4, tagDict5, nil];
    
    NSMutableDictionary * tagDict6 = [NSMutableDictionary dictionary];
    [tagDict6 setObject:@"vintage" forKey:@"tagName"];
    NSMutableDictionary * tagDict7 = [NSMutableDictionary dictionary];
    [tagDict7 setObject:@"传统民族手工" forKey:@"tagName"];
    NSMutableDictionary * tagDict8 = [NSMutableDictionary dictionary];
    [tagDict8 setObject:@"流浪嬉皮手作" forKey:@"tagName"];
    NSMutableArray * arr6 = [NSMutableArray arrayWithObjects:tagDict6, tagDict7, tagDict8, nil];
    
    
    
    storeModal1.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr1];
    storeModal1.storeTagsArray = [[NSMutableArray alloc]initWithArray:arr4];
    [_favorStoressArray addObject:storeModal1];
    
    storeModal2.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr2];
    storeModal2.storeTagsArray = [[NSMutableArray alloc]initWithArray:arr5];
    [_favorStoressArray addObject:storeModal2];
    
    storeModal3.storeTopProductsArray = [[NSMutableArray alloc]initWithArray:arr3];
    storeModal3.storeTagsArray = [[NSMutableArray alloc]initWithArray:arr6];
    [_favorStoressArray addObject:storeModal3];
    
    
    
    
    
    HomeTopicModal * topicModal1 = [[HomeTopicModal alloc]init];
    [topicModal1 setImgURL:@"https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/TB1gihYGFXXXXaiXFXXXXXXXXXX_!!0-item_pic.jpg_460x460Q90.jpg"];
    HomeTopicModal * topicModal2 = [[HomeTopicModal alloc]init];
    [topicModal2 setImgURL:@"https://gdp.alicdn.com/bao/uploaded/i3/62769856/TB2r7AxtFXXXXcrXpXXXXXXXXXX_!!62769856.jpg_350x350.jpg"];
    HomeTopicModal * topicModal3 = [[HomeTopicModal alloc]init];
    [topicModal3 setImgURL:@"https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/TB121aUIVXXXXa6XpXXXXXXXXXX_!!0-item_pic.jpg_460x460Q90.jpg"];
    HomeTopicModal * topicModal4 = [[HomeTopicModal alloc]init];
    [topicModal4 setImgURL:@"https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1033697014/TB2XiNXlVXXXXaPXpXXXXXXXXXX_!!1033697014.png_460x460Q90.jpg"];
    [_favorTopicsArray addObject:topicModal1];
    [_favorTopicsArray addObject:topicModal2];
    [_favorTopicsArray addObject:topicModal3];
    [_favorTopicsArray addObject:topicModal4];

    
    [_mineTableView reloadData];

    [_backBlurView setFrame:CGRectMake(0, 20, kScreenWidth, _mineTableView.contentSize.height -20)];
    
    NSLog(@"_____%g______",_mineTableView.contentSize.height -20);
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];  // 设置渐变效果
    gradientLayer.bounds = _backBlurView.bounds;
    gradientLayer.borderWidth = 0;


    gradientLayer.frame = _backBlurView.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:
                             (id)[RGBA(0, 189, 156, 60) CGColor],
                             (id)[RGBA(0, 189, 156, 1) CGColor],
                             (id)[RGBA(92, 174, 160, 5) CGColor],
                             (id)[RGBA(50, 50, 50, 10) CGColor],nil];

    gradientLayer.locations  = @[@(0.25), @(0.5), @(0.75)];


    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);

    [_backBlurView.layer insertSublayer:gradientLayer atIndex:0];
    
    [_mineTableView setBackgroundView:_backBlurView];

}


#pragma mark - 个人信息cell的代理方法
//点击进入消息
-(void)mineInfoCellClickMessage
{
    NSLog(@"~~~~~点击消息~~~~~~~");
}

//点击进入设置
-(void)mineInfoCellClickSetting
{
    NSLog(@"~~~~~点击设置~~~~~~~");
}

//点击显示全部关注
-(void)mineInfoCellClickFollowing
{
    NSLog(@"~~~~~点击全部关注~~~~~~~");
}

//点击显示全部粉丝
-(void)mineInfoCellClickFans
{
    NSLog(@"~~~~~点击被关注~~~~~~~");
}

#pragma mark 收藏商品cell点击代理方法
-(void)clickMineProductWithIndex:(NSInteger)index
{
    HomeProductModal * productModal = [_favorProductsArray objectAtIndex:index];
    NSLog(@"______点击收藏产品index：%ld________",index);
}

#pragma mark 显示全部收藏商品的代理方法
-(void)clickMineProductShowAll
{
    NSLog(@"_______显示全部收藏商品_________");
}


#pragma mark 显示收藏店铺cell的点击代理方法
-(void)showMineFavorStoreWithIndex:(NSInteger )index
{
    CategoryStoreModal * storeModal = [_favorStoressArray objectAtIndex:index];
    NSLog(@"______点击收藏店铺index：%ld________",index);
}

#pragma mark 显示全部收藏店铺的代理方法
-(void)showMineFavorStoreAll
{
    NSLog(@"________显示全部收藏店铺___________");
}

#pragma mark 显示点击收藏专题的代理方法
-(void)showMineFavorTopicWithIndex:(NSInteger)index
{
    NSLog(@"______点击收藏专题index：%ld________",index);
}

-(void)showAllMineFavorTopics
{
    NSLog(@"________显示全部收藏专题___________");
}



-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
