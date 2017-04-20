//
//  CreatorDetailTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorDetailModal.h"

@interface CreatorDetailTopTableViewCell : UITableViewCell
{
    float                     _photoViewHeight;
    
    UIView                  * _backView;
    
    UIImageView             * _backBlurImgView;
    UIImageView             * _photoImgView;
    
    UILabel                 * _shopNameLabel;
    UILabel                 * _sloganLabel;
}


-(void)setCreatorDetailTopCellWithModal:(CreatorDetailModal *)creatorModal;


@end
