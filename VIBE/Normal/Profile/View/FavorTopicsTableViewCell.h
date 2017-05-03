//
//  FavorTopicsTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/5/3.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicModal.h"
#import "GLImageView.h"

@interface FavorTopicsTableViewCell : UITableViewCell
{
    GLImageView     * _backView;
    
    UIImageView     * _backBlurImgView;
    UIImageView     * _photoImgView;
    
    UIView          * _gradientView;
    
    UILabel         * _topicTitleLabel;
}

-(void)setFavorTopicTableCellWithModal:(DiscoverTopicModal *)modal;


@end
