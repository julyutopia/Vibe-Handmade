//
//  StoryDetailTextTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryDetailTextTableViewCell : UITableViewCell
{
    UIView  * _backView;
    
    UILabel * _showTextLabel;
}

-(void)setStorycDetailTextCellWithInfo:(NSString *)detail;

@end
