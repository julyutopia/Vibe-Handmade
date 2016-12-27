//
//  RecommandBannerTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGInfiniteScrollView.h"
#import "RecommandBannerModal.h"
#import "RecommandCategoryModal.h"

@protocol RecommandBannerTableViewCellDelegate;

@interface RecommandBannerTableViewCell : UITableViewCell<JGInfiniteScrollViewDelegate>
{
    CGFloat                 _bannerCellHeight;
    
    UIView                  * _showBannerView;
    JGInfiniteScrollView    * _autoScrollView;
    
    NSMutableArray          * _bannerInfoArrays;
    
    UIView                  * _showCategoryView;
    NSMutableArray          * _categoryArray;
}

@property (weak, nonatomic) id<RecommandBannerTableViewCellDelegate> delegate;

-(void)setBannerScrollArray:(NSArray *)bannerArray CategoryArray:(NSArray *)cateArray;

@end

@protocol RecommandBannerTableViewCellDelegate <NSObject>

-(void)recommandBannerCellTapIndex:(NSInteger )index;

-(void)recommandBannerTapCategoryWithIndex:(NSInteger )index;

@end
