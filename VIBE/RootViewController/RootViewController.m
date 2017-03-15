//
//  RootViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setIsWideNaviView:YES];
    
//    UIView * viewwwwww = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth *3, kScreenHeight)];
//    [viewwwwww setBackgroundColor:DefaultBackgroundColor];
//    [self.view addSubview:viewwwwww];
    
    _rootScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_rootScrollView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView setPagingEnabled:YES];
    [_rootScrollView setBounces:YES];
    [_rootScrollView setDelegate:self];
    [_rootScrollView setContentSize:CGSizeMake(kScreenWidth *3, kScreenHeight -Wide_Navi_View_Height)];
    [_rootScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:_rootScrollView];
   
    
    [self initNaviBar];
    
    [self initRecommandViews];
    [self initCreatorViews];
    [self initDiscoverViews];
    
    [self initFakeData];
}


//初始化推荐页
-(void)initRecommandViews
{
    _recommandView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_recommandView setBackgroundColor:[UIColor clearColor]];
    
    [_rootScrollView addSubview:_recommandView];
    
    _recommandTableView = [[RecommandTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [_recommandTableView setDelegateee:self];
    _recommandTableView.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    _recommandTableView.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
    [_recommandView addSubview:_recommandTableView];
    
    _recommandInfoDict = [[NSMutableDictionary alloc]init];
}

//初始化造物者说
-(void)initCreatorViews
{
    _creatorView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight)];
    [_creatorView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView addSubview:_creatorView];
    
    _creatorTableView = [[CreatorTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _creatorTableView.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height +10, 0, 0, 0);
    _creatorTableView.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height +10, 0, 0, 0);
    [_creatorView addSubview:_creatorTableView];
    
    _creatorArray = [[NSMutableArray alloc]init];
}

//初始化探索发现
-(void)initDiscoverViews
{
    _discoverView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth *2, 0, kScreenWidth, kScreenHeight)];
    [_discoverView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView addSubview:_discoverView];
    
    _discoverTableView = [[DiscoverTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _discoverTableView.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height +10, 0, 0, 0);
    _discoverTableView.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height +10, 0, 0, 0);
    [_discoverView addSubview:_discoverTableView];
    
    _discoverContentDict = [[NSMutableDictionary alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(discoverDidTapHotTagWithIndex:) name:DiscoverTapHotTagView object:nil];
}



