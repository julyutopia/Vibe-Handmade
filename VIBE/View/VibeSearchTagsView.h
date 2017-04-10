//
//  VibeSearchTagsView.h
//  VIBE
//
//  Created by Li Haii on 2017/1/22.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeSearchTagsButton.h"


@protocol VibeSearchTagsViewDelegate;

@interface VibeSearchTagsView : UIView

@property (strong, nonatomic) NSMutableArray *selectedButtonArray;
@property (strong, nonatomic) NSArray        *allButtonArray;

@property (weak, nonatomic) id<VibeSearchTagsViewDelegate> delegate;

/**
 *  将array中得view按规则排列在本view上
 *
 *  @param array    装有需要排列的view的array
 *  @param maxWidth 排列所允许的最大宽度
 *  @param hGap     view与view之间的横向间距
 *  @param vGap     view与view之间的纵向间距
 */
- (void)setupWithViewsArray:(NSArray *)array
                   maxWidth:(float)maxWidth
                       hGap:(float)hGap
                       vGap:(float)vGap;

- (VibeSearchTagsButton *)creatButton:(NSString *)text gap:(float)gap;
- (VibeSearchTagsButton *)creatSelectableButton:(NSString *)text gap:(float)gap;

@end

@protocol VibeSearchTagsViewDelegate <NSObject>

-(void)didClickSearchKeyWord:(NSString *)searchWord;



@end
