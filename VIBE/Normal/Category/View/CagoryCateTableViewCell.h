//
//  CagoryCateTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryModal.h"

@protocol CagoryCateTableViewCellDelegate;

@interface CagoryCateTableViewCell : UITableViewCell
{
    UIVisualEffectView * _backView;
    
    UIView  * _leftView;
    UIView  * _centerView;
    UIView  * _rightView;
    
    GLImageView * _leftCategoryImgView;
    GLImageView * _centerCategoryImgView;
    GLImageView * _rightCategoryImgView;
}

-(void)setCategoryCellWithFirstCategory:(CategoryModal *)firstModal AndSecondCategory:(CategoryModal *)secondModal AndThirdCategory:(CategoryModal *)thirdModal;

@property (weak, nonatomic) id<CagoryCateTableViewCellDelegate> delegate;

@end

@protocol CagoryCateTableViewCellDelegate <NSObject>

-(void)categoryCellTapWithModalID:(NSInteger )modalID;

@end






