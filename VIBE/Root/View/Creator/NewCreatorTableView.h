//
//  NewCreatorTableView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorDoubleTableViewCell.h"
#import "CreatorSingleTableViewCell.h"


#import "CreatorCoverModal.h"

@protocol NewCreatorTableViewDelegate;

@interface NewCreatorTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    UIView  * _sectionFooterView;
}

@property (weak, nonatomic) id<NewCreatorTableViewDelegate> delegateee;

@end

//代理协议
@protocol NewCreatorTableViewDelegate <NSObject>

@end
