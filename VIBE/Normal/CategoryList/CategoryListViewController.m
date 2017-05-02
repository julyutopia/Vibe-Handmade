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


-(id)initWithCateModal:(RecommandCateModal *)modal
{
    self = [super init];
    
    if (self)
    {
        _cateModal = modal;
    }

    return self;
}



-(void)viewDidLoad
{
    [super viewDidLoad];

    [self setNaviView];
    
    _subCateArray = [[NSMutableArray alloc]init];
    
    _categoryItemsArray = [[NSMutableArray alloc]init];
    [_categoryItemsArray addObjectsFromArray:[AppDelegate sharedAppDelegate].recommandItemsArray];

    _didRecordAutoScroll = NO;
}


//设置导航栏UI
-(void)setNaviView
{
    _newNaviHeight = kScreenWidth/3;
    
    _backBlurImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth -12, _newNaviHeight -12)];
    [_backBlurImgView setHidden:YES];
    [_backBlurImgView setBackgroundColor:[UIColor whiteColor]];
    [_backBlurImgView.layer setShadowColor:RGBA(100, 100, 100, 30).CGColor];
    [_backBlurImgView.layer setShadowOffset:CGSizeMake(4, 6)];
    [_backBlurImgView.layer setShadowOpacity:0.8f];
    [_backBlurImgView.layer setShadowRadius:8.0f];
    [self.view insertSubview:_backBlurImgView belowSubview:self.navigationView];
    
    
    [self.navigationView setFrame:CGRectMake(0, 0, kScreenWidth, _newNaviHeight)];

    _naviImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _newNaviHeight)];
    [_naviImgView.layer setMasksToBounds:YES];
    [_naviImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_naviImgView sd_setImageWithURL:[NSURL URLWithString:_cateModal.categoryCoverImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_backBlurImgView setHidden:NO];
        [_backBlurImgView setImage:image];
        
        [self initTopbarView];
        [self initCollectionView];
        
    }];
    
    [self.navigationView addSubview:_naviImgView];
    
    [self.naviBlurView setHidden:YES];
    
    NSString * title = _cateModal.categoryTitle;
    NSString * subtitle = _cateModal.categorySubtitle;
    
    UIFont * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
    UIFont * subtitleFont = [VibeFont fontWithName:Font_English_Light size:21];
    
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(200, 30) withFont:titleFont].height +2;
    float subtitleHeight = [subtitle getSizeWithLimitSize:CGSizeMake(200, 20) withFont:subtitleFont].height;
    
    _naviTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth -200) /2, _newNaviHeight/2 -titleHeight/2 -5, 200, titleHeight)];
    [_naviTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_naviTitleLabel setTextColor:DefaultWhite];
    [_naviTitleLabel setFont:titleFont];
    [_naviTitleLabel setText:title];
    [self.view addSubview:_naviTitleLabel];
    
    _naviSubtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth -200) /2, _naviTitleLabel.frame.origin.y +titleHeight +4, 200, subtitleHeight)];
    [_naviSubtitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_naviSubtitleLabel setTextColor:DefaultWhite];
    [_naviSubtitleLabel setFont:subtitleFont];
    [_naviSubtitleLabel setText:subtitle];
    [self.view addSubview:_naviSubtitleLabel];

    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_White_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_White_Hight_Light"] forState:UIControlStateHighlighted];

    [self.rightBtn setHidden:NO];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Highlight"] forState:UIControlStateHighlighted];
    
    
    [self.view bringSubviewToFront:self.leftBtn];
    [self.view bringSubviewToFront:self.rightBtn];
    
}


