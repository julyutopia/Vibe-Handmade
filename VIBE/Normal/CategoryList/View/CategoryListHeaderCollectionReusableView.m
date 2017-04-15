//
//  CategoryListHeaderCollectionReusableView.m
//  VIBE
//
//  Created by Li Haii on 2017/4/13.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CategoryListHeaderCollectionReusableView.h"

@implementation CategoryListHeaderCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        float topbarWidth = frame.size.width;
        _topbarHeight = frame.size.height;
        
        _topbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, topbarWidth, _topbarHeight +10)];
        [_topbarView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_topbarView];
        
       

    }
    
    return self;
}


-(void)setCategoryListHeaderViewWithSubcate:(NSArray *)subcateArray WithColorImage:(UIImage *)image
{
    if (!_categorySetSegment) {
        _categorySetSegment  = [[YUSegment alloc]initWithTitles:subcateArray style:YUSegmentStyleLine];
        _categorySetSegment.textColor = Default_Text_Gray_Color_60;
        _categorySetSegment.selectedTextColor = Default_Text_Dark_Color_90;
        _categorySetSegment.selectedFont = [VibeFont fontWithName:Font_Chinese_Regular size:16];
        _categorySetSegment.font = [VibeFont fontWithName:Font_Chinese_Regular size:13];
        [_topbarView addSubview:_categorySetSegment];
        
        [_categorySetSegment setFrame:CGRectMake(30, 10, kScreenWidth -60, _topbarHeight)];
        [_categorySetSegment addTarget:self action:@selector(categorySegmentDidChange) forControlEvents:UIControlEventValueChanged];
        
        if (image && [image mostColor]) {
            
                UIColor * selectColor = [image mostColor];
                
                [_categorySetSegment.indicator setBackgroundColor:selectColor];
                [_categorySetSegment.indicatorLineView setBackgroundColor:selectColor];
        }
        else{
            [_categorySetSegment.indicator setBackgroundColor:DefaultGreen];
        }
    }
    
    
}



#pragma mark -切换分类
-(void)categorySegmentDidChange
{
    NSLog(@"~~~~ %ld ~~~~",_categorySetSegment.selectedIndex);
}




@end
