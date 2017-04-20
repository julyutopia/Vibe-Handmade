//
//  CreatorDetailMorePhotosTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreatorDetailMorePhotosTableViewCellDelegate;


@interface CreatorDetailMorePhotosTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;
    
    NSMutableArray  * _morePhotosArray;
    
}

@property (weak, nonatomic) id<CreatorDetailMorePhotosTableViewCellDelegate> delegate;

-(void)setCreatorDetailMorePhotosCellWithInfo:(NSArray *)photosArray;

@end

@protocol CreatorDetailMorePhotosTableViewCellDelegate <NSObject>

-(void)creatorDetailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger )index;

@end