#pragma mark -初始化假数据
-(void)initFakeData
{
    NSMutableArray * bArray = [NSMutableArray array];
    
    RecommandBannerModal * bannerModal1 = [[RecommandBannerModal alloc]init];
    [bannerModal1 setImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/42/b5/cb/42b5cbb8c1557a3b1fd233d218925968.jpg"];
    [bArray addObject:bannerModal1];
    RecommandBannerModal * bannerModal2 = [[RecommandBannerModal alloc]init];
    [bannerModal2 setImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/7e/20/5b/7e205bf285202867a892510ead12626f.jpg"];
    [bArray addObject:bannerModal2];
    RecommandBannerModal * bannerModal3 = [[RecommandBannerModal alloc]init];
    [bannerModal3 setImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/3f/42/8e/3f428eab6225aeb65793440e1fac7900.jpg"];
    [bArray addObject:bannerModal3];
    [_recommandInfoDict setObject:bArray forKey:@"banner"];

    
    NSMutableArray * categoryArray = [NSMutableArray array];
    RecommandCategoryModal * recommandModal1 = [[RecommandCategoryModal alloc]init];
    [recommandModal1 setCategoryImgURL:@"http://i1.piimg.com/567571/7d9c1d73d9669c11.png"];
    RecommandCategoryModal * recommandModal2 = [[RecommandCategoryModal alloc]init];
    [recommandModal2 setCategoryImgURL:@"http://i1.piimg.com/567571/0a1595d193998fc5.png"];
    RecommandCategoryModal * recommandModal3 = [[RecommandCategoryModal alloc]init];
    [recommandModal3 setCategoryImgURL:@"http://i1.piimg.com/567571/8461ab69b016406e.png"];
    RecommandCategoryModal * recommandModal4 = [[RecommandCategoryModal alloc]init];
    [recommandModal4 setCategoryImgURL:@"http://i1.piimg.com/567571/e42fd3e536674fe1.png"];
    RecommandCategoryModal * recommandModal5 = [[RecommandCategoryModal alloc]init];
    [recommandModal5 setCategoryImgURL:@"http://i1.piimg.com/567571/65fc1335ac26c17a.png"];
    RecommandCategoryModal * recommandModal6 = [[RecommandCategoryModal alloc]init];
    [recommandModal6 setCategoryImgURL:@"http://i1.piimg.com/567571/1bf1bfa47e0eae11.png"];
    RecommandCategoryModal * recommandModal7 = [[RecommandCategoryModal alloc]init];
    [recommandModal7 setCategoryImgURL:@"http://i1.piimg.com/567571/f244ab2dcd10c517.png"];
    RecommandCategoryModal * recommandModal8 = [[RecommandCategoryModal alloc]init];
    [recommandModal8 setCategoryImgURL:@"http://i1.piimg.com/567571/c87265d936e6df08.png"];
    RecommandCategoryModal * recommandModal9 = [[RecommandCategoryModal alloc]init];
    [recommandModal9 setCategoryImgURL:@"http://i1.piimg.com/567571/b6cd15d7a19e3736.png"];
    RecommandCategoryModal * recommandModal10 = [[RecommandCategoryModal alloc]init];
    [recommandModal10 setCategoryImgURL:@"http://i1.piimg.com/567571/69a5484ac7653bc9.png"];
    [categoryArray addObject:recommandModal1];
    [categoryArray addObject:recommandModal2];
    [categoryArray addObject:recommandModal3];
    [categoryArray addObject:recommandModal4];
    [categoryArray addObject:recommandModal5];
    [categoryArray addObject:recommandModal6];
    [categoryArray addObject:recommandModal7];
    [categoryArray addObject:recommandModal8];
    [categoryArray addObject:recommandModal9];
    [categoryArray addObject:recommandModal10];
    [_recommandInfoDict setObject:categoryArray forKey:@"category"];
    
    
    NSMutableArray * topicsArray = [NSMutableArray array];
    
    VibeTopicModal * topicModal1 = [[VibeTopicModal alloc]init];
    [topicModal1 setTopicImgURL:@"http://p1.bpimg.com/567571/ee75e81e22b17865.png"];
    [topicModal1 setTopicTitle:@"迷醉于土耳其的绚丽多彩"];
    [topicModal1 setTopicID:[NSNumber numberWithInteger:1]];
    NSArray * tagArray1 = [NSArray arrayWithObjects:@"旅行",@"民族风",@"土耳其",@"异域", nil];
    topicModal1.topicTagsArray = [NSArray arrayWithArray:tagArray1];
    [topicModal1 setTopicLookedNumber:[NSNumber numberWithInteger:873]];
    [topicModal1 setTopicFavorNumber:[NSNumber numberWithInteger:302]];
    [topicsArray addObject:topicModal1];
    
    VibeTopicModal * topicModal2 = [[VibeTopicModal alloc]init];
    [topicModal2 setTopicImgURL:@"http://p1.bpimg.com/567571/aec75762d5f7a4c0.png"];
    [topicModal2 setTopicTitle:@"食之精,器之美"];
    [topicModal2 setTopicID:[NSNumber numberWithInteger:2]];
    NSArray * tagArray2 = [NSArray arrayWithObjects:@"家居",@"美食与爱",@"木器", nil];
    topicModal2.topicTagsArray = [NSArray arrayWithArray:tagArray2];
    [topicModal2 setTopicLookedNumber:[NSNumber numberWithInteger:257]];
    [topicModal2 setTopicFavorNumber:[NSNumber numberWithInteger:51]];
    [topicsArray addObject:topicModal2];
    
    VibeTopicModal * topicModal3 = [[VibeTopicModal alloc]init];
    [topicModal3 setTopicImgURL:@"http://p1.bpimg.com/567571/a7d8dfbccdee4778.png"];
    [topicModal3 setTopicTitle:@"自由肆意的吉普赛风情"];
    [topicModal3 setTopicID:[NSNumber numberWithInteger:3]];
    NSArray * tagArray3 = [NSArray arrayWithObjects:@"首饰",@"手工原创",@"部落风", nil];
    topicModal3.topicTagsArray = [NSArray arrayWithArray:tagArray3];
    [topicModal3 setTopicLookedNumber:[NSNumber numberWithInteger:2416]];
    [topicModal3 setTopicFavorNumber:[NSNumber numberWithInteger:1632]];
    [topicsArray addObject:topicModal3];
    [_recommandInfoDict setObject:topicsArray forKey:@"topic"];
    
    
    
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
    
    NSMutableArray * productsArray = [NSMutableArray arrayWithObjects:productModal1,productModal2,productModal3, nil];
    [_recommandInfoDict setObject:productsArray forKey:@"product"];

    [_recommandTableView setRecommandInfoDict:_recommandInfoDict];
    
    CreatorCoverModal * creatorModal1 = [[CreatorCoverModal alloc]init];
    [creatorModal1 setCreatorImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/6f/72/28/6f7228548422957a77a9b2a711034843.jpg"];
    [creatorModal1 setCreatorTitle:@"钟爱绚烂的墨西哥风情，只因生活本该丰富多彩"];
    [creatorModal1 setCreatorShopName:@"PentFair阁楼"];
    [creatorModal1 setCreatorLookedNumber:[NSNumber numberWithInt:1255]];
    [creatorModal1 setCreatorFavorNumber:[NSNumber numberWithInt:768]];
    
    CreatorCoverModal * creatorModal2 = [[CreatorCoverModal alloc]init];
    [creatorModal2 setCreatorImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/09/a3/38/09a3380b219798f8eeb50b74e8270b11.jpg"];
    [creatorModal2 setCreatorTitle:@"灵性能量手工饰品，连接天地间的语言祈祷及祝愿"];
    [creatorModal2 setCreatorShopName:@"香巴拉 Creation"];
    [creatorModal2 setCreatorLookedNumber:[NSNumber numberWithInt:284]];
    [creatorModal2 setCreatorFavorNumber:[NSNumber numberWithInt:32]];
    
    CreatorCoverModal * creatorModal3 = [[CreatorCoverModal alloc]init];
    [creatorModal3 setCreatorImgURL:@"http://atmedia.imgix.net/5cffcfd3e8424e01c26b4115f8a9a9b1916aa831?auto=compress&w=800.0&fit=max"];
    [creatorModal3 setCreatorTitle:@"小囍手作，传递对于生活永无止境的热爱和好奇"];
    [creatorModal3 setCreatorShopName:@"小喜xiaoxi"];
    [creatorModal3 setCreatorLookedNumber:[NSNumber numberWithInt:468]];
    [creatorModal3 setCreatorFavorNumber:[NSNumber numberWithInt:105]];
    
    CreatorCoverModal * creatorModal4 = [[CreatorCoverModal alloc]init];
    [creatorModal4 setCreatorImgURL:@"http://i1.piimg.com/567571/94b91c38060019e4.jpg"];
    [creatorModal4 setCreatorTitle:@"从心出发，回归茶之本色"];
    [creatorModal4 setCreatorShopName:@"YU茶舍"];
    [creatorModal4 setCreatorLookedNumber:[NSNumber numberWithInt:87]];
    [creatorModal4 setCreatorFavorNumber:[NSNumber numberWithInt:12]];
    
    [_creatorArray addObject:creatorModal1];
    [_creatorArray addObject:creatorModal2];
    [_creatorArray addObject:creatorModal3];
    [_creatorArray addObject:creatorModal4];
    
    [_creatorTableView setCreatorTableWithContent:_creatorArray];
    
    
    NSMutableArray * hotTagsArray = [[NSMutableArray alloc]init];
    
    DiscoverHotTagModal * hotTagModal1 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal1 setDiscoverHotTagTitle:@"水晶首饰"];
    [hotTagModal1 setDiscoverHotTagImgUrl:@"http://7xrn7f.com1.z0.glb.clouddn.com/16-10-13/36792848.jpg"];
    [hotTagsArray addObject:hotTagModal1];
    DiscoverHotTagModal * hotTagModal2 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal2 setDiscoverHotTagTitle:@"BOHO"];
    [hotTagModal2 setDiscoverHotTagImgUrl:@"http://p1.bqimg.com/567571/ddc117c4e327b9e3.jpg"];
    [hotTagsArray addObject:hotTagModal2];
    DiscoverHotTagModal * hotTagModal3 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal3 setDiscoverHotTagTitle:@"美食与爱"];
    [hotTagModal3 setDiscoverHotTagImgUrl:@"http://p1.bqimg.com/567571/e7d28504df6a49d3.jpg"];
    [hotTagsArray addObject:hotTagModal3];
    DiscoverHotTagModal * hotTagModal4 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal4 setDiscoverHotTagTitle:@"印第安纳瓦霍"];
    [hotTagModal4 setDiscoverHotTagImgUrl:@"http://p1.bqimg.com/567571/ae33cd40f6f737af.jpg"];
    [hotTagsArray addObject:hotTagModal4];
    DiscoverHotTagModal * hotTagModal5 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal5 setDiscoverHotTagTitle:@"服饰配件"];
    [hotTagModal5 setDiscoverHotTagImgUrl:@"http://p1.bqimg.com/567571/23f4947111d77752.jpg"];
    [hotTagsArray addObject:hotTagModal5];
    DiscoverHotTagModal * hotTagModal6 = [[DiscoverHotTagModal alloc]init];
    [hotTagModal6 setDiscoverHotTagTitle:@"传统手工"];
    [hotTagModal6 setDiscoverHotTagImgUrl:@"http://p1.bqimg.com/567571/28fce986ba30f060.jpg"];
    [hotTagsArray addObject:hotTagModal6];
    [_discoverContentDict setObject:hotTagsArray forKey:@"tags"];
    
    
    NSMutableArray  * albumsArray = [[NSMutableArray alloc]init];
    
    DiscoverTopicModal * discoverAlbumModal1 = [[DiscoverTopicModal alloc]init];
    [discoverAlbumModal1 setDiscoverTopicTitle:@"露营野餐正当时"];
    [discoverAlbumModal1 setDiscoverTopicImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/25/e2/78/25e2786c8b1514a9cdc0879726248ecc.jpg"];
    [discoverAlbumModal1 setDiscoverTopicLookedNumber:[NSNumber numberWithInteger:1520]];
    [discoverAlbumModal1 setDiscoverTopicFavorNumber:[NSNumber numberWithInteger:801]];
    discoverAlbumModal1.discoverTopicTagArray = [[NSArray alloc]initWithObjects:@"户外", @"野餐", @"IntoTheWild", nil];
    [albumsArray addObject:discoverAlbumModal1];
    
    DiscoverTopicModal * discoverAlbumModal2 = [[DiscoverTopicModal alloc]init];
    [discoverAlbumModal2 setDiscoverTopicTitle:@"DreamCatcher 愿美梦相伴"];
    [discoverAlbumModal2 setDiscoverTopicImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/7e/4b/85/7e4b8555dfd141f19f8e09c9cd785b00.jpg"];
    [discoverAlbumModal2 setDiscoverTopicLookedNumber:[NSNumber numberWithInteger:942]];
    [discoverAlbumModal2 setDiscoverTopicFavorNumber:[NSNumber numberWithInteger:255]];
    discoverAlbumModal2.discoverTopicTagArray = [[NSArray alloc]initWithObjects:@"旅行", @"吉普赛", @"在路上", nil];
    [albumsArray addObject:discoverAlbumModal2];

    DiscoverTopicModal * discoverAlbumModal3 = [[DiscoverTopicModal alloc]init];
    [discoverAlbumModal3 setDiscoverTopicTitle:@"-JOURNEY UNKNOWN-\n旅行路上不容错过之物"];
    [discoverAlbumModal3 setDiscoverTopicImgURL:@"https://s-media-cache-ak0.pinimg.com/564x/ca/14/e1/ca14e14688e3274768eecc3ca33412b5.jpg"];
    [discoverAlbumModal3 setDiscoverTopicLookedNumber:[NSNumber numberWithInteger:421]];
    [discoverAlbumModal3 setDiscoverTopicFavorNumber:[NSNumber numberWithInteger:76]];
    discoverAlbumModal3.discoverTopicTagArray = [[NSArray alloc]initWithObjects:@"生活美物", @"家居", @"Kilim", nil];
    [albumsArray addObject:discoverAlbumModal3];
    
    [_discoverContentDict setObject:hotTagsArray forKey:@"albums"];
    
    [_discoverTableView setDiscoverTableWithHotTagsArray:hotTagsArray AlbumsArray:albumsArray];
}


#pragma mark -初始化导航栏
-(void)initNaviBar
{
    [self.backBtn setHidden:YES];
    
    _profileBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 30, 18, 18)];
    [_profileBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Profile"] forState:UIControlStateNormal];
    [_profileBtn addTarget:self action:@selector(profileClick) forControlEvents:UIControlEventTouchUpInside];
    [self.topNavView addSubview:_profileBtn];
    
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -15 -18, 30, 18, 18)];
    [_searchBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Search"] forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    [self.topNavView addSubview:_searchBtn];
  
    _naviSegmentControl = [[LUNSegmentedControl alloc]init];
    [_naviSegmentControl setBackgroundColor:RGBA(250, 250, 250, 90)];
    _naviSegmentControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.topNavView addSubview:_naviSegmentControl];
    
    //创建左边约束
    NSLayoutConstraint *leftLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.topNavView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:22];
    [self.topNavView addConstraint:leftLc];
    
    //创建右边约束
    NSLayoutConstraint *rightLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.topNavView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-22];
    [self.topNavView addConstraint:rightLc];
    
    //创建底部约束
    NSLayoutConstraint *bottomLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.topNavView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.topNavView addConstraint:bottomLc];

    //创建高度约束
    NSLayoutConstraint *heightLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:29];
    [self.topNavView addConstraint: heightLc];

    
    _naviSegmentControl.transitionStyle = LUNSegmentedControlTransitionStyleFade;
    _naviSegmentControl.shapeStyle = LUNSegmentedControlShapeStyleLiquid;
    _naviSegmentControl.selectorViewColor = [UIColor clearColor];
    _naviSegmentControl.applyCornerRadiusToSelectorView = YES;
    [_naviSegmentControl setDataSource:self];
    [_naviSegmentControl setDelegate:self];
    [_naviSegmentControl setShadowHideDuration:0.1f];
    [_naviSegmentControl setShadowShowDuration:0.1f];
    [_naviSegmentControl showLoading];
    [_naviSegmentControl setCornerRadius:14];
    
    [_naviSegmentControl reloadData];
    [_naviSegmentControl dismissLoading];
    
    [self.view bringSubviewToFront:self.topNavView];
}


