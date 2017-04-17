//
//  StoryDetailPhotoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryDetailPhotoTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;
    
    NSMutableArray  * _morePhotosArray;
    
}

-(void)setStoryDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end
