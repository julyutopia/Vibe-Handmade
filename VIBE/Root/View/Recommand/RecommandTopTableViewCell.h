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

@protocol RecommandTopTableViewCellDelegate;

@interface RecommandTopTableViewCell : UITableViewCell<JGInfiniteScrollViewDelegate>
{
    CGFloat                 _bannerCellHeight;
    
    UIView                  * _showTopView;
    JGInfiniteScrollView    * _topScrollView;
    
    NSMutableArray          * _topInfoArrays;
}

@property (weak, nonatomic) id<RecommandTopTableViewCellDelegate> delegateee;

-(void)setRecommandTopCellWithInfos:(NSArray *)infoArray;

@end

//代理协议
@protocol RecommandTopTableViewCellDelegate <NSObject>

-(void)recommandTopCellDidTapWithIndex:(NSInteger )index;

@end
