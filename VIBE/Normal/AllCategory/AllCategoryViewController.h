//
//  AllCategoryViewController.h
//  VIBE
//
//  Created by Li Haii on 16/9/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "AllCategoryTableViewCell.h"

@interface AllCategoryViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _categoryTableView;
    
    UIView  * _footerView;
    
    NSMutableArray  * _categoryArray;
}
@end
