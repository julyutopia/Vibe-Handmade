//
//  DiscoverStoryBigView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GLImageView.h"
#import "DiscoverStoryModal.h"

@interface DiscoverStoryBigView : UIView
{
    UIView              * _backView;
    
    UIImageView         * _blurImgView;
    UIImageView         * _photoImgView;
    
    GLImageView         * _tapBackImgView;

    UIView              * _whiteContentView;
    
    UILabel             * _timeStampLabel;
    UILabel             * _storyTitleLabel;
    
    UIView              * _photosContentView;
    
    NSMutableArray      * _bigStoryPhotosArray;
}


-(void)setDiscoverStoryBigViewWithModal:(DiscoverStoryModal *)modal;

@end
