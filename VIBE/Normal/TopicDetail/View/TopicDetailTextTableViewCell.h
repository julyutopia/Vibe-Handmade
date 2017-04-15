//
//  TopicDetailTextTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicDetailTextTableViewCell : UITableViewCell
{
    UIView  * _backView;
    
    UILabel * _showTextLabel;
}

-(void)setTopicDetailTextCellWithInfo:(NSString *)detail;

@end
