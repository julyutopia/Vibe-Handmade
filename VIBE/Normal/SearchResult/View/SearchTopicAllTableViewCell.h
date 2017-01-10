//
//  SearchTopicAllTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/1/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTopicAllTableViewCellDelegate;

@interface SearchTopicAllTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UIButton * _showAllTopicBtn;
}

@property (weak, nonatomic) id<SearchTopicAllTableViewCellDelegate> delegateee;

@end

@protocol SearchTopicAllTableViewCellDelegate <NSObject>

-(void)searchTopicsShowAllResults;

@end
