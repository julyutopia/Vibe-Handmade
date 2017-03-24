//
//  CreatorInfoShowTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/3/24.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorInfoShowTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UILabel * _detailInfoLabel;
    GLImageView * _detailImgView;
    
    UIActivityIndicatorView * _activityIndicatorView;
    
    float      _lastCellHeight;
}


@property(assign, nonatomic) BOOL didLoadImage;

@property(assign, nonatomic) CGFloat imageHeight;

@property(assign, nonatomic) BOOL isLastCell;

-(void)setCreatorDetailShowTableCellWithInfo:(NSDictionary *)dict IsLastCell:(BOOL )isLast;

-(float)calculateImageHeight;



@end
