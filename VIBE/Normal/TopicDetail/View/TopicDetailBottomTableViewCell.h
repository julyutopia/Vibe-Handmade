//
//  TopicDetailBottomTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2016/12/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicDetailBottomTableViewCell : UITableViewCell
{
    float                     _backViewWidth;
    
    UIView                  * _backView;
    UIImageView             * _detailImgView;
    
    UIActivityIndicatorView * _activityIndicatorView;
    
    CAShapeLayer            * _maskLayer;
    
    float                     _bottomHeight;
}

@property(assign, nonatomic) BOOL didLoadImage;
@property(assign, nonatomic) CGFloat imageHeight;

@property(assign, nonatomic) BOOL isLastCell;

-(void)setTopicBottomTableCellWithInfo:(NSString *)imageURL IsLastCell:(BOOL)isLast;

-(float)calculateImageHeight;

@end
