//
//  SearchResultViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _topBarBackImgView = [[GLImageView alloc]initWithFrame:CGRectMake(60, 30, kScreenWidth -80, 30)];
    [_topBarBackImgView.layer setCornerRadius:8.0f];
    [_topBarBackImgView.layer setMasksToBounds:YES];
    [self.navigationView addSubview:_topBarBackImgView];
    
    _topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -80, 30)];
    [_topBarView setBackgroundColor:RGBA(248, 248, 248, 100)];
    [_topBarBackImgView addSubview:_topBarView];
    
    
    _topBarSearchIcon = [[UIImageView alloc]init];
    [_topBarSearchIcon setImage:[UIImage imageNamed:@"Search_Result_Placeholder"]];
    [_topBarBackImgView addSubview:_topBarSearchIcon];
    
    _topBarTitleLabel = [[UILabel alloc]init];
    [_topBarTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [_topBarTitleLabel setTextColor:RGBA(146, 146, 175, 60)];
    [_topBarTitleLabel setFont:[UIFont fontWithName:Font_Chinese_Regular size:13]];
    [_topBarBackImgView addSubview:_topBarTitleLabel];

    
    [self setNaviViewContent];
    
    [self initCollectionView];
}

-(void)initCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 20;
    //最小两行之间的间距
    layout.minimumLineSpacing = 15;
    
    
    _searchResultCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60, kScreenHeight) collectionViewLayout:layout];
    _searchResultCollectionView.backgroundColor=[UIColor clearColor];
    _searchResultCollectionView.delegate=self;
    _searchResultCollectionView.dataSource=self;
    _searchResultCollectionView.contentInset = UIEdgeInsetsMake(Navi_View_Height +20, 0, 0, 0);
    _searchResultCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(Navi_View_Height +20, 0, 0, 0);
    [_searchResultCollectionView setShowsVerticalScrollIndicator:NO];
    [self.view insertSubview:_searchResultCollectionView belowSubview:self.navigationView];
    
    [_searchResultCollectionView registerClass:[SearchResultCollectionViewCell class] forCellWithReuseIdentifier:@"SearchResultCollectionViewCellIdentifier"];
    
    _searchResultProductsArray = [[NSMutableArray alloc]init];
    //添加数据
    [_searchResultProductsArray addObjectsFromArray:[AppDelegate sharedAppDelegate].searchResultArray];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > -Navi_View_Height && self.navigationLineView.hidden == YES) {
        
        [_topBarView setBackgroundColor:RGBA(238, 238, 238, 100)];
        [self.navigationLineView setHidden:NO];
    }
    else if (scrollView.contentOffset.y <= -Navi_View_Height && self.navigationLineView.hidden == NO){
        [_topBarView setBackgroundColor:RGBA(248, 248, 248, 100)];
        [self.navigationLineView setHidden:YES];
    }
}

#pragma mark -CollectionView代理方法
//脚部试图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth -60, 25);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _searchResultProductsArray.count;
}

//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_searchResultProductsArray.count) {
        
        SearchResultCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultCollectionViewCellIdentifier" forIndexPath:indexPath];
        
        RecommandItemModal * modal = [_searchResultProductsArray objectAtIndex:indexPath.row];
        
        [cell setSearchResultCollectionViewCellWithModal:modal];
        
        return cell;
    }
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultCollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor blueColor];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (_searchResultProductsArray.count) {
        return UIEdgeInsetsMake(0, 0, 0, 20);
    }
    
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_searchResultProductsArray.count) {
        
        float singleViewLayoutWidth = (kScreenWidth -60 -20 -20)/2;
        return CGSizeMake( singleViewLayoutWidth, singleViewLayoutWidth +55);
    }
   
    return CGSizeZero;
}


-(void)setNaviViewContent
{
    float topBarWidth = kScreenWidth -80;
    
    float topBarTitleLabelWidth = [self.searchKeyword getSizeWithLimitSize:CGSizeMake(200, 20) withFont:_topBarTitleLabel.font].width;
    
    [_topBarTitleLabel setFrame:CGRectMake( (topBarWidth -topBarTitleLabelWidth)/2 +12, 0, topBarTitleLabelWidth, 30)];
    [_topBarTitleLabel setText:self.searchKeyword];
    
    [_topBarSearchIcon setFrame:CGRectMake((topBarWidth -topBarTitleLabelWidth)/2 -6, 10, 12, 12)];
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
