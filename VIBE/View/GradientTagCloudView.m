//
//  GradientTagCloudView.m
//  VIBE
//
//  Created by Li Haii on 16/10/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "GradientTagCloudView.h"

@implementation GradientTagCloudView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        _gtadientTagBackView = [[UIView alloc]init];
        [_gtadientTagBackView setBackgroundColor:[UIColor clearColor]];
        [_gtadientTagBackView.layer setMasksToBounds:YES];
        [self addSubview:_gtadientTagBackView];
        
        _tagsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setGradientTagCloudWithMaxWidth:(float )maxWidth MaxHeight:(float )maxHeight WithFont:(UIFont *)font AndTags:(NSArray *)tagArray
{
    [_gtadientTagBackView setFrame:CGRectMake(0, 0, maxWidth, maxHeight)];
    
    if (_tagsArray.count) {
        return;
    }
    
    [_tagsArray addObjectsFromArray:tagArray];
    
    NSString * testString = @"测试";
    float singleHeight = [testString getSizeWithLimitSize:CGSizeMake(200, 20) withFont:font].height;
    
    NSInteger tagLines = 1;
    if ((maxHeight -6)/2 >singleHeight) {
        tagLines =2;
    }
    
    NSMutableArray * totalColorsArray = [NSMutableArray array];
    
    NSArray * colorArray1 = [NSArray arrayWithObjects:RGBA(138, 151, 252, 50), RGBA(206, 103, 232, 50), nil];
    NSArray * colorArray2 = [NSArray arrayWithObjects:RGBA(91, 203, 242, 50), RGBA(31, 54, 204, 50), nil];
    NSArray * colorArray3 = [NSArray arrayWithObjects:RGBA(194, 103, 231, 50), RGBA(245, 81, 81, 50), nil];
    NSArray * colorArray4 = [NSArray arrayWithObjects:RGBA(181, 231, 87, 50), RGBA(51, 207, 179, 50), nil];
    NSArray * colorArray5 = [NSArray arrayWithObjects:RGBA(239, 178, 94, 50), RGBA(239, 70, 62, 50), nil];
    NSArray * colorArray6 = [NSArray arrayWithObjects:RGBA(557, 236, 157, 50), RGBA(80, 134, 220, 50), nil];
    NSArray * colorArray7 = [NSArray arrayWithObjects:RGBA(243, 230, 103, 50), RGBA(229, 132, 54, 50), nil];
    
    [totalColorsArray addObject:colorArray1];
    [totalColorsArray addObject:colorArray2];
    [totalColorsArray addObject:colorArray3];
    [totalColorsArray addObject:colorArray4];
    [totalColorsArray addObject:colorArray5];
    [totalColorsArray addObject:colorArray6];
    [totalColorsArray addObject:colorArray7];
    
    float totalWidth = 0.0 ;
    float originY = 0.0;
    
    NSMutableArray * colorsArray = [NSMutableArray array];
    
    for (int i =0; i <tagArray.count; i++) {
        
        NSString * tagName = [tagArray objectAtIndex:i];
        
        CGSize tagNameSize = [tagName getSizeWithLimitSize:CGSizeMake(100, 20) withFont:font];
        float tagWidth = tagNameSize.width;
        float tagHeight = tagNameSize.height;
        
        int randomX = arc4random() % 6;
        
        for (NSNumber * numberrr in colorsArray) {
            
            if (randomX == [numberrr integerValue]) {
                int randommmm = arc4random() % 6;
                if (randommmm == randomX) {
                    randommmm = arc4random() % 6;
                    if (randommmm == randomX) {
                        randommmm = arc4random() % 6;
                    }
                }
                randomX = randommmm;
            }
        }
        [colorsArray addObject:[NSNumber numberWithInt:randomX]];
        
        NSArray * arrayssss = [totalColorsArray objectAtIndex:randomX];
        
        if (totalWidth +tagWidth +4 *2 >=maxWidth) {
            return;
        }
        
        UIView * tagView = [[UIView alloc]initWithFrame:CGRectMake(totalWidth, originY, 4 +tagWidth +4, 2 +tagHeight +2)];
        [tagView.layer setCornerRadius:5];
        [tagView.layer setMasksToBounds:YES];
        [tagView setBackgroundColor:[UIColor clearColor]];
        
        UIColor * colorrrr1 = [arrayssss objectAtIndex:0];
        UIColor * colorrrr2 = [arrayssss objectAtIndex:1];
        
        CAGradientLayer * tagViewLayer = [CAGradientLayer layer];
        tagViewLayer.frame = CGRectMake(0, 0, tagView.frame.size.width, tagView.frame.size.height);
        tagViewLayer.startPoint = CGPointMake(0, 0);
        tagViewLayer.endPoint = CGPointMake(1.0, 1.0);
        tagViewLayer.colors = @[
                                  (id)colorrrr1.CGColor,
                                  (id)colorrrr2.CGColor,
                                  ];
        [tagView.layer addSublayer:tagViewLayer];

        [_gtadientTagBackView addSubview:tagView];
        
        
        UILabel * tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 4 +tagWidth +4,  2 +tagHeight +2)];
        [tagLabel setTextAlignment:NSTextAlignmentCenter];
        [tagLabel setText:tagName];
        [tagLabel setTextColor:[UIColor whiteColor]];
        [tagLabel setFont:font];
        tagLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        tagLabel.layer.shadowOffset = CGSizeMake(0,2);
        tagLabel.layer.shadowOpacity = 0.3;
        tagLabel.layer.shadowRadius = 6;
        [tagView addSubview:tagLabel];
        
        totalWidth = totalWidth +4 +tagWidth +4 +8;
        
        
        if (totalWidth > maxWidth -tagWidth -4 -4) {
            
            totalWidth = 0;
            originY =  2 +tagHeight +2 +4;
//            [tagView setFrame:CGRectMake(totalWidth, originY, 4 +tagWidth +4, 2 +tagHeight +2)];
        }
    }
    
}


@end

