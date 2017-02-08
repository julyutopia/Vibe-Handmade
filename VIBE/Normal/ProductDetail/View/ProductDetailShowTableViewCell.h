//
//  ProductDetailShowTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/11/23.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailShowTableViewCell : UITableViewCell
{
    UIView  * _backView;
    UILabel * _detailInfoLabel;
}

@property(assign, nonatomic) BOOL didLoadImage;

@property(assign, nonatomic) CGFloat imageHeight;

-(void)setDetailShowTableCellWithInfo:(NSDictionary *)dict;

-(float)calculateImageHeight;

@end
