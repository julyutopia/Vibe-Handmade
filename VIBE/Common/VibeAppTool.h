//
//  VibeAppTool.h
//  VIBE
//
//  Created by Li Haii on 16/10/15.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VibeAppTool : NSObject

@property(retain, nonatomic)NSMutableParagraphStyle *paraStyle;

//单例
+(VibeAppTool *)sharedInstance;

//设置用户是否登录
+(void)setUserLogin:(BOOL )logIn;

//判断用户是否已登录
+(BOOL)isUserLogIn;


//检查输入手机号是否符合
+(BOOL)isPhoneNumberCorrectWithNumber:(NSString *)number;


//判断内容是否为空
+(BOOL)isStringEmpty:(NSString *)string;


//判断是否包含emoji表情
+ (BOOL)isStringContainsEmoji:(NSString *)string;


//判断是否包含特殊符号
+(BOOL)isStringContainsSpecialCharact: (NSString *)str;


//给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withText:(NSString*)str withFont:(UIFont*)font withLineSpacing:(CGFloat )lineSpce;

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withLineSpacing:(CGFloat )lineSpce;

//判断是否开启推送通知
-(BOOL)isNotificationOpen;


@end



