//
//  FavorProductsCollectionView.m
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "FavorProductsCollectionView.h"

@implementation FavorProductsCollectionView

-(void)initCollectionView
{
    self.backgroundColor=[UIColor clearColor];
    self.delegate= self;
    self.dataSource= self;
    self.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.scrollIndicatorInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    [self setShowsVerticalScrollIndicator:NO];
    
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FavorProductsCollectionViewFooterIdentifier"];
    
    [self registerClass:[CategoryListItemCollectionViewCell class] forCellWithReuseIdentifier:@"FavorProductsCollectionViewCellIdentifier"];
    
    _productsArray = [[NSMutableArray alloc]init];
}


-(void)setFavorProductsCollectionViewWithArray:(NSArray *)productsArray
{
    [_productsArray removeAllObjects];
    [_productsArray addObjectsFromArray:productsArray];
    
    [self reloadData];
}


#pragma mark -CollectionView代理
//CollectionViewFooter视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView * footerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FavorProductsCollectionViewFooterIdentifier" forIndexPath:indexPath];
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
    NSLog(@"~~~~~~ %ld ~~~~~",_productsArray.count);
    
    return _productsArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryListItemCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FavorProductsCollectionViewCellIdentifier" forIndexPath:indexPath];
    
    if (_productsArray.count) {
        
        RecommandItemModal * modal = [_productsArray objectAtIndex:indexPath.row];
        
        NSLog(@"##### %@ ######",modal.productTitle);
        
        [cell setCategoryListItemCollectionViewCellWithModal:modal];
    }
    
    return cell;
    
//    }
//    
//    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCellIdentifier" forIndexPath:indexPath];
//    cell.backgroundColor=[UIColor clearColor];
//    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (_productsArray.count) {
        return UIEdgeInsetsMake(0, 60, 0, 20);
    }
    
    return UIEdgeInsetsZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_productsArray.count) {
        float storyViewLayoutWidth = (kScreenWidth -60 -20 -20)/2;
        return CGSizeMake( storyViewLayoutWidth, storyViewLayoutWidth +55);
    }
    
    return CGSizeZero;
}



@end
