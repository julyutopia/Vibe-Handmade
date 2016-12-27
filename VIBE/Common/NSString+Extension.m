//
//  NSString+Extension.m
//  QYER
//
//  Created by 张小龙 on 14/11/11.
//  Copyright (c) 2014年 QYER. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSString *)cutoffBBSID {
    
    NSRange range1 = [self rangeOfString:@"/" options:NSBackwardsSearch];
    NSRange range2 = [self rangeOfString:@"." options:NSBackwardsSearch];
    NSString *bbsID = [self substringWithRange:NSMakeRange(range1.location + 1, range2.location - range1.location - 1)];
    return bbsID;
}

- (NSString *)cutoffForumID {
    NSRange range1 = [self rangeOfString:@"-"];
    NSRange range2 = [self rangeOfString:@"-" options:NSBackwardsSearch];
    NSString *forumID = [self substringWithRange:NSMakeRange(range1.location + 1, range2.location - range1.location - 1)];
    return forumID;
}

-(CGSize)getSizeWithLimitSize:(CGSize)limitSize withFont:(UIFont *)font
{
    return [self boundingRectWithSize:limitSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:font}
                                context:nil].size;
}

- (NSString *)cleanSpaceInBegin:(BOOL)begin inEnd:(BOOL)end inMiddle:(BOOL)middle {
    
    NSString *tempString;
    
    if (begin && end && middle) {
        
        tempString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
        
    }else {
        
        tempString = [self copy];
        
        if (begin) {
            
            while ([tempString hasPrefix:@" "]) {
                tempString = [tempString substringFromIndex:1];
            }
            
        }
        
        if (end) {
            
            while ([tempString hasSuffix:@" "]) {
                tempString = [tempString substringToIndex:tempString.length - 1];
            }
            
        }
        
    }
    
    return tempString;
    
}

/**
 *  获取lalbe 每行文字
 *
 *  @return 每行文字数组
 */
- (NSArray *)getSeparatedLinesWithfont:(UIFont *)font frame:(CGRect)rect {
    
    return [self getSeparatedLinesWithText:self font:font frame:rect];
    
}

- (NSArray *)getSeparatedLinesWithText:(NSString *)t font:(UIFont *)font frame:(CGRect)rect {
    
    
    if (!(t && [t isKindOfClass:[NSString class]])) {
        return nil;
    }
    
    if (!font) {
        return nil;
    }
    
    NSString *text = t;
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    
    CFRelease(frameSetter);
    CFRelease(myFont);
    CFRelease(frame);
    CFRelease(path);
    return (NSArray *)linesArray;
}

- (NSString*)stringByURLEncodingString {
    
    // NSURL's stringByAddingPercentEscapesUsingEncoding: does not escape
    // some characters that should be escaped in URL parameters, like / and ?;
    // we'll use CFURL to force the encoding of those
    //
    // We'll explicitly leave spaces unescaped now, and replace them with +'s
    //
    // Reference: <a href="%5C%22http://www.ietf.org/rfc/rfc3986.txt%5C%22" target="\"_blank\"" onclick='\"return' checkurl(this)\"="" id="\"url_2\"">http://www.ietf.org/rfc/rfc3986.txt</a>
    
    NSString *resultStr = self;
    
    CFStringRef originalString = (__bridge CFStringRef) self;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
    
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                         originalString,
                                                         leaveUnescaped,
                                                         forceEscaped,
                                                         kCFStringEncodingUTF8);
    
    if( escapedStr )
    {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
        
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" "
                                    withString:@"%20"
                                       options:0
                                         range:NSMakeRange(0, [mutableStr length])];
        resultStr = mutableStr;
    }
    return resultStr;
}

- (NSString *)stringByURLDecodingString
{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)formatNumberString {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init] ;
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[self floatValue]]];
    return numberAsString;
}


+ (NSString *)translation:(NSString *)arebic {
    
    NSString *str = arebic;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    return chinese;
}


-(NSDictionary *)getUrlWtihParameter:(NSString *)hasPrefix
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *str = [(NSString *)self  stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [(NSString *)self  stringByReplacingOccurrencesOfString:hasPrefix withString:@""];
    NSArray *arr = [str componentsSeparatedByString:@"&"];
    for (NSString *parmeter in arr) {
        NSArray *parmeterArr = [parmeter componentsSeparatedByString:@"="];
        if (parmeterArr.count ==2) {
            [dic setObject:parmeterArr[1] forKey:parmeterArr[0]];
        }
    }
    
    if (dic.count >0) {
        return dic;
    }else
    {
        return nil;
    }

}

-(BOOL)isChinese
{
    BOOL is = NO;
    for (int i = 0 ; i < self.length ; i++) {
        unichar c = [self characterAtIndex:i];
        if (c >= 0x4E00 && c <= 0x9FA5) {
            is = YES;
        }else{
            is = NO;
            break;
        }
    }
    
    return is;
}

- (NSMutableAttributedString *)convertPriceText:(NSDictionary *)defaultStyle
{
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:defaultStyle];
    
    NSRange startRange = [self rangeOfString:@"<em>"];
    NSInteger startIndex = -1;
    NSInteger endIndex = -1;
    if (startRange.location != NSNotFound) {
        startIndex = startRange.location + startRange.length;
        
        NSRange endRange = [self rangeOfString:@"</em>"];
        if (endRange.location != NSNotFound) {
            endIndex = endRange.location;
        }
        NSRange priceRange = NSMakeRange(startIndex, endIndex - startIndex);
 
        UIFont *font = [VibeFont fontWithName:Default_Font size:20];
        [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:font ? font : [VibeFont systemFontOfSize:20] range:priceRange];
        //颜色
        [mutableAttributedString addAttribute:(id)kCTForegroundColorAttributeName value:(id)DefaultQYOrange.CGColor range:priceRange];
    }
    NSString *temp = self;
    if ([temp rangeOfString:@"<em>"].location != NSNotFound) {
        [mutableAttributedString replaceCharactersInRange:[temp rangeOfString:@"<em>"] withString:@""];
        temp = [mutableAttributedString string];
    }
    if ([temp rangeOfString:@"</em>"].location != NSNotFound) {
        [mutableAttributedString replaceCharactersInRange:[temp rangeOfString:@"</em>"] withString:@""];
    }
    
    return mutableAttributedString;
}

//检测手机号
- (BOOL)checkIsPhoneNumber:(NSString*)phone
{
    NSString*pattern =@"^1+[3578]+\\d{9}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:phone];
    
    return isMatch;
}

@end



