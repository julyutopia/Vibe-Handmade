//
//  StoryDetailPhotoTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StoryDetailPhotoTableViewCellDelegate;

@interface StoryDetailPhotoTableViewCell : UITableViewCell
{
    float             _singlePhotoHeight;
    
    UIView          * _backView;
    
    UIScrollView    * _morePhotosScrollView;
    
    NSMutableArray  * _morePhotosArray;
    
}

@property (weak, nonatomic) id<StoryDetailPhotoTableViewCellDelegate> delegate;

-(void)setStoryDetailPhotoCellWithInfo:(NSArray *)photosArray;

@end

@protocol StoryDetailPhotoTableViewCellDelegate <NSObject>

-(void)storyDetailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger )index;

@end
