//
//  TagLIstViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TagLIstViewController.h"

@interface TagLIstViewController ()

@end

@implementation TagLIstViewController


-(id)initWithTagInfo:(DiscoverTagModal *)tagModal
{
    self = [super init];
    if (self)
    {
        _tagModal = [[DiscoverTagModal alloc]init];
        
        _tagModal =tagModal;
    }
    
    
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.naviBlurView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.view bringSubviewToFront:self.navigationView];
    
    [self.view bringSubviewToFront:self.leftBtn];
    
    
    [self initCollectionView];
    
}


-(void)initCollectionView
{
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 20;
    //最小两行之间的间距
    layout.minimumLineSpacing = 15;
    
    
    _tagListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth -60, kScreenHeight) collectionViewLayout:layout];
    _tagListCollectionView.backgroundColor=[UIColor clearColor];
    _tagListCollectionView.delegate = self;
    _tagListCollectionView.dataSource = self;
    _tagListCollectionView.contentInset = UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0);
    _tagListCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0);
    [_tagListCollectionView setShowsVerticalScrollIndicator:NO];
    [self.view insertSubview:_tagListCollectionView belowSubview:self.navigationView];
    
    [_tagListCollectionView registerClass:[TagListTopCollectionViewCell class] forCellWithReuseIdentifier:@"TagListTopCollectionViewCellIdentifier"];
    
    [_tagListCollectionView registerClass:[TagListItemCollectionViewCell class] forCellWithReuseIdentifier:@"TagListItemCollectionViewCellIdentifier"];
}


#pragma mark -Collectionview的代理
//脚部视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(kScreenWidth, 0);
    }

    return CGSizeMake(kScreenWidth, 25);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return _tagModal.tagItemsArray.count;
}

//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //顶部图片Cell
    if (indexPath.section == 0) {
        
        TagListTopCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TagListTopCollectionViewCellIdentifier" forIndexPath:indexPath];
        [cell tagListTopCellSetWithInfo:_tagModal];
        
        return cell;
    }
    
    //显示每个商品的Cell
    if (indexPath.section == 1 && _tagModal.tagItemsArray.count) {
        
        TagListItemCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TagListItemCollectionViewCellIdentifier" forIndexPath:indexPath];
        
        [cell setDelegateee:self];
        
        RecommandItemModal * item = [_tagModal.tagItemsArray objectAtIndex:indexPath.row];
        [cell setRecommandViewWithModal:item WithIndex:indexPath.row];
        
        return cell;
    }
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor blueColor];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    //显示商品Cell距旁边视图的距离
    if (section == 1 && _tagModal.tagItemsArray.count) {
        
        return UIEdgeInsetsMake(0, 0, 0, 20);
    }
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        NSString    * title = @"标题";
        UIFont      * titleFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
        
        float titleHeight = [title getSizeWithLimitSize:CGSizeMake(100, 30) withFont:titleFont].height;
        
        float photoViewWidth = kScreenWidth -60;
        float photoViewHeight = photoViewWidth/16 *9;
        
        return CGSizeMake(kScreenWidth -60, photoViewHeight -5 +titleHeight);
    }
    
    if (indexPath.section == 1 && _tagModal.tagItemsArray.count) {
        
        float singleViewLayoutWidth = (kScreenWidth -60 -20 -20)/2;
        return CGSizeMake( singleViewLayoutWidth, singleViewLayoutWidth +55);
    }
    
    return CGSizeZero;
}


#pragma mark -点击商品Cell进入详情的代理方法
-(void)tagListItemCollectionViewCellClickWithID:(NSInteger)itemID
{
    ItemDetailViewController * itemDetailVC = [[ItemDetailViewController alloc]init];
    itemDetailVC.itemDetailID = itemID;
    [self.lcNavigationController pushViewController:itemDetailVC];
}

 
@end