- (NSArray<UIColor *> *)segmentedControl:(LUNSegmentedControl *)segmentedControl gradientColorsForStateAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return @[RGB(182, 229, 121), RGB(26 , 212, 205)];
            break;
        case 1:
            return @[RGB(117, 138, 239),RGB(237 ,132, 221)];
            break;
        case 2:
            return @[RGB(242, 105, 105),RGB(240 ,185, 90)];
            break;
        default:
            break;
    }
    return nil;
}

- (NSInteger)numberOfStatesInSegmentedControl:(LUNSegmentedControl *)segmentedControl
{
    return 3;
}

- (NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForStateAtIndex:(NSInteger)index
{
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"精选推荐"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font size:14]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"造物者说"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font size:14]}];
    }
    else if (index == 2) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"探索发现"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font size:14]}];
    }
    return nil;
}

- (NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForSelectedStateAtIndex:(NSInteger)index {
    
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"精选推荐"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font_Bold size:14]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"造物者说"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font_Bold size:14]}];
    }
    else if (index == 2) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"探索发现"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font_Bold size:14]}];
    }
    return nil;
}

- (void)segmentedControl:(LUNSegmentedControl *)segmentedControl didChangeStateFromStateAtIndex:(NSInteger)fromIndex toStateAtIndex:(NSInteger)toIndex
{
    NSLog(@"~~~~~~ %ld ~~~~~~~ %ld ~~~~~~",fromIndex,toIndex);
    [_rootScrollView setContentOffset:CGPointMake(kScreenWidth *toIndex, 0) animated:YES];
}


