//
//  RecommandTableView.h
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommandBannerTableViewCell.h"
#import "RecommandCategoryTableViewCell.h"

#import "RecommandTopicHeaderTableViewCell.h"
#import "RecommandTopicTableViewCell.h"
#import "RecommandTopicFooterTableViewCell.h"

#import "RecommandProductHeaderTableViewCell.h"
#import "RecommandProductTableViewCell.h"

@protocol RecommandTableViewDelegate;

@interface RecommandTableView : UITableView<UITableViewDelegate,UITableViewDataSource,RecommandBannerTableViewCellDelegate, RecommandTopicTableViewCellDelegate,RecommandProductTableViewCellDelegate>
{
    UIView  * _sectionFooterView;
}

@property(retain, nonatomic)NSMutableArray  * recommandBannerArray;
@property(retain, nonatomic)NSMutableArray  * recommandCategoryArray;
@property(retain, nonatomic)NSMutableArray  * recommandTopicsArray;
@property(retain, nonatomic)NSMutableArray  * recommandProductsArray;

-(void)setRecommandInfoDict:(NSDictionary *)recommandDict;

@property (weak, nonatomic) id<RecommandTableViewDelegate> delegateee;

@end

@protocol RecommandTableViewDelegate <NSObject>

-(void)recommandTableDidClickBannerWithIndex:(NSInteger )index;

-(void)recommandTableDidClickCategoryWithIndex:(NSInteger )index;

-(void)recommandTableDidClickTopicWithIndex:(NSInteger )index;

-(void)recommandTableDidClickProductWithIndex:(NSInteger )index;

@end






