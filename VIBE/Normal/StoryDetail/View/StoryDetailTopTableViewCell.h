//
//  StoryDetailTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StoryDetailModal.h"


@interface StoryDetailTopTableViewCell : UITableViewCell
{
    float                     _photoViewHeight;
    
    UIView                  * _backView;
    
    UIImageView             * _backBlurImgView;
    UIImageView             * _photoImgView;
    
    UILabel                 * _storyTimeStampLabel;
    UILabel                 * _storyTitleLabel;
    
}


-(void)setStoryDetailTopCellWithModal:(StoryDetailModal *)storyModal;


@end
