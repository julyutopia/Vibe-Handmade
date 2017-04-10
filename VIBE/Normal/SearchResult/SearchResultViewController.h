//
//  SearchResultViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/9.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "SearchResultCollectionViewCell.h"

#import "RecommandItemModal.h"

@interface SearchResultViewController : BasicViewController<UICollectionViewDelegate, UICollectionViewDataSource>
{
    GLImageView     * _topBarBackImgView;
    
    UIView          * _topBarView;
    UIImageView     * _topBarSearchIcon;
    UILabel         * _topBarTitleLabel;
    
    
    UICollectionView    * _searchResultCollectionView;
        
    NSMutableArray      * _searchResultProductsArray;
}

@property(retain, nonatomic)NSString * searchKeyword;

@end
