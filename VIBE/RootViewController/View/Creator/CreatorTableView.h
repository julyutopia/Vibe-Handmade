//
//  CreatorTableView.h
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"
#import "CreatorTableViewCell.h"

@protocol CreatorTableViewDelegate;

@interface CreatorTableView : UITableView<UITableViewDelegate, UITableViewDataSource,CreatorTableViewCellDelegate>
{
    UIView  * _sectionFooterView;
}

@property (weak, nonatomic) id<CreatorTableViewDelegate> delegateee;

@property(retain, nonatomic)NSMutableArray  * creatorArray;

-(void)setCreatorTableWithContent:(NSArray *)array;

@end

@protocol CreatorTableViewDelegate <NSObject>

-(void)creatorTableViewTapWithIndex:(NSInteger )index;


@end




