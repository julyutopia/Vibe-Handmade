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

@interface CreatorTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    UIView  * _sectionFooterView;
}

@property(retain, nonatomic)NSMutableArray  * creatorArray;

-(void)setCreatorTableWithContent:(NSArray *)array;

@end
