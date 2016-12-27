//
//  GradientTagCloudView.h
//  VIBE
//
//  Created by Li Haii on 16/10/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientTagCloudView : UIView
{
    UIView * _gtadientTagBackView;
}

-(void)setGradientTagCloudWithMaxWidth:(float )maxWidth MaxHeight:(float )height WithFont:(UIFont *)font AndTags:(NSArray *)tagArray;

@end
