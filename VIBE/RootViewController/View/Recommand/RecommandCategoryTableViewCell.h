//
//  RecommandCategoryTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommandCategoryModal.h"

@protocol RecommandCategoryTableViewCellDelegate;

@interface RecommandCategoryTableViewCell : UITableViewCell
{
    float   _categoryCellHeight;
    
    UIView * _showCategoryView;
    NSMutableArray  * _categoryArray;
}

@property (weak, nonatomic) id<RecommandCategoryTableViewCellDelegate> delegate;

-(void)setCategoryCellWithArray:(NSArray *)cates;

@end

@protocol RecommandCategoryTableViewCellDelegate <NSObject>

-(void)recommandCategoryCellTapWithIndex:(NSInteger )index;

@end
