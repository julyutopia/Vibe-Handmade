//
//  CreatorTitleTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorDetailModal.h"

@interface CreatorTitleTableViewCell : UITableViewCell
{
    UILabel         * _titleLabel;//专题名
    
    UIImageView     * _shopImgView;
    UILabel         * _shopLabel;//店铺名字
    
    UIImageView     * _favorCountImgView;//喜欢数
    UILabel         * _favorCountLabel;
    
    UIView          * _seprateLineView;//分隔线
}

-(void)setCreatorDetailTitleCellWithModal:(CreatorDetailModal *)modal;

@end
