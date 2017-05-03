//
//  FavorStoriesCollectionView.m
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FavorStoriesCollectionView.h"

@implementation FavorStoriesCollectionView

-(void)initCollectionView
{
        self.backgroundColor=[UIColor clearColor];
        self.delegate= self;
        self.dataSource= self;
        self.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        self.scrollIndicatorInsets = UIEdgeInsetsMake(10, 0, 0, 0);
        [self setShowsVerticalScrollIndicator:NO];
        
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FavorStoriesCollectionViewFooterIdentifier"];
        
        [self registerClass:[FavorStoriesCollectionViewCell class] forCellWithReuseIdentifier:@"FavorStoriesCollectionViewCellIdentifier"];
        
        _storiesArray = [[NSMutableArray alloc]init];
}


-(void)setFavorStoriesCollectionViewWithArray:(NSArray *)storiesArray
{
    [_storiesArray removeAllObjects];
    [_storiesArray addObjectsFromArray:storiesArray];
    
    [self reloadData];
}


#pragma mark -CollectionView代理
//CollectionViewFooter视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView * footerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FavorStoriesCollectionViewFooterIdentifier" forIndexPath:indexPath];
        footerReusableView.frame = CGRectMake(0, 0, kScreenWidth, 20);
        return footerReusableView;
    }
    
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 20);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _storiesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_storiesArray.count) {
        
        FavorStoriesCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FavorStoriesCollectionViewCellIdentifier" forIndexPath:indexPath];
        
        DiscoverStoryModal * modal = [_storiesArray objectAtIndex:indexPath.row];
        [cell setFavorStoryCollectionViewCellWithModal:modal];
        
        return cell;
    }
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultCollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (_storiesArray.count) {
        return UIEdgeInsetsMake(0, 60, 0, 20);
    }
    
    return UIEdgeInsetsZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_storiesArray.count) {
        float storyViewLayoutWidth = (kScreenWidth -60 -20 -20)/2;
        return CGSizeMake( storyViewLayoutWidth, storyViewLayoutWidth +25);
    }
    
    return CGSizeZero;
}


@end
