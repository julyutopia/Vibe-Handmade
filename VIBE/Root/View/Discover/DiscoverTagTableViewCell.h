//
//  DiscoverTagTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverTagTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    UIView          * _hotTagView;
    
    NSMutableArray  * _hotTagsArray;
}

-(void)setHotTagCellWithInfo:(NSArray *)array;

@end
