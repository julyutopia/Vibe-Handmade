//
//  AppDelegate.m
//  VIBE
//
//  Created by Li Haii on 16/7/17.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize mainVC;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = DefaultBackgroundColor;
    
    
    UIView * viewwwww = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [viewwwww setBackgroundColor:RGBA(0, 0, 0, 95)];
    
    [self.window addSubview:viewwwww];
    
    [self.window makeKeyAndVisible];
    
    
    _mainVC = [[MainViewController alloc] init];
    LCNavigationController * homeNavVC = [[LCNavigationController alloc] initWithRootViewController:_mainVC];
    
    _mainVC.navigationController.navigationBarHidden = YES;
    
    self.window.rootViewController = homeNavVC;

    
//    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
//    NSArray *fontNames;
//    NSInteger indFamily, indFont;
//    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
//    {
//        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
//        fontNames = [[NSArray alloc] initWithArray:
//                     [UIFont fontNamesForFamilyName:
//                      [familyNames objectAtIndex:indFamily]]];
//        for (indFont=0; indFont<[fontNames count]; ++indFont)
//        {
//            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
//        }
//    }
    
    
    [self initRecommandViewData];
    
    
    return YES;
}


#pragma mark -设置推荐页假数据
-(void)initRecommandViewData
{
    
    //推荐Banner
    self.recommandTopArray = [[NSMutableArray alloc]init];
    
    RecommandTopViewModal * bannerModal1 = [[RecommandTopViewModal alloc]init];
    [bannerModal1 setImgURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491422054798&di=4a5d3254657fdcd6864c477be282f3d1&imgtype=0&src=http%3A%2F%2Fh7.86.cc%2Fwalls%2F20150721%2F1440x900_d19e4e0b7a2f164.jpg"];
    [self.recommandTopArray addObject:bannerModal1];
    
    RecommandTopViewModal * bannerModal2 = [[RecommandTopViewModal alloc]init];
    [bannerModal2 setImgURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491422068672&di=a643c042cc0edce2815ebffeffc9cbab&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1112%2F28%2Fc11%2F10084076_10084076_1325087736046.jpg"];
    [self.recommandTopArray addObject:bannerModal2];
    
    RecommandTopViewModal * bannerModal3 = [[RecommandTopViewModal alloc]init];
    [bannerModal3 setImgURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491422070248&di=23ef40411ca0e7ef2f922fa95714db5c&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fblog%2F201402%2F14%2F20140214221100_hJszJ.jpeg"];
    [self.recommandTopArray addObject:bannerModal3];

    RecommandTopViewModal * bannerModal4 = [[RecommandTopViewModal alloc]init];
    [bannerModal4 setImgURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491422145232&di=0cb83ea0d38b4a1be0563c89e33fe7f0&imgtype=0&src=http%3A%2F%2Ffile.youboy.com%2Fa%2F99%2F40%2F34%2F2%2F10043032.jpg"];
    [self.recommandTopArray addObject:bannerModal4];
  
    
    //推荐分类
    self.recommandCateArray = [[NSMutableArray alloc]init];
    
    for (int i =1; i <11; i ++) {
        
        RecommandCateModal * catemodal = [[RecommandCateModal alloc]init];
        NSString * imgUrl = [NSString stringWithFormat:@"http://oih52ss9e.bkt.clouddn.com/Cate%d.png",i];
        [catemodal setCategoryImgURL:imgUrl];
        [self.recommandCateArray addObject:catemodal];
    }
    
    
    //为你而选
    self.recommnadPickModal = [[RecommandItemModal alloc]init];
    [self.recommnadPickModal setProductInfoTitle:@"新品上架"];
    [self.recommnadPickModal setProductTitle:@"波西米亚印花连体裤"];
    [self.recommnadPickModal setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Recommand_Pick.jpg"];
    
    
    //推荐产品
    RecommandItemModal * productModal1 = [[RecommandItemModal alloc]init];
    [productModal1 setProductTitle:@"进口手工Kilim地毯"];
    [productModal1 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item1.jpg"];
    [productModal1 setProductPrice:@"1380"];
    
    RecommandItemModal * productModal2 = [[RecommandItemModal alloc]init];
    [productModal2 setProductTitle:@"植物蓝染小外套"];
    [productModal2 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item2.jpg"];
    [productModal2 setProductPrice:@"216"];
    
    RecommandItemModal * productModal3 = [[RecommandItemModal alloc]init];
    [productModal3 setProductTitle:@"北非全手工编织篮"];
    [productModal3 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item3.jpg"];
    [productModal3 setProductPrice:@"500"];

    RecommandItemModal * productModal4 = [[RecommandItemModal alloc]init];
    [productModal4 setProductTitle:@"手工实木砧板"];
    [productModal4 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item4.png"];
    [productModal4 setProductPrice:@"260"];
    
    RecommandItemModal * productModal5 = [[RecommandItemModal alloc]init];
    [productModal5 setProductTitle:@"南美macrame项链"];
    [productModal5 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item5.jpg"];
    [productModal5 setProductPrice:@"520"];
    
    RecommandItemModal * productModal6 = [[RecommandItemModal alloc]init];
    [productModal6 setProductTitle:@"墨西哥民族毛毯"];
    [productModal6 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Item6.jpg"];
    [productModal6 setProductPrice:@"768"];
    
    self.recommandItemsArray = [[NSMutableArray alloc]initWithObjects:productModal1,productModal2,
                                                                    productModal3,productModal4,
                                                                    productModal5,productModal6,nil];
}




+(AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
