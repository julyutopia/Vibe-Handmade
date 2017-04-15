//
//  RecommandCateTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandCateModal.h"

@protocol RecommandCateTableViewCellDelegate;

@interface RecommandCateTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    UIView          * _categoryView;

    NSMutableArray  * _cateArray;
}

-(void)setCateCellWithInfo:(NSArray *)array;

@property (weak, nonatomic) id<RecommandCateTableViewCellDelegate> delegateee;

@end

//代理协议
@protocol RecommandCateTableViewCellDelegate <NSObject>

-(void)recommandCateCellDidClickCategoryWithIndex:(NSInteger )index;

@end

