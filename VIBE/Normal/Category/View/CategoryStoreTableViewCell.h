//
//  CategoryStoreTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryStoreView.h"
#import "CategoryStoreModal.h"

@protocol CategoryStoreTableViewCellDelegate;

@interface CategoryStoreTableViewCell : UITableViewCell<CategoryStoreViewDelegate>
{
    UIView          * _backView;
    
    UIImageView     * _storeTitleImgView;
    
    UIScrollView    * _storeScrollView;
    NSMutableArray  * _storeArray;
}

-(void)setCategoryStoreCellWithContent:(NSArray *)array;

@property (weak, nonatomic) id<CategoryStoreTableViewCellDelegate> delegate;

@end


@protocol CategoryStoreTableViewCellDelegate <NSObject>

-(void)categoryCellDidTapWithStoreID:(NSInteger )storeID;

@end





