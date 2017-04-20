//
//  CreatorSingleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/8.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"

@protocol CreatorSingleTableViewCellDelegate;

@interface CreatorSingleTableViewCell : UITableViewCell
{
    NSInteger         _cellIndex;

    
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

@property (weak, nonatomic) id<CreatorSingleTableViewCellDelegate> delegate;

-(void)setCreatorSingleTableCellWithModal:(CreatorCoverModal *)modal WithIndex:(NSInteger )index;

@end

@protocol CreatorSingleTableViewCellDelegate <NSObject>

-(void)creatorSingleCellDidTapWithIndex:(NSInteger )index;

@end













