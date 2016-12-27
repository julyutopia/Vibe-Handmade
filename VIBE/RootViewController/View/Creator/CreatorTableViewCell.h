//
//  CreatorTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"

@interface CreatorTableViewCell : UITableViewCell
{
    float         _viewWidth;
    float         _viewHeight;
    
    GLImageView * _backView;
    UIImageView * _creatorImgView;
    
    UIImageView * _gradientView;
    
    UILabel     * _creatorTitleLabel;
    
    UIImageView * _creatorIconImgView;
    UILabel     * _creatorShopNameLabel;
    
    UIView              * _showInfoView;
    UIImageView         * _lookIcon;
    UILabel             * _lookLabel;
    UIImageView         * _favorIcon;
    UILabel             * _favorLabel;
}

-(void)setCreatorCellWithModal:(CreatorCoverModal *)modal;

@end
