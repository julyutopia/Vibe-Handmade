//
//  DiscoverStorySmallView.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GLImageView.h"

#import "DiscoverStoryModal.h"

@interface DiscoverStorySmallView : UIView
{
    GLImageView * _backImgView;
    
    UIImageView * _photoImgView;
    
    UILabel     * _timeStampLabel;
    UILabel     * _storyTitleLabel;

}

-(void)setDiscoverStorySmallViewWithModal:(DiscoverStoryModal *)modal;


@end
