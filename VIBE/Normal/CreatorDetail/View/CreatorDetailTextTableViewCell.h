//
//  CreatorDetailTextTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorDetailTextTableViewCell : UITableViewCell
{
    UIView  * _backView;
    
    UILabel * _showTextLabel;
}

-(void)setCreatorDetailTextCellWithInfo:(NSString *)detail;


@end