-(void)initTopbarView
{
    if (iPhone5) {
        _topbarHeight = 30;
    }
    if (iPhone6) {
        _topbarHeight = 35;
    }
    if (iPhone6plus) {
        _topbarHeight = 40;
    }
    
    float longestWidth = 0.0;
    
    for (NSString * subcateTitle in _cateModal.categorySetArray) {
        float width = [subcateTitle getSizeWithLimitSize:CGSizeMake(200, 20) withFont:[VibeFont fontWithName:Font_Chinese_Regular size:13]].width;
        if (width > longestWidth) {
            longestWidth =width;
        }
    }
    
    _topbarView = [[UIView alloc]initWithFrame:CGRectMake(0, _newNaviHeight , kScreenWidth, 10 + _topbarHeight)];
    [_topbarView setBackgroundColor:DefaultWhite];
    [self.view insertSubview:_topbarView belowSubview:_backBlurImgView];
 
    UIView * topLineView = [[UIView alloc]initWithFrame:CGRectMake(40,  9 + _topbarHeight, kScreenWidth -80, 0.5)];
    [topLineView setBackgroundColor:RGBA(248, 248, 248, 100)];
    [_topbarView addSubview: topLineView];
    
    
    _categorySetSegment  = [[YUSegment alloc]initWithTitles:_cateModal.categorySetArray style:YUSegmentStyleLine];
    _categorySetSegment.textColor = Default_Text_Gray_Color_40;
    _categorySetSegment.selectedFont = [VibeFont fontWithName:Font_Chinese_Regular size:17];
    _categorySetSegment.font = [VibeFont fontWithName:Font_Chinese_Regular size:12];
    [_categorySetSegment setFrame:CGRectMake(40, 10, kScreenWidth -80, _topbarHeight)];
    [_categorySetSegment addTarget:self action:@selector(categorySegmentDidChange) forControlEvents:UIControlEventValueChanged];
    [_categorySetSegment setSegmentWidth:longestWidth +12];
    if ([_naviImgView.image mostColor]) {

        UIColor * selectColor = [_naviImgView.image mostColor];
        _categorySetSegment.selectedTextColor = selectColor;
        [_categorySetSegment.indicator setBackgroundColor:selectColor];
    }
    else{
        _categorySetSegment.selectedTextColor = Default_Text_Dark_Color_60;
        [_categorySetSegment.indicator setBackgroundColor:_categorySetSegment.selectedTextColor];
    }
    [_topbarView addSubview:_categorySetSegment];
    
    
   
    
}


-(void)initCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 20;
    //最小两行之间的间距
    layout.minimumLineSpacing = 15;
    
    //Footer的大小
    layout.footerReferenceSize = CGSizeMake(kScreenWidth, 25);
    
    _categoryListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    _categoryListCollectionView.backgroundColor=[UIColor clearColor];
    _categoryListCollectionView.delegate= self;
    _categoryListCollectionView.dataSource= self;
    _categoryListCollectionView.contentInset = UIEdgeInsetsMake(_newNaviHeight +10 +_topbarHeight +20, 0, 0, 0);
    _categoryListCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(_newNaviHeight +10 +_topbarHeight +20, 0, 0, 0);
    [_categoryListCollectionView setShowsVerticalScrollIndicator:NO];
    [self.view insertSubview:_categoryListCollectionView belowSubview:_topbarView];
    
    [_categoryListCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CategoryListItemFooterViewIdentifier"];
    
    [_categoryListCollectionView registerClass:[CategoryListItemCollectionViewCell class] forCellWithReuseIdentifier:@"CategoryListItemCollectionViewCellIdentifier"];
}


-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_didRecordAutoScroll == NO) {
        _didRecordAutoScroll = YES;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_categoryListCollectionView]) {
        
        if (_didRecordAutoScroll == YES) {
            
            float topHeight = _newNaviHeight;
            
            CGFloat width = kScreenWidth; // 图片宽度
            CGFloat yOffset = scrollView.contentOffset.y +(_newNaviHeight +10 +_topbarHeight +20);  // 偏移的y值
                        
            if (yOffset < 0) {
                
                CGFloat totalOffset = topHeight + ABS(yOffset);
                CGFloat f = totalOffset / topHeight;
                
                _naviImgView.frame =  CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset); //拉伸后的图片的frame应该是同比例缩放。
            }
                        
        }
        
    }
}


-(void)setDidAutoScroll
{
    _didRecordAutoScroll = YES;
}


#pragma mark - CollectionView 的delegate & datasource

//Footer视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //此处是headerView
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView * footerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CategoryListItemFooterViewIdentifier" forIndexPath:indexPath];
        footerReusableView.frame = CGRectMake(0, 0, kScreenWidth, 25);
        
        return footerReusableView;
    }
    
    UICollectionReusableView * headReusableView;
        headReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        headReusableView.frame = CGRectZero;
    return headReusableView;
}

//Footer的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 25);
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _categoryItemsArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_categoryItemsArray.count) {
        
        CategoryListItemCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryListItemCollectionViewCellIdentifier" forIndexPath:indexPath];
        
        RecommandItemModal * modal = [_categoryItemsArray objectAtIndex:indexPath.row];
        
        [cell setDelegateee:self];
        [cell setCategoryListItemCollectionViewCellWithModal:modal];
        
        return cell;
    }
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultCollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (_categoryItemsArray.count) {
        return UIEdgeInsetsMake(0, 40, 0, 40);
    }
    
    return UIEdgeInsetsZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_categoryItemsArray.count) {
        
        float singleViewLayoutWidth = (kScreenWidth -40 -20 -40)/2;
        return CGSizeMake( singleViewLayoutWidth, singleViewLayoutWidth +55);
    }
    
    return CGSizeZero;
}


#pragma mark -切换分类
-(void)segmentedControlChangedValue:(HMSegmentedControl *)segmentControl
{
    NSLog(@"~~~ %ld ~~~",segmentControl.selectedSegmentIndex);
}


