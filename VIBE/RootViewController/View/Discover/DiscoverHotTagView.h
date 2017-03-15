//
//  DiscoverHotTagView.h
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverHotTagModal.h"

//@protocol DiscoverHotTagViewDelegate;

@interface DiscoverHotTagView : UIView
{
    NSInteger         _tagViewIndex;
    
    GLImageView     * _backView;
    UIImageView     * _imgView;
    UIView          * _maskView;
    UILabel         * _tagLabel;
}

//@property (weak, nonatomic) id<DiscoverHotTagViewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame AndIndex:(NSInteger )index;

-(void)setDiscoverHotTagViewWithModal:(DiscoverHotTagModal *)modal;

@end


/*
@protocol DiscoverHotTagViewDelegate <NSObject>

-(void)didClickTagViewWithIndex:(NSInteger )index;

@end
*/
