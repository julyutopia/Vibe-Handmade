//
//  CreatorDetailTextHighlightTableViewCell.h
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorDetailTextHighlightTableViewCell : UITableViewCell
{
    UIView          * _backView;
    
    UIImageView     * _iconImgView;
    
    UILabel         * _highlightTextLabel;
}

-(void)setCreatorDetailTextHighlightCellWithInfo:(NSString *)detail;


@end