#pragma mark -点击左边按钮
-(void)leftBtnClicked:(id)sender
{
    //如果已显示筛选View
    if (_filterView.isFilterViewShow) {
        [_filterView hideFilterView];
    }
    else{
        [self.lcNavigationController popViewController];
    }
}

#pragma mark -点击右边的筛选按钮
-(void)rightBtnClicked:(id)sender
{
    //已显示筛选View
    if (_filterView.isFilterViewShow) {
        
        [_filterView hideFilterView];
        return;
    }
    
    if (!_filterView) {
        
        _filterView = [[CategoryListFilterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_filterView setDelegateee:self];
        [self.view addSubview:_filterView];
    }
    
    NSString * title = _cateModal.categoryTitle;
    NSString * subtitle = _cateModal.categorySubtitle;
    
    UIFont * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:16];
    UIFont * subtitleFont = [VibeFont fontWithName:Font_English_Light size:14];
    
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(200, 30) withFont:titleFont].height +2;
    float subtitleHeight = [subtitle getSizeWithLimitSize:CGSizeMake(200, 20) withFont:subtitleFont].height;
    
    [_naviTitleLabel setFont:titleFont];
    [_naviTitleLabel setText:title];

    [_naviSubtitleLabel setFont:subtitleFont];
    [_naviSubtitleLabel setText:subtitle];
    
    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_White_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_White_Highlight"] forState:UIControlStateHighlighted];
    
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Show_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Show_Press"] forState:UIControlStateHighlighted];
    
    
    [UIView animateWithDuration:0.2f animations:^{
       
        [_naviTitleLabel setFrame:CGRectMake((kScreenWidth -200) /2, _newNaviHeight/2 -titleHeight/2, 200, titleHeight)];
        _naviTitleLabel.centerY = self.leftBtn.centerY;

        [_naviSubtitleLabel setFrame:CGRectMake((kScreenWidth -200) /2, _naviTitleLabel.frame.origin.y +titleHeight +2, 200, subtitleHeight)];
    }];
    
    
    [self.lcNavigationController setCanDragPop:NO];
    
    [self.view bringSubviewToFront:self.leftBtn];
    [self.view bringSubviewToFront:self.rightBtn];
    [self.view bringSubviewToFront:_naviTitleLabel];
    [self.view bringSubviewToFront:_naviSubtitleLabel];
    
    [_filterView showFilterView];
}



#pragma mark -筛选View的代理方法
-(void)categoryListFilterViewWillHide
{
    NSString * title = _cateModal.categoryTitle;
    NSString * subtitle = _cateModal.categorySubtitle;
    
    UIFont * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
    UIFont * subtitleFont = [VibeFont fontWithName:Font_English_Light size:21];
    
    float titleHeight = [title getSizeWithLimitSize:CGSizeMake(200, 30) withFont:titleFont].height +2;
    float subtitleHeight = [subtitle getSizeWithLimitSize:CGSizeMake(200, 20) withFont:subtitleFont].height;
    
    [_naviTitleLabel setText:title];
    [_naviSubtitleLabel setText:subtitle];

    [_naviTitleLabel setFont:titleFont];
    [_naviSubtitleLabel setFont:subtitleFont];
    
    [UIView animateWithDuration:0.2f animations:^{
        
        [_naviTitleLabel setFrame:CGRectMake((kScreenWidth -200) /2, _newNaviHeight/2 -titleHeight/2 -5, 200, titleHeight)];
        [_naviSubtitleLabel setFrame:CGRectMake((kScreenWidth -200) /2, _naviTitleLabel.frame.origin.y +titleHeight +4, 200, subtitleHeight)];
    }];

    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_White_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_White_Hight_Light"] forState:UIControlStateHighlighted];
    
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Highlight"] forState:UIControlStateHighlighted];
}


-(void)categoryListFilrerViewDidHide
{
    [self.lcNavigationController setCanDragPop:YES];
    
    [UIView animateWithDuration:0.3 animations:^{
        [_naviTitleLabel setAlpha:1.0f];
        [_naviSubtitleLabel setAlpha:1.0f];
    }];
   
    
}

-(void)categoryListFilterViewClickWithIndex:(NSInteger )index
{
    NSLog(@"点击排序 ____ %ld ____",index);
}






#pragma mark - ItemView的点击代理
-(void)categoryListItemClickWithID:(NSInteger)itemID
{
    ItemDetailViewController * itemDetailVC = [[ItemDetailViewController alloc]init];
    itemDetailVC.itemDetailID = itemID;
    [self.lcNavigationController pushViewController:itemDetailVC];
}

#pragma mark -切换分类
-(void)categorySegmentDidChange
{
    NSLog(@"~~~~ %ld ~~~~",_categorySetSegment.selectedIndex);
}


#pragma mark -ViewWillApear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
