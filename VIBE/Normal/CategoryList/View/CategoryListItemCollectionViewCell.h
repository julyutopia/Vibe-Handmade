//
//  CategoryListItemCollectionViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/12.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"
#import "RecommandItemModal.h"

@protocol CategoryListItemCollectionViewCellDelegate;

@interface CategoryListItemCollectionViewCell : UICollectionViewCell<RecommandItemViewDelegate>
{
    RecommandItemView   * _categoryItemView;
}

-(void)setCategoryListItemCollectionViewCellWithModal:(RecommandItemModal *)modal;

@property (weak, nonatomic) id<CategoryListItemCollectionViewCellDelegate> delegateee;

@end

@protocol CategoryListItemCollectionViewCellDelegate <NSObject>

-(void)categoryListItemClickWithID:(NSInteger )itemID;

@end
