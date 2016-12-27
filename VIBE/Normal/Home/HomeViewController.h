//
//  HomeViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "HomeBannerTableViewCell.h"
#import "HomeTopicTableViewCell.h"
#import "HomeProductTopTableViewCell.h"
#import "HomeProductTableViewCell.h"

#import "ProductDetailViewController.h"


@interface HomeViewController : VibeViewController<UITableViewDelegate,UITableViewDataSource,HomeBannerTableViewCellDelegate,HomeTopicTableViewCellDelegate,HomeProductTableViewCellDelegate>
{
    UITableView * _recommandTableView;
    
    UIView      * _footerView;
    
    NSMutableArray * _bannerInfoModalArray;
    NSMutableArray * _topicModalArray;
    NSMutableArray * _productsModalArray;
}

@property(nonatomic, retain) UIViewController  *currentVC;

@end
