//
//  AllCategoryTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/9/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define IMAGE_HEIGHT 200
#define IMAGE_OFFSET_SPEED 25

@interface AllCategoryTableViewCell : UITableViewCell
{

}

@property (nonatomic, strong, readwrite) UIImage *image;
@property (nonatomic, assign, readwrite) CGPoint imageOffset;
@property (nonatomic, retain) NSString * cateName;

-(void)setCategoryCellWithName:(NSString *)name imgUrl:(NSString *)img ID:(NSInteger )cateID;

@end