-(void)profileClick
{
    [VibeAppTool setUserLogin:YES];
    
    BOOL isLogIn = [VibeAppTool isUserLogIn];
    
    if (!isLogIn) {
        VibeLogInViewController * logInVC = [[VibeLogInViewController alloc]init];
        logInVC.isPopUp = YES;
        LCNavigationController * navi = [[LCNavigationController alloc]initWithRootViewController:logInVC];
        [navi setCanDragPop:NO];
        [self.lcNavigationController presentViewController:navi animated:YES completion:nil];
    }
    else{
        MineViewController * mineVC = [[MineViewController alloc]init];
        mineVC.isPopUp =YES;
        LCNavigationController * navi = [[LCNavigationController alloc]initWithRootViewController:mineVC];
        [self.lcNavigationController presentViewController:navi animated:YES completion:nil];
    }
    
}


-(void)searchClick
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
        
        [_profileBtn setAlpha:0.0f];
        [_searchBtn setAlpha:0.0f];
        
        [_naviSegmentControl setAlpha:0.0f];
    }];
}

-(void)showTopviewSubviews
{
    [UIView animateWithDuration:1.2f animations:^{
        
        [_profileBtn setAlpha:1.0f];
        [_searchBtn setAlpha:1.0f];
        
        [_naviSegmentControl setAlpha:1.0f];
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
    [self performSelector:@selector(pushToSearchResultVC:) withObject:keyword afterDelay:0.4f];
}

-(void)pushToSearchResultVC:(NSString *)searchKeyword
{
    SearchResultViewController * resultVC = [[SearchResultViewController alloc]init];
    resultVC.searchKeyword = searchKeyword;
    [self.lcNavigationController pushViewController:resultVC];
}


#pragma mark -点击发现页热门标签
-(void)discoverDidTapHotTagWithIndex:(NSNotification *)notification
{
    NSDictionary * dict = notification.userInfo;
    NSInteger hotTagViewIndex = [[dict objectForKey:@"HotTagViewIndex"] integerValue];
    
    NSArray * tagsArray = [_discoverContentDict objectForKey:@"tags"];
    DiscoverHotTagModal * tagModal = [tagsArray objectAtIndex:hotTagViewIndex];
    
    SearchShowProductsViewController * showProductsVC = [[SearchShowProductsViewController alloc]init];
    showProductsVC.searchKeyword = tagModal.discoverHotTagTitle;
    [self.lcNavigationController pushViewController:showProductsVC];
    
    NSLog(@"******  %@  *******",tagModal.discoverHotTagTitle);
}


#pragma mark -scrollview Delegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"#####");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offsetX = scrollView.contentOffset.x;
 
    NSLog(@"~~~~~~ %g ~~~~~~~",offsetX);
    
    if (offsetX == 0) {
        [_naviSegmentControl setCurrentState:0];
    }
    else if (offsetX == kScreenWidth){
        [_naviSegmentControl setCurrentState:1];
    }
    else if (offsetX == kScreenWidth *2){
        [_naviSegmentControl setCurrentState:2];
    }
}


#pragma mark - RecommandTableView 的代理

//点击Banner
-(void)recommandTableDidClickBannerWithIndex:(NSInteger )index
{
    WebViewController * webVC = [[WebViewController alloc]init];
    [webVC setLinkURL:@"http://www.163.com"];
    [self.lcNavigationController presentViewController:webVC animated:YES completion:nil];
}

//点击分类
-(void)recommandTableDidClickCategoryWithIndex:(NSInteger)index
{
    CategoryListViewController * categoryListVC = [[CategoryListViewController alloc]init];
    [self.lcNavigationController pushViewController:categoryListVC];
}

//点击专题
-(void)recommandTableDidClickTopicWithIndex:(NSInteger)index
{
    TopicDetailViewController * topicDetailVC = [[TopicDetailViewController alloc]init];
    [self.lcNavigationController pushViewController:topicDetailVC];
}

//点击单品
-(void)recommandTableDidClickProductWithIndex:(NSInteger)index
{
    NewProductDetailViewController * productDetailVC = [[NewProductDetailViewController alloc]init];
    NSArray * arrayyy =  [_recommandInfoDict objectForKey:@"product"];
    VibeProductModal * productModal = [arrayyy objectAtIndex:index];
    productDetailVC.productDetailModal = productModal;
    [self.lcNavigationController pushViewController:productDetailVC];
}


#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
