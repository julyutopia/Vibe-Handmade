//
//  ItemDetailPhotoViewTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemDetailPhotoViewTableViewCellDelegate;

@interface ItemDetailPhotoViewTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;

    NSMutableArray  * _morePhotosArray;
}

@property (weak, nonatomic) id<ItemDetailPhotoViewTableViewCellDelegate> delegate;

-(void)setItemDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end

@protocol ItemDetailPhotoViewTableViewCellDelegate <NSObject>

-(void)itemDetailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger )index;

@end
