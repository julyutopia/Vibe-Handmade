//
//  FavorStoryView.h
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverStoryModal.h"

@interface FavorStoryView : UIView
{
    GLImageView * _backView;
    UIImageView * _storyImgView;
    UIButton    * _storyFavorBtn;
    UILabel     * _storyTitleLabel;
}


-(void)setFavorStoryViewWithModal:(DiscoverStoryModal *)modal;



@end
