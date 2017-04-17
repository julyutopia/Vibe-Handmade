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

@protocol DiscoverStoryBigViewDelegate;

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

@property (weak, nonatomic) id<DiscoverStoryBigViewDelegate> delegate;

-(void)setDiscoverStoryBigViewWithModal:(DiscoverStoryModal *)modal;

@end

//代理协议
@protocol DiscoverStoryBigViewDelegate <NSObject>

-(void)discoverStoryBigViewClick;

@end




