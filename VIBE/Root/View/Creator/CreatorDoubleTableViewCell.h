//
//  CreatorDoubleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"

@interface CreatorDoubleTableViewCell : UITableViewCell
{
    GLImageView     * _backView;
    
    UIImageView     * _backBlurImgView;
    UIImageView     * _photoImgView;
    
    UILabel         * _shopTitleLabel;
    UILabel         * _sloganLabel;
    
    UIView          * _morePhotosView;
    
    float             _singleMorePhotoViewWidth;
    
    NSMutableArray  * _creatorMorePhotosArray;

}


-(void)setCreatorDoubleTableCellWithModal:(CreatorCoverModal *)modal;

@end
