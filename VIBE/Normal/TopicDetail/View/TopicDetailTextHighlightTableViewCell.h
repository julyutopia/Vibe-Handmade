//
//  TopicDetailTextHighlightTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicDetailTextHighlightTableViewCell : UITableViewCell
{
    UIView          * _backView;
    
    UIImageView     * _iconImgView;
    
    UILabel         * _highlightTextLabel;
}

-(void)setTopicDetailTextHighlightCellWithInfo:(NSString *)detail;


@end
