//
//  HomeBannerTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGInfiniteScrollView.h"

@protocol HomeBannerTableViewCellDelegate;

@interface HomeBannerTableViewCell : UITableViewCell<JGInfiniteScrollViewDelegate>
{
    CGFloat             _bannerCellHeight;
        
    JGInfiniteScrollView * _autoScrollView;
    
//    LCAnimatedPageControl * _pageControl;
    
    NSMutableArray    * _bannerInfoArrays;
}

@property (weak, nonatomic) id<HomeBannerTableViewCellDelegate> delegate;

-(void)setBannerContent:(NSArray *)array;

@end

@protocol HomeBannerTableViewCellDelegate <NSObject>

-(void)homeBannerCellTapIndex:(NSInteger )index;

@end



