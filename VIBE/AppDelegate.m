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
    
    [self setLogInUserInfo];
    
    [self initSearchResultData];
    
    [self initRecommandViewData];
    [self initDiscoverViewData];
    [self initCreatorViewData];
    
    [self initItemDetailData];
    
    [self initTopicDetailData];
    
    [self initStoryDetailData];
    
    [self initCreatorDetailData];
    
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
        
        [catemodal setCategoryTitle:@"女装"];
        [catemodal setCategorySubtitle:@"Women's"];
        [catemodal setCategoryCoverImgURL:@"http://oih52ss9e.bkt.clouddn.com/Cate_Top4.png"];
        
        NSArray * subArray = [NSArray arrayWithObjects:@"全部",@"T恤",@"外套",@"背心",@"下着",@"鞋靴", @"帽",@"围巾",@"袜", @"其他", nil];
        [catemodal setCategorySetArray:subArray];
        
        NSString * imgUrl = [NSString stringWithFormat:@"http://oih52ss9e.bkt.clouddn.com/Cate%d.png",i];
        [catemodal setCategoryIconImgURL:imgUrl];
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
        [tagModal setTagIconImgURL:imgURL];
        [tagModal setTagCoverImgURL:@"http://oih52ss9e.bkt.clouddn.com/Tag_List1.jpg"];
        [tagModal setTagItemsCount:[NSNumber numberWithInt:204]];
        
        [tagModal setTagItemsArray:self.searchResultArray];
        
        switch (i) {
            case 1:
                [tagModal setTagTitle:@"水晶首饰"];
                break;
            case 2:
                [tagModal setTagTitle:@"BOHO风"];
                break;
            case 3:
                [tagModal setTagTitle:@"美食与爱"];
                break;
            case 4:
                [tagModal setTagTitle:@"蓝染"];
                break;
            case 5:
                [tagModal setTagTitle:@"异域民族"];
                break;
            case 6:
                [tagModal setTagTitle:@"服饰搭配"];
                break;
            case 7:
                [tagModal setTagTitle:@"中国传统手工"];
                break;
            case 8:
                [tagModal setTagTitle:@"家居软装"];
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


-(void)initSearchResultData
{
    //搜索结果产品
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
    
    
    self.searchResultArray = [[NSMutableArray alloc]initWithObjects:productModal1,productModal2,
                                                                    productModal3,productModal4,
                                                                    productModal5,productModal6,nil];
}


-(void)initItemDetailData
{
    self.itemDetailModal = [[ItemDetailModal alloc]init];
    
    self.itemDetailModal.itemTitle = @"墨西哥魔力彩虹条纹毯";
    self.itemDetailModal.itemCoverImgURL = @"http://oih52ss9e.bkt.clouddn.com/Item_Detail1.jpg";
    self.itemDetailModal.itemPrice = @"768";
    self.itemDetailModal.itemIsUserFavored = [NSNumber numberWithBool:0];
    self.itemDetailModal.itemDetailInfo = @"原产地：墨西哥🇲🇽\n\n纯手工织成，每一条都与众不同 所以，除了扮酷，我还能用它来做什么？\n\n盖毯/沙滩巾/挂毯/沙发布\n桌布/床单/嬉皮车用毯/露营桌布\n\n Anyway as you want";
    
    NSArray * photosArray = [NSArray arrayWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Item_Detail2.jpg",@"http://oih52ss9e.bkt.clouddn.com/Item_Detail3.jpg",@"http://oih52ss9e.bkt.clouddn.com/Item_Detail4.jpg",@"http://oih52ss9e.bkt.clouddn.com/Item_Detail5.jpg",@"http://oih52ss9e.bkt.clouddn.com/Item_Detail6.jpg", nil];
    
    self.itemDetailModal.itemMorePhotosUrlsArray = photosArray;
    
    
    //猜你喜欢的产品
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
    
    
    NSArray * guessItemsArray = [[NSArray alloc]initWithObjects:productModal1,productModal2,
                                                                productModal3,productModal4,nil];
    self.itemDetailModal.itemGuessArray = guessItemsArray;
}


-(void)initTopicDetailData
{
    self.topicDetailModal = [[TopicDetailModal alloc]init];
    [self.topicDetailModal setTimeStampTitle:@"14. Mar"];
    [self.topicDetailModal setTopicTitle:@"在另一段旅程，\n捕获一场美梦。"];
    [self.topicDetailModal setTopicCoverImgURL:@"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Top.jpg"];
    
    NSString * detailText1 = @"美好的祝福，原始、温馨而又神秘，现今捕梦网已经在一些饰品店裡出现，成为现代家居新颖别致的摆设品，款式多种多样，有的网大疏鬆、有的网小密实，颜色也各有不同，吸引了不少年轻人购买，可能他们不知它的来历，但是喜欢它的特别和美丽，就买了送给自已的恋人或是好友，送上自已诚挚的心意和祝福。";
    NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:Topic_Detail_Text_Normal forKey:Topic_Detail_Type];//设置类型
    [dict1 setObject:detailText1 forKey:Topic_Detail_Content];//设置里面包含的内容
    
    
    NSArray * photosArray = [[NSArray alloc]initWithObjects:@"http://oih52ss9e.bkt.clouddn.com/Topic_Photo0.jpg",@"http://oih52ss9e.bkt.clouddn.com/Topic_Photo1.jpg",@"http://oih52ss9e.bkt.clouddn.com/Topic_Photo2.jpg",@"http://oih52ss9e.bkt.clouddn.com/Topic_Photo3.jpg",@"http://oih52ss9e.bkt.clouddn.com/Topic_Photo4.jpg", nil];
    NSMutableDictionary * dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:Topic_Detail_Photos forKey:Topic_Detail_Type];
    [dict2 setObject:photosArray forKey:Topic_Detail_Content];


    NSString * highlightText = @"印第安人迷信捕梦网会把你每晚做的梦捕捉下来：坏梦见了阳光就消失，好梦留在网上成真。印地安传说中带上这种饰物，可避免恶灵在睡梦中侵入..";
    NSMutableDictionary * dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:Topic_Detail_Text_Highlight forKey:Topic_Detail_Type];
    [dict3 setObject:highlightText forKey:Topic_Detail_Content];
    
    
    NSString * detailText2 = @"曾经的原住民将充满自然神秘能量的捕梦网来挂在床头，它会补捉梦，但只留住恶梦、好梦则流回做梦的人；当太阳升起，网内的恶梦就会燃烧成烬并消失！";
    NSMutableDictionary * dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:Topic_Detail_Text_Normal forKey:Topic_Detail_Type];
    [dict4 setObject:detailText2 forKey:Topic_Detail_Content];
    
    
    RecommandItemModal * topicItemModal1 = [[RecommandItemModal alloc]init];
    [topicItemModal1 setProductTitle:@"黑色日月款捕梦网"];
    [topicItemModal1 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Item1.jpg"];
    [topicItemModal1 setProductPrice:@"60"];
    
    RecommandItemModal * topicItemModal2 = [[RecommandItemModal alloc]init];
    [topicItemModal2 setProductTitle:@"鹿顺 风铃捕梦网"];
    [topicItemModal2 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Item2.jpg"];
    [topicItemModal2 setProductPrice:@"77"];
    
    RecommandItemModal * topicItemModal3 = [[RecommandItemModal alloc]init];
    [topicItemModal3 setProductTitle:@" 异域捕梦网"];
    [topicItemModal3 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Item3.jpg"];
    [topicItemModal3 setProductPrice:@"95"];
    
    RecommandItemModal * topicItemModal4 = [[RecommandItemModal alloc]init];
    [topicItemModal4 setProductTitle:@"蜡线波西米亚捕梦网"];
    [topicItemModal4 setProductImgURL:@"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Item4.jpg"];
    [topicItemModal4 setProductPrice:@"138"];
    
    NSMutableDictionary * dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:Topic_Detail_Items forKey:Topic_Detail_Type];
    [dict5 setObject:[NSArray arrayWithObjects:topicItemModal1, topicItemModal2, topicItemModal3, topicItemModal4, nil] forKey:Topic_Detail_Content];
    
    NSString * detailText3 = @"美好的祝福，原始、温馨而又神秘，现今捕梦网已经在一些饰品店裡出现，成为现代家居新颖别致的摆设品，款式多种多样，有的网大疏鬆、有的网小密实，颜色也各有不同，吸引了不少年轻人购买，可能他们不知它的来历，但是喜欢它的特别和美丽，就买了送给自已的恋人或是好友，送上自已诚挚的心意和祝福。";
    NSMutableDictionary * dict6 = [NSMutableDictionary dictionary];
    [dict6 setObject:Topic_Detail_Text_Normal forKey:Topic_Detail_Type];
    [dict6 setObject:detailText3 forKey:Topic_Detail_Content];

    
    self.topicDetailModal.topicDetailInfoArray = [[NSMutableArray alloc]initWithObjects:dict1 ,dict2 ,dict3,
                                                                                        dict4, dict5, dict6, nil];

    
    self.topicDetailModal.topicDetailBottomInfoArray = [[NSMutableArray alloc]initWithObjects:
                                                        @"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Bottom1.jpg",
                                                        @"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Bottom2.png", nil];
    
}



-(void)initStoryDetailData
{
    self.storyDetailModal = [[StoryDetailModal alloc]init];
 
    [self.storyDetailModal setTimeStampTitle:@"26. Mar"];
    [self.storyDetailModal setSotryTitle:@"土耳其KILIM地毯的前世今生"];
    [self.storyDetailModal setStoryCoverImgURL:@"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Cover.jpg"];
 
    NSString * detailText1 = @"Kilim基利姆花毯是原产自土耳其、伊朗、巴基斯坦等地区的手织毛地毯，颜色鲜艳，毯面平滑柔软，颇受人们喜爱。";
    NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:Story_Detail_Text_Normal forKey:Story_Detail_Type];//设置类型
    [dict1 setObject:detailText1 forKey:Story_Detail_Content];//设置里面包含的内容
    
    NSString * highlightText = @"这种地毯仍采用绘画编织的传统工艺。地毯的图案通常是几何图形和有象征意义的抽象图案，如邪恶之眼，鸟等，还有花卉图案。\n基里姆花毯还经常被用作挂毯、桌布或用来覆盖箱柜和长椅。\n而零碎余料常用来做家具装饰、靠垫、背包甚至鞋子。";
    NSMutableDictionary * dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:Story_Detail_Text_Highlight forKey:Story_Detail_Type];
    [dict2 setObject:highlightText forKey:Story_Detail_Content];
    
    NSArray * photosArray1 = [[NSArray alloc]initWithObjects:
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo1.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo2.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo3.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo4.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo5.jpg",
                             nil];
    NSMutableDictionary * dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:Story_Detail_Photos forKey:Story_Detail_Type];
    [dict3 setObject:photosArray1 forKey:Story_Detail_Content];
    
    NSString *detailText2 = @"真正的Kilim采用双面平织工艺，正反面都可使用；\n其工艺复杂，都是匠人手工一针一线钩织而成，因此每一张Kilim都显得更加独一无二。";
    NSMutableDictionary * dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:Story_Detail_Text_Normal forKey:Story_Detail_Type];//设置类型
    [dict4 setObject:detailText2 forKey:Story_Detail_Content];//设置里面包含的内容
    
    
    NSArray * photosArray2 = [[NSArray alloc]initWithObjects:
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo6.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo7.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo8.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo9.jpg",
                             @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Photo10.jpg",
                             nil];
    NSMutableDictionary * dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:Story_Detail_Photos forKey:Story_Detail_Type];
    [dict5 setObject:photosArray2 forKey:Story_Detail_Content];
    
    NSString *detailText3 = @"花毯是采用回话编织的传统工艺，而其中用传统蔬菜上色的Kilim花毯最为人们所赞赏，因为它是采用土耳其本地各种植物提炼出不同的颜色浸泡而成，对羊毛侵蚀较轻，颜色精美、材质耐用、永不褪色。";
    NSMutableDictionary * dict6 = [NSMutableDictionary dictionary];
    [dict6 setObject:Story_Detail_Text_Normal forKey:Story_Detail_Type];//设置类型
    [dict6 setObject:detailText3 forKey:Story_Detail_Content];//设置里面包含的内容
    
    
    self.storyDetailModal.storyDetailInfoArray = [[NSMutableArray alloc]initWithObjects:dict1, dict2, dict3, dict4,dict5,dict6, nil];

    
    self.storyDetailModal.storyDetailBottomInfoArray = [[NSMutableArray alloc]initWithObjects:
                                                        @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Bottom1.jpg",
                                                        @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Bottom2.jpg",
                                                        @"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Bottom2.png", nil];

}


