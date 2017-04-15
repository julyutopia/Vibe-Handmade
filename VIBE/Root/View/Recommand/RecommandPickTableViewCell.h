//
//  RecommandPickTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandItemModal.h"

#import "ALDBlurImageProcessor.h"
#import "UIERealTimeBlurView.h"

#import "GLImageView.h"

@protocol RecommandPickTableViewCellDelegate;

@interface RecommandPickTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;
    
    UIView          * _backView;
    
    UIImageView     * _backBlurImgView;
    ALDBlurImageProcessor * _blurImageProcessor;
    
    UIERealTimeBlurView * _blurView;
    
    GLImageView     * _productImgView;
    
    UILabel         * _productInfoTitleLabel;
    UILabel         * _productNameTitleLabel;
}

@property (weak, nonatomic) id<RecommandPickTableViewCellDelegate> delegate;

-(void)setRecommandPickItem:(RecommandItemModal *)modal;

@end


//代理协议
@protocol RecommandPickTableViewCellDelegate <NSObject>

-(void)recommandPickCellDidClick;

@end


