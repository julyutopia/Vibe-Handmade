//
//  CreatorDoubleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorCoverModal.h"

@protocol CreatorDoubleTableViewCellDelegate;

@interface CreatorDoubleTableViewCell : UITableViewCell
{
    NSInteger         _cellIndex;
    
    GLImageView     * _backView;
    
    UIImageView     * _backBlurImgView;
    UIImageView     * _photoImgView;
    
    UILabel         * _shopTitleLabel;
    UILabel         * _sloganLabel;
    
    UIView          * _morePhotosView;
    
    float             _singleMorePhotoViewWidth;
    
    NSMutableArray  * _creatorMorePhotosArray;
}

@property (weak, nonatomic) id<CreatorDoubleTableViewCellDelegate> delegate;

-(void)setCreatorDoubleTableCellWithModal:(CreatorCoverModal *)modal WithIndex:(NSInteger )index;

@end

@protocol CreatorDoubleTableViewCellDelegate <NSObject>

-(void)creatorDoubleCellDidTapWithIndex:(NSInteger )index;

@end






