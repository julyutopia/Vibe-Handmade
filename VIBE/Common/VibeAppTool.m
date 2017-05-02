//
//  VibeAppTool.m
//  VIBE
//
//  Created by Li Haii on 16/10/15.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeAppTool.h"

@implementation VibeAppTool

static VibeAppTool* sharedInstance;

//单例
+(VibeAppTool *)sharedInstance
{
    if (!sharedInstance)
        sharedInstance = [[VibeAppTool alloc] init];
    return sharedInstance;
}


#pragma mark -用户登录信息
-(void)setUserLogin:(BOOL )logIn
{
    [[NSUserDefaults standardUserDefaults] setBool:logIn forKey:@"isUserLogIn"];
}

//判断用户是否已登录
-(BOOL)isUserLogIn
{
    BOOL isLogIn = NO;
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLogIn"]) {
        isLogIn = YES;
    }
    return isLogIn;
}

//登录时设置用户信息
-(void)setLoginUserInfo:(MineProfileModal *)modal
{
    if (self.userInfoModal) {
        self.userInfoModal = nil;
    }
    
    self.userInfoModal = [[MineProfileModal alloc]init];
    self.userInfoModal = modal;
    
    [self setUserLogin:YES];
}

//注销时清空用户信息
-(void)clearLoginUserInfo
{
    if (self.userInfoModal) {
        self.userInfoModal = nil;
    }
    
    [self setUserLogin:NO];
}


#pragma mark -检查String内容
//检查输入手机号是否符合
+(BOOL)isPhoneNumberCorrectWithNumber:(NSString *)number
{
    if (number.length != 11) {
        return NO;
    }
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL isPhoneCorrect = [regextestmobile evaluateWithObject:number];
    return isPhoneCorrect;
}


//判断搜索内容是否为空
+(BOOL)isStringEmpty:(NSString *)string
{
    if (!string) {
        return true;
    } else {
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSString *trimedString = [string stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}



//判断是否包含emoji表情
+ (BOOL)isStringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

//判断是否包含特殊符号
+(BOOL)isStringContainsSpecialCharact: (NSString *)str
{
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}



#pragma mark -带行距的Label
//给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withText:(NSString*)str withFont:(UIFont*)font withLineSpacing:(CGFloat )lineSpce
{
    if (!self.paraStyle) {
        self.paraStyle = [[NSMutableParagraphStyle alloc] init];
        self.paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
        self.paraStyle.alignment = NSTextAlignmentLeft;
        self.paraStyle.hyphenationFactor = 1.0;
        self.paraStyle.firstLineHeadIndent = 0.0;
        self.paraStyle.paragraphSpacingBefore = 0.0;
        self.paraStyle.headIndent = 0;
        self.paraStyle.tailIndent = 0;
    }
    self.paraStyle.lineSpacing = lineSpce;

    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:self.paraStyle, NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withLineSpacing:(CGFloat )lineSpce
{
    if (!self.paraStyle) {
        self.paraStyle = [[NSMutableParagraphStyle alloc] init];
        self.paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
        self.paraStyle.alignment = NSTextAlignmentLeft;
        self.paraStyle.hyphenationFactor = 1.0;
        self.paraStyle.firstLineHeadIndent = 0.0;
        self.paraStyle.paragraphSpacingBefore = 0.0;
        self.paraStyle.headIndent = 0;
        self.paraStyle.tailIndent = 0;
    }
    self.paraStyle.lineSpacing = lineSpce;

    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:self.paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, kScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}


//获取图片的主要颜色
-(UIColor *)getMainColorOfImage:(UIImage *)image
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) return nil;
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {//去除透明
                if (red==255&&green==255&&blue==255) {//去除白色
                }else{
                    NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }
                
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}



//判断是否开启推送通知
-(BOOL)isNotificationOpen
{
    BOOL isNotificationOpen;
    
    return isNotificationOpen;
}

@end


