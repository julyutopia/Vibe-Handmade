//
//  HomeBannerTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/4.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "HomeBannerTableViewCell.h"

#import "HomeBannerModal.h"

@implementation HomeBannerTableViewCell

@synthesize delegate = _delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _bannerCellHeight = 130 *sizeRate;
        
        _autoScrollView = [[JGInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _bannerCellHeight)];
        [_autoScrollView setBackgroundColor:[UIColor whiteColor]];
        _autoScrollView.pageControlPostion = 1;
        _autoScrollView.pageControl.currentPageIndicatorTintColor = DefaultGreen;
        _autoScrollView.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _autoScrollView.delegate = self;
        [self addSubview:_autoScrollView];
        
        _bannerInfoArrays = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(void)setBannerContent:(NSArray *)array
{
    if (array.count) {
        
        [_bannerInfoArrays removeAllObjects];
        
//        NSMutableArray * array = [NSMutableArray array];
        
        for (int i =0; i<array.count; i++) {
            HomeBannerModal * modal = [array objectAtIndex:i];
            [_bannerInfoArrays addObject:modal.imgURL];
        }
        
        [_autoScrollView setImages:_bannerInfoArrays];
    }
}


- (void)ScrollViewDidClickAtAnyImageView:(UIImageView *)imageView
{
    NSInteger taggg = imageView.tag;

    if (_bannerInfoArrays.count && taggg <_bannerInfoArrays.count && [_delegate respondsToSelector:@selector(homeBannerCellTapIndex:)])
    {
        [_delegate homeBannerCellTapIndex:taggg];
    }
}


@end












