//
//  CreatorHeaderTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorHeaderTableViewCell : UITableViewCell
{
    UIImageView     * _headerImgView;
}

-(void)setHeaderCellWithURL:(NSString *)imageURL;

@end
