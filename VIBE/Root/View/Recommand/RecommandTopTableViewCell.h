//
//  RecommandTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGInfiniteScrollView.h"

#import "RecommandTopViewModal.h"

@interface RecommandTopTableViewCell : UITableViewCell<JGInfiniteScrollViewDelegate>
{
    CGFloat                 _bannerCellHeight;
    
    UIView                  * _showTopView;
    JGInfiniteScrollView    * _topScrollView;
    
    NSMutableArray          * _topInfoArrays;
}

-(void)setRecommandTopCellWithInfos:(NSArray *)infoArray;

@end
