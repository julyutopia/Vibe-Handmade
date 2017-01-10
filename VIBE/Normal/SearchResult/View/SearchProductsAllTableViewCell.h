//
//  SearchProductsAllTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchProductsAllTableViewCellDelegate;

@interface SearchProductsAllTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UIButton * _showAllTopicBtn;
}

@property (weak, nonatomic) id<SearchProductsAllTableViewCellDelegate> delegateee;

@end

@protocol SearchProductsAllTableViewCellDelegate <NSObject>

-(void)searchProductShowAllResults;

@end
