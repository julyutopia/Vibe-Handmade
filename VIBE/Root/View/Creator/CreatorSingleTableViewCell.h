//
//  CreatorSingleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/8.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"

@interface CreatorSingleTableViewCell : UITableViewCell
{
    UIView              * _backView;
    
    UIImageView         * _blurImgView;
    
    GLImageView         * _tapBackImgView;
    UIImageView         * _photoImgView;
    
    UIView              * _whiteContentView;
    UIView              * _smallBlurView1;
    UIView              * _smallBlurView2;
    
    UILabel             * _creatorShopTitleLabel;
    UILabel             * _creatorSloganLabel;
    
    UIView              * _photosContentView;
    
    NSMutableArray      * _creatorMorePhotosArray;

}

-(void)setCreatorSingleTableCellWithModal:(CreatorCoverModal *)modal;


@end

