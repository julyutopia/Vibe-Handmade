//
//  DiscoverStoryTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverStoryModal.h"
#import "DiscoverStoryBigView.h"
#import "DiscoverStorySmallView.h"

@interface DiscoverStoryTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    UIButton        * _showMoreBtn;
    
    NSMutableArray  * _storysArray;
    
    DiscoverStoryBigView    * _bigStoryView;
    
    DiscoverStorySmallView  * _leftSmallStoryView;
    DiscoverStorySmallView  * _rightSmallStoryView;

}

-(void)setDiscoverStoryCellWithInfo:(NSArray *)infoArray;

@end
