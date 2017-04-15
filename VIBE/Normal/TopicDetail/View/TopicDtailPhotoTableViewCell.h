//
//  TopicDtailPhotoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicDtailPhotoTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;
    
    NSMutableArray  * _morePhotosArray;

}

-(void)setTopicDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end
