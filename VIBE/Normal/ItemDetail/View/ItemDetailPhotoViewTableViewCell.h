//
//  ItemDetailPhotoViewTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/10.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailPhotoViewTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;

    NSMutableArray  * _morePhotosArray;
}

-(void)setItemDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end
