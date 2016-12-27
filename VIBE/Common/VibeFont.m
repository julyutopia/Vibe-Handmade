//
//  VibeFont.m
//  VIBE
//
//  Created by Li Haii on 16/8/8.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeFont.h"

@implementation VibeFont

+ (UIFont*)fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    CGFloat size = fontSize;
    if (Is4Inch) {
        size = fontSize + 1;
    }
    else if (Is5Inch) {
        size = fontSize + 3;
    }
    return [super fontWithName:fontName size:size];
}


@end
