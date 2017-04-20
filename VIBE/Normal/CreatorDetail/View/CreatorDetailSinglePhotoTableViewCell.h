//
//  CreatorDetailSinglePhotoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorDetailSinglePhotoTableViewCell : UITableViewCell
{
    float                     _backViewWidth;
    
    UIView                  * _backView;
    UIImageView             * _detailImgView;
    
    UIActivityIndicatorView * _activityIndicatorView;
    
    float                     _bottomHeight;
}

@property(assign, nonatomic) CGFloat imageHeight;
@property(assign, nonatomic) BOOL didLoadImage;

-(void)setCreatorSinglePhotoTableCellWithInfo:(NSString *)imageURL;

-(float)calculateImageHeight;


@end
