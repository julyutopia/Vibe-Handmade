//
//  DiscoverHotTagTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverHotTagModal.h"

#import "DiscoverHotTagView.h"

@interface DiscoverHotTagTableViewCell : UITableViewCell
{
    float _singTagViewWidth;
    float _singTagViewHeight;
    
    UIView      * _backView;
    UIImageView * _titleImgView;
    
    UIView      * _showHotTagsView;
    
    NSMutableArray  * _hotTagArray;
}

-(void)setDiscoverHotTagCellWithContent:(NSArray *)array;

@end
