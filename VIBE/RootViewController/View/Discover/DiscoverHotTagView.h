//
//  DiscoverHotTagView.h
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverHotTagModal.h"

@interface DiscoverHotTagView : UIView
{
    UIView      * _backView;
    UIImageView * _imgView;
    UIView      * _maskView;
    UILabel     * _tagLabel;
}

-(id)initWithFrame:(CGRect)frame AndIndex:(NSInteger )index;

-(void)setDiscoverHotTagViewWithModal:(DiscoverHotTagModal *)modal;

@end
