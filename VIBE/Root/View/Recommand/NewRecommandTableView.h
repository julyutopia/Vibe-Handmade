//
//  NewRecommandTableView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandHelloTableViewCell.h"
#import "RecommandTopTableViewCell.h"
#import "RecommandCateTableViewCell.h"
#import "RecommandPickTableViewCell.h"
#import "RecommandItemsTableViewCell.h"

#import "RecommandItemModal.h"

@protocol NewRecommandTableViewDelegate;

@interface NewRecommandTableView : UITableView<UITableViewDelegate, UITableViewDataSource, RecommandTopTableViewCellDelegate, RecommandCateTableViewCellDelegate, RecommandPickTableViewCellDelegate, RecommandItemsTableViewCellDelegate>
{
    UIView  * _sectionFooterView;
}

@property (weak, nonatomic) id<NewRecommandTableViewDelegate> delegateee;

@end

//代理协议
@protocol NewRecommandTableViewDelegate <NSObject>

-(void)recommandTableViewShowBannerDetailWithIndex:(NSInteger )index;

-(void)recommandTableViewShowCategoryDetailWithCateModal:(RecommandCateModal *)cateModal;

-(void)recommandTableViewShowItemDetailWithID:(NSInteger )itemID;

@end
