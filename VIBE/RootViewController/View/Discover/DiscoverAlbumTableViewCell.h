//
//  DiscoverAlbumTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicModal.h"
#import "GradientTagCloudView.h"

@interface DiscoverAlbumTableViewCell : UITableViewCell
{
    float                   _width;
    float                   _height;
    
    UIView                  * _backView;
    CAShapeLayer            * _maskLayer;
    
    UIImageView             * _albumImgView;
    
    UIImageView             * _maskImgView;

    UILabel                 * _albumTitleLabel;
    float                     _singleLineHeight;
    
    GradientTagCloudView    * _gradientTagView;
    
    
    UIView                  * _showInfoView;
    UIImageView             * _lookIcon;
    UILabel                 * _lookLabel;
    UIImageView             * _favorIcon;
    UILabel                 * _favorLabel;
    
    
}

-(void)setDiscoverAlbumWithModal:(DiscoverTopicModal *)modal IsLast:(BOOL )last;

@end
