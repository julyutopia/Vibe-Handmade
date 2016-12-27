//
//  CategoryHotTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryHotModal.h"

@protocol CategoryHotTableViewCellDelegate;

@interface CategoryHotTableViewCell : UITableViewCell<UIScrollViewDelegate>
{
    UIView  * _backView;
    
    UIScrollView * _hotScrollView;
    NSMutableArray * _hotContentArray;
}

@property (weak, nonatomic) id<CategoryHotTableViewCellDelegate> delegate;

-(void)setHotCellWithContent:(NSArray *)content;

@end


@protocol CategoryHotTableViewCellDelegate <NSObject>

-(void)categoryHotCellTapIndex:(NSInteger )index;

@end


