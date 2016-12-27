//
//  CategoryBottomTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryBottomTableViewCellDelegate;

@interface CategoryBottomTableViewCell : UITableViewCell
{
    UIVisualEffectView * _backView;
    UIButton * _iconImgView;
}

@property (weak, nonatomic) id<CategoryBottomTableViewCellDelegate> delegate;

@end

@protocol CategoryBottomTableViewCellDelegate <NSObject>

-(void)categoryCellShowAll;

@end
