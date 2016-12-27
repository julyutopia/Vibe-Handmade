//
//  MineFavorStoresTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/16.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineFavorStoresTopTableViewCell : UITableViewCell

{
    UIView  * _backView;
    UIImageView * _titleImgView;
    
    CAShapeLayer * _maskLayer;
}

-(void)setCell;

@end
