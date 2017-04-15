//
//  TagListItemCollectionViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemView.h"
#import "RecommandItemModal.h"

@protocol TagListItemCollectionViewCellDelegate;

@interface TagListItemCollectionViewCell : UICollectionViewCell<RecommandItemViewDelegate>
{
    NSInteger           _index;

    RecommandItemView * _itemView;    
}

-(void)setRecommandViewWithModal:(RecommandItemModal *)item WithIndex:(NSInteger )index;

@property (weak, nonatomic) id<TagListItemCollectionViewCellDelegate> delegateee;

@end

//代理协议
@protocol TagListItemCollectionViewCellDelegate <NSObject>

-(void)tagListItemCollectionViewCellClickWithID:(NSInteger )itemID;

@end
