//
//  FavorProductsCollectionView.h
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavorProductsCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource>
{
    UIView  * _collectionFooterView;
    
    NSMutableArray  * _productsArray;
}

-(void)initCollectionView;

-(void)setFavorProductsCollectionViewWithArray:(NSArray *)productsArray;

@end
