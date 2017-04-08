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
    [self initDiscoverViewData];
    [self initCreatorViewData];
    
    return YES;
}


#pragma mark -设置推荐页假数据
-(void)initRecommandViewData
{
    //推荐Banner
    self.recommandTopArray = [[NSMutableArray alloc]init];
    
    RecommandTopViewModal * bannerModal1 = [[RecommandTopViewModal alloc]init];
    [bannerModal1 setImgURL:@"http://oih52ss9e.bkt.clouddn.com/banner1.jpg"];
    [self.recommandTopArray addObject:bannerModal1];
    
    RecommandTopViewModal * bannerModal2 = [[RecommandTopViewModal alloc]init];
    [bannerModal2 setImgURL:@"http://oih52ss9e.bkt.clouddn.com/banner2.jpg"];
    [self.recommandTopArray addObject:bannerModal2];
    
    RecommandTopViewModal * bannerModal3 = [[RecommandTopViewModal alloc]init];
    [bannerModal3 setImgURL:@"http://oih52ss9e.bkt.clouddn.com/banner3.jpg"];
    [self.recommandTopArray addObject:bannerModal3];

    RecommandTopViewModal * bannerModal4 = [[RecommandTopViewModal alloc]init];
    [bannerModal4 setImgURL:@"http://oih52ss9e.bkt.clouddn.com/banner4.jpg"];
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


-(void)initDiscoverViewData
{
    self.discoverTagsArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <9; i ++) {
        
        DiscoverTagModal * tagModal = [[DiscoverTagModal alloc]init];
        NSString * imgURL = [NSString stringWithFormat:@"http://oih52ss9e.bkt.clouddn.com/HotTag%d.png",i];
        [tagModal setDiscoverTagImgUrl:imgURL];
        
        switch (i) {
            case 1:
                [tagModal setDiscoverTagTitle:@"水晶首饰"];
                break;
            case 2:
                [tagModal setDiscoverTagTitle:@"BOHO风"];
                break;
            case 3:
                [tagModal setDiscoverTagTitle:@"美食与爱"];
                break;
            case 4:
                [tagModal setDiscoverTagTitle:@"蓝染"];
                break;
            case 5:
                [tagModal setDiscoverTagTitle:@"异域民族"];
                break;
            case 6:
                [tagModal setDiscoverTagTitle:@"服饰搭配"];
                break;
            case 7:
                [tagModal setDiscoverTagTitle:@"中国传统手工"];
                break;
            case 8:
                [tagModal setDiscoverTagTitle:@"家居软装"];
                break;
            default:
                break;
        }
        
        [self.discoverTagsArray addObject:tagModal];
    }
    
    
    
    self.discoverTopicsArray = [[NSMutableArray alloc]init];
    
    DiscoverTopicModal * topicModal1 = [[DiscoverTopicModal alloc]init];
    [topicModal1 setDiscoverTopicTitle:@"唯有自然才能编织出如此一场美梦"];
    [topicModal1 setDiscoverTopicImgUrl:@"http://oih52ss9e.bkt.clouddn.com/Topic1.jpg"];
    [topicModal1 setDiscoverTopicTimeStamp:@"15 min ago"];
    [self.discoverTopicsArray addObject:topicModal1];
    
    DiscoverTopicModal * topicModal2 = [[DiscoverTopicModal alloc]init];
    [topicModal2 setDiscoverTopicTitle:@"Let's Go To The Beach"];
    [topicModal2 setDiscoverTopicImgUrl:@"http://oih52ss9e.bkt.clouddn.com/Topic2.jpg"];
    [topicModal2 setDiscoverTopicTimeStamp:@"02. Apr"];
    [self.discoverTopicsArray addObject:topicModal2];
  
    DiscoverTopicModal * topicModal3 = [[DiscoverTopicModal alloc]init];
    [topicModal3 setDiscoverTopicTitle:@"装出新花样"];
    [topicModal3 setDiscoverTopicImgUrl:@"http://oih52ss9e.bkt.clouddn.com/Topic3.jpg"];
    [topicModal3 setDiscoverTopicTimeStamp:@"28. Mar"];
    [self.discoverTopicsArray addObject:topicModal3];

    DiscoverTopicModal * topicModal4 = [[DiscoverTopicModal alloc]init];
    [topicModal4 setDiscoverTopicTitle:@"春暖花开正当时"];
    [topicModal4 setDiscoverTopicImgUrl:@"http://oih52ss9e.bkt.clouddn.com/Topic4.jpg"];
    [topicModal4 setDiscoverTopicTimeStamp:@"28. Feb"];
    [self.discoverTopicsArray addObject:topicModal4];
    
    
    self.discoverStorysArray = [[NSMutableArray alloc]init];
    
    DiscoverStoryModal * modal1 = [[DiscoverStoryModal alloc]init];
    [modal1 setDiscoverStoryTitle:@"土耳其KILIM地毯的前世今生"];
    [modal1 setDiscoverStoryImgUrl:@"http://oih52ss9e.bkt.clouddn.com/story1.jpg"];
    [modal1 setDiscoverStoryTimeStamp:@"26. Mar"];
    NSArray * imgURLsArray = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/story2.jpg",@"http://oih52ss9e.bkt.clouddn.com/story3.jpg",@"http://oih52ss9e.bkt.clouddn.com/story4.jpg",@"http://oih52ss9e.bkt.clouddn.com/story5.jpg",@"http://oih52ss9e.bkt.clouddn.com/story2.jpg",@"http://oih52ss9e.bkt.clouddn.com/story2.jpg", nil];
    [modal1 setDiscoverStoryContentPhotos:imgURLsArray];
    [self.discoverStorysArray addObject:modal1];
    
    
    DiscoverStoryModal * modal2 = [[DiscoverStoryModal alloc]init];
    [modal2 setDiscoverStoryTitle:@"手工皮具知多少"];
    [modal2 setDiscoverStoryImgUrl:@"http://oih52ss9e.bkt.clouddn.com/story6.jpg"];
    [modal2 setDiscoverStoryTimeStamp:@"08. Mar"];
    [self.discoverStorysArray addObject:modal2];
    
    DiscoverStoryModal * modal3 = [[DiscoverStoryModal alloc]init];
    [modal3 setDiscoverStoryTitle:@"日式传统纹样"];
    [modal3 setDiscoverStoryImgUrl:@"http://oih52ss9e.bkt.clouddn.com/story7.jpg"];
    [modal3 setDiscoverStoryTimeStamp:@"14. Feb"];
    [self.discoverStorysArray addObject:modal3];
}


