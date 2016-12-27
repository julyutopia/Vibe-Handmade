//
//  HomeProductTopTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeProductTopTableViewCell : UITableViewCell
{
    UIERealTimeBlurView * _productTopBackView;
    UIImageView * _productTitleImgView;
}

-(void)setCell;

@end
