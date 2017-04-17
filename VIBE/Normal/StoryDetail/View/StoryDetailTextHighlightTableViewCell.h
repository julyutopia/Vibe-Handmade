//
//  StoryDetailTextHighlightTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryDetailTextHighlightTableViewCell : UITableViewCell
{
    UIView          * _backView;
    
    UIImageView     * _iconImgView;
    
    UILabel         * _highlightTextLabel;
}

-(void)setStoryDetailTextHighlightCellWithInfo:(NSString *)detail;

@end
