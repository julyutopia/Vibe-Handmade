//
//  MineFavorProductsTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/15.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MineFavorProductsTopTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UIImageView * _titleImgView;

    CAShapeLayer * _maskLayer;
}

-(void)setCell;

@end
