//
//  CreatorDetailBottomTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/19.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorDetailBottomTableViewCell : UITableViewCell
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

-(void)setCreatorBottomTableCellWithInfo:(NSString *)imageURL IsLastCell:(BOOL)isLast;

-(float)calculateImageHeight;


@end