-(void)initCreatorDetailData
{
    self.creatorDetailModal = [[CreatorDetailModal alloc]init];
    
    [self.creatorDetailModal setCreatorID:[NSNumber numberWithInteger:1]];
    [self.creatorDetailModal setCreatorName:@"阁楼Pentfair"];
    [self.creatorDetailModal setCreatorSlogan:@"异域旅行发现，忠于内心的色彩"];
    [self.creatorDetailModal setCreatorCoverImgURL:@"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_Top.jpeg"];
    
    
    NSString * highlightText = @"八千里路云和月\n要烟火 也要生活\n旅行纪念也好 异域软装也罢\n都是我们对漂泊感\n保持忠诚的方式";
    NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:Creator_Detail_Text_Highlight forKey:Creator_Detail_Type];
    [dict1 setObject:highlightText forKey:Creator_Detail_Content];
    
    NSString * photoURL = @"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_1.png";
    NSMutableDictionary * dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:Creator_Detail_Photo forKey:Creator_Detail_Type];
    [dict2 setObject:photoURL forKey:Creator_Detail_Content];
    

    NSString * boldText = @"旅行紀念館 / 獨立設計手作\n公路文化商店 / 异域服飾软装";
    NSMutableDictionary * dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:Creator_Detail_Text_Bold forKey:Creator_Detail_Type];
    [dict3 setObject:boldText forKey:Creator_Detail_Content];
    
    NSString * normalText1 = @"复古木纹黑胶唱片机 / 墨西哥彩虹毯\n曼达拉挂布 / 白色编织wall weaving\n大号捕梦网 / 秘鲁刺绣抱枕 / 蓝染家居\n蓝粉莲花挂布组合 / 墨西哥仙人掌\n波西米亚woven挂毯 / 蓝色孔雀曼达拉\n墨西哥serape毛毯\n……";
    NSMutableDictionary * dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:Creator_Detail_Text_Normal forKey:Creator_Detail_Type];
    [dict4 setObject:normalText1 forKey:Creator_Detail_Content];
    
    
    NSArray * photosArray = [[NSArray alloc]initWithObjects:
                                @"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_2.jpg",
                                @"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_3.jpg",
                                @"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_4.jpg",
                                @"http://oih52ss9e.bkt.clouddn.com/Creator_Detail_5.jpg",
                              nil];
    
    NSMutableDictionary * dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:Creator_Detail_More_Photos forKey:Creator_Detail_Type];
    [dict5 setObject:photosArray forKey:Creator_Detail_Content];
    
    
    NSArray * itemsArray = self.recommandItemsArray;
    NSMutableDictionary * dict6 = [NSMutableDictionary dictionary];
    [dict6 setObject:Creator_Detail_Items forKey:Creator_Detail_Type];
    [dict6 setObject:itemsArray forKey:Creator_Detail_Content];
    
    
    NSString *normalText2 = @"轻装修 重装饰 波西米亚要赢在智性选择\n可是拥有了以下这些搭配单品还远远不够\n美好的装饰必先与人联结\n使其既能锦上添花\n更是具有再创作意义的个性表达";
    NSMutableDictionary * dict7 = [NSMutableDictionary dictionary];
    [dict7 setObject:Creator_Detail_Text_Normal forKey:Creator_Detail_Type];
    [dict7 setObject:normalText2 forKey:Creator_Detail_Content];

    self.creatorDetailModal.creatorDetailInfoArray = [[NSMutableArray alloc]initWithObjects:dict1, dict2, dict3, dict4, dict5, dict6, dict7, nil];

    
    self.creatorDetailModal.creatorDetailBottomInfoArray = [[NSMutableArray alloc]initWithObjects:
                                                        @"http://oih52ss9e.bkt.clouddn.com/Story_Detail_Bottom1.jpg",
                                                        @"http://oih52ss9e.bkt.clouddn.com/Topic_Detail_Bottom2.png", nil];
    
}



#pragma mark -设置假用户数据
-(void)setLogInUserInfo
{
    [[VibeAppTool sharedInstance] clearLoginUserInfo];
    
    MineProfileModal * userModal = [[MineProfileModal alloc]init];
    [userModal setUserAvatarImgURL:@"http://oih52ss9e.bkt.clouddn.com/8f030e428bfa9fb18548d7eae43d340e.jpg"];
    [userModal setUserName:@"Tinaॐ"];
    [userModal setUserID:[NSNumber numberWithInt:1]];
    [userModal setUserSignature:@"每个不曾起舞的日子，都是对生命的辜负"];
    
    [[VibeAppTool sharedInstance] setLoginUserInfo:userModal];
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
