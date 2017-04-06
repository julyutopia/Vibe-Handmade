//
//  MainViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/5.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    _backView = [[UIView alloc]initWithFrame:self.view.frame];
    [_backView setBackgroundColor:DefaultWhite];
    [self.view addSubview:_backView];
    
    [self initScrollView];
    [self initTableView];
    [self initNaviView];
}



-(void)initNaviView
{
    //导航栏
    _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    [_navigationView setBackgroundColor:RGBA(255, 255, 255, 85)];
    [self.view addSubview:_navigationView];
    [self.view bringSubviewToFront:_navigationView];
    
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    [backView setEffect:blurEffect];
    [_navigationView addSubview:backView];
    
    
    //个人按钮
    _profileBtn = [[UIButton alloc]initWithFrame:CGRectMake(27, 35, 16, 16)];
    [_profileBtn setBackgroundImage:[UIImage imageNamed:@"Profile_Normal"] forState:UIControlStateNormal];
    [_profileBtn setBackgroundImage:[UIImage imageNamed:@"Profile_High_Light"] forState:UIControlStateHighlighted];
    [_navigationView addSubview:_profileBtn];
    
    //搜索按钮
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -27 -16, 35, 16, 16)];
    [_searchBtn setBackgroundImage:[UIImage imageNamed:@"Search_Normal"] forState:UIControlStateNormal];
    [_searchBtn setBackgroundImage:[UIImage imageNamed:@"Search_Hight_Light"] forState:UIControlStateHighlighted];
    [_navigationView addSubview:_searchBtn];
    
    //滑动选项视图
    _naviSegmentControl = [[LUNSegmentedControl alloc]init];
    [_naviSegmentControl setBackgroundColor:RGBA(250, 250, 250, 90)];
    _naviSegmentControl.translatesAutoresizingMaskIntoConstraints = NO;
    [_navigationView addSubview:_naviSegmentControl];
    
    //创建左边约束
    NSLayoutConstraint *leftLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_navigationView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [_navigationView addConstraint:leftLc];
    
    //创建右边约束
    NSLayoutConstraint *rightLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_navigationView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [_navigationView addConstraint:rightLc];
    
    //创建底部约束
    NSLayoutConstraint *bottomLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_navigationView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-12];
    [_navigationView addConstraint:bottomLc];
    
    //创建高度约束
    NSLayoutConstraint *heightLc = [NSLayoutConstraint constraintWithItem:_naviSegmentControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:28];
    [_navigationView addConstraint: heightLc];
    
    //设置参数
    _naviSegmentControl.textColor = RGBA(69, 69, 83, 100);
    _naviSegmentControl.selectedStateTextColor = DefaultWhite;
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

}


-(void)initScrollView
{
    float scrollViewOriginY = 100 +20;
    
    _rootScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_rootScrollView setBackgroundColor:DefaultWhite];
    [_rootScrollView setPagingEnabled:YES];
    [_rootScrollView setBounces:YES];
    [_rootScrollView setDelegate:self];
    [_rootScrollView setContentSize:CGSizeMake(kScreenWidth *3, kScreenHeight)];
    [_rootScrollView setShowsHorizontalScrollIndicator:NO];
    [_backView addSubview:_rootScrollView];
 
    
    //初始化 推荐首页
    _recommandView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_recommandView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView addSubview:_recommandView];
  
    
    _recommandTableView = [[NewRecommandTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [_recommandTableView setDelegateee:self];
    _recommandTableView.contentInset = UIEdgeInsetsMake(scrollViewOriginY, 0, 0, 0);
    _recommandTableView.scrollIndicatorInsets = UIEdgeInsetsMake(scrollViewOriginY, 0, 0, 0);
    [_recommandView addSubview:_recommandTableView];
    
    
    
    _discoverView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight)];
    [_discoverView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView addSubview:_discoverView];
    
    _creatorView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth *2, 0, kScreenWidth, kScreenHeight)];
    [_creatorView setBackgroundColor:[UIColor clearColor]];
    [_rootScrollView addSubview:_creatorView];
    
}


-(void)initTableView
{

}




-(NSArray<UIColor *> *)segmentedControl:(LUNSegmentedControl *)segmentedControl gradientColorsForStateAtIndex:(NSInteger)index
{

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



-(NSInteger)numberOfStatesInSegmentedControl:(LUNSegmentedControl *)segmentedControl
{
    return 3;
}


-(NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForStateAtIndex:(NSInteger)index
{
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"精选推荐"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:13]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"灵感探索"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:13]}];
    }
    else if (index == 2) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"造物者说"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:13]}];
    }
    
    return nil;
    
}


-(NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForSelectedStateAtIndex:(NSInteger)index {
    
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"精选推荐"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:14]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"灵感探索"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:14]}];
    }
    else if (index == 2) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"造物者说"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Font_Chinese_Regular size:14]}];
    }
    return nil;
    
}


-(void)segmentedControl:(LUNSegmentedControl *)segmentedControl didChangeStateFromStateAtIndex:(NSInteger)fromIndex toStateAtIndex:(NSInteger)toIndex
{
    NSLog(@"~~~~~~ %ld ~~~~~~~ %ld ~~~~~~",fromIndex,toIndex);
//    [_rootScrollView setContentOffset:CGPointMake(kScreenWidth *toIndex, 0) animated:YES];
}





#pragma mark 
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end



