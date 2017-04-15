//
//  DiscoverTagTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiscoverTagTableViewCellDelegate;

@interface DiscoverTagTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    UIView          * _hotTagView;
    
    NSMutableArray  * _hotTagsArray;
}

@property (weak, nonatomic) id<DiscoverTagTableViewCellDelegate> delegate;

-(void)setHotTagCellWithInfo:(NSArray *)array;

@end

//代理协议
@protocol DiscoverTagTableViewCellDelegate <NSObject>

-(void)discoverTagCellDidClickTagWithIndex:(NSInteger )index;

@end
