//
//  NSString+Extension.h
//  QYER
//
//  Created by 张小龙 on 14/11/11.
//  Copyright (c) 2014年 QYER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface NSString (Extension)
- (NSString *)cutoffBBSID;
- (NSString *)cutoffForumID;
/**
 *  计算字符串绘制大小
 *
 *  @param limitSize 绘制区域
 *  @param font      字体
 *
 *  @return 绘制大小
 */
- (CGSize)getSizeWithLimitSize:(CGSize)limitSize withFont:(UIFont *)font;

- (NSString *)cleanSpaceInBegin:(BOOL)begin inEnd:(BOOL)end inMiddle:(BOOL)middle;

- (NSArray *)getSeparatedLinesWithfont:(UIFont *)font frame:(CGRect)rect;

/**
 *  对 URL 进行 URLEncode 编码
 *
 *  @return return value description
 */
- (NSString*)stringByURLEncodingString;

/**
 *  对 URL 进行 URLDecode 解码
 *
 *  @return return value description
 */
- (NSString *)stringByURLDecodingString;

/**
 *  格式化金额字符串,三位加一个逗号
 *
 *  @return return value description
 */
-(NSString *)formatNumberString;

/**
 *  阿拉伯数字转汉语数字
 *
 *  @param arebic arebic description
 *
 *  @return return value description
 */
+(NSString *)translation:(NSString *)arebic;
/**
 *  查找URL中得参数 键值对
 *
 *  @param hasPrefix 识别url 排头 如lastminte://sup?
 *
 *  @return 键值对 字典
 */
-(NSDictionary *)getUrlWtihParameter:(NSString *)hasPrefix;
/**
 *  字符串是否为中文
 *
 *  @return 是
 */
- (BOOL)isChinese;
/**
 *  价格红色显示
 *
 *  @param defaultStyle 默认样式非价格文字
 *
 *  @return 处理后的价格
 */
- (NSMutableAttributedString *)convertPriceText:(NSDictionary *) defaultStyle;

//检测手机号
- (BOOL)checkIsPhoneNumber:(NSString*)phone;



@end
