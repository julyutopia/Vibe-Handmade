//
//  TagListTopCollectionViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTagModal.h"

#import "TTTAttributedLabel.h"

@interface TagListTopCollectionViewCell : UICollectionViewCell
{
    UIView                  * _backView;
    
    UIImageView             * _backBlurImgView;
    UIImageView             * _photoImgView;
    
    TTTAttributedLabel      * _itemsCountLabel;
    UILabel                 * _itemTitleLabel;
}

-(void)tagListTopCellSetWithInfo:(DiscoverTagModal *)tagModal;

@end