-(void)initCreatorViewData
{
    self.creatorsArray = [[NSMutableArray alloc]init];
    
    CreatorCoverModal * modal1 = [[CreatorCoverModal alloc]init];
    [modal1 setCreatorCoverUrl:@"http://oih52ss9e.bkt.clouddn.com/Creator1.jpeg"];
    [modal1 setCreatorShopTitle:@"阁楼Pentfair"];
    [modal1 setCreatorSloganTitle:@"异域旅行发现，忠于内心的色彩"];
     NSArray * imgURLsArray1 = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Creator2.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator3.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator4.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator5.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator5.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator5.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator5.jpg", nil];
    [modal1 setCreatorContentPhotos:imgURLsArray1];
    
    
    
    CreatorCoverModal * modal2 = [[CreatorCoverModal alloc]init];
    [modal2 setCreatorCoverUrl:@"http://oih52ss9e.bkt.clouddn.com/Creator6.jpg"];
    [modal2 setCreatorShopTitle:@"从那以后"];
    [modal2 setCreatorSloganTitle:@"原创腔调设计，独立手工艺人"];
    NSArray * imgURLsArray2 = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Creator7.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator8.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator9.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator10.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator7.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator8.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator9.jpg", nil];
    [modal2 setCreatorContentPhotos:imgURLsArray2];
    
    CreatorCoverModal * modal3 = [[CreatorCoverModal alloc]init];
    [modal3 setCreatorCoverUrl:@"http://oih52ss9e.bkt.clouddn.com/Creator11.jpg"];
    [modal3 setCreatorShopTitle:@"YUJ workshop"];
    [modal3 setCreatorSloganTitle:@"Macrame饰品和皮具、Vintage古着单品、传统民族手工艺品和世界各地的流浪嬉皮手工"];
    NSArray * imgURLsArray3 = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Creator12.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator13.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator14.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator15.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator14.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator15.jpg", nil];
    [modal3 setCreatorContentPhotos:imgURLsArray3];
    
    CreatorCoverModal * modal4 = [[CreatorCoverModal alloc]init];
    [modal4 setCreatorCoverUrl:@"http://oih52ss9e.bkt.clouddn.com/Creator11.jpg"];
    [modal4 setCreatorShopTitle:@"YUJ workshop"];
    [modal4 setCreatorSloganTitle:@"Macrame饰品和皮具、Vintage古着单品、传统民族手工艺品和世界各地的流浪嬉皮手工"];
    NSArray * imgURLsArray4 = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Creator12.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator13.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator14.jpg",@"http://oih52ss9e.bkt.clouddn.com/Creator15.jpg", nil];
    [modal4 setCreatorContentPhotos:imgURLsArray4];
    
    [self.creatorsArray addObject:modal1];
    [self.creatorsArray addObject:modal2];
    [self.creatorsArray addObject:modal3];
    [self.creatorsArray addObject:modal4];

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
