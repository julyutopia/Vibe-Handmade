//
//  JGInfiniteScrollView.m
//  无限轮播-Demo
//
//  Created by 郭军 on 16/7/24.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGInfiniteScrollView.h"

static int const ImageViewCount = 3;

@interface JGInfiniteScrollView() <UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation JGInfiniteScrollView

@synthesize pageControlPostion;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 滚动视图
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        // 图片控件
        for (int i = 0; i<ImageViewCount; i++) {
            GLImageView *imageView = [[GLImageView alloc] init];
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            [imageView.layer setMasksToBounds:YES];
            [scrollView addSubview:imageView];
        }
        
        // 页码视图
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.currentPageIndicatorTintColor = RGBA(245, 245, 245, 90);
        pageControl.pageIndicatorTintColor = RGBA(213, 213, 213, 70);
        [self addSubview:pageControl];
        _pageControl = pageControl;
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    
    self.scrollView.contentSize = CGSizeMake(ImageViewCount * self.scrollView.frame.size.width, 0);
    
    for (int i = 0; i<ImageViewCount; i++) {
        GLImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    
//    if (self.pageControlPostion == 1) {
//        CGFloat pageW = 80;
//        CGFloat pageH = 20;
//        CGFloat pageX = (self.scrollView.frame.size.width - pageW)/2;
//        CGFloat pageY = self.scrollView.frame.size.height - pageH;
//        self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
//    }
//    if (self.pageControlPostion == 2) {
        CGFloat pageW = 80;
        CGFloat pageH = 20;
        CGFloat pageX = self.scrollView.frame.size.width - pageW;
        CGFloat pageY = self.scrollView.frame.size.height - pageH;
        self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
//    }
    
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    
    self.pageControl.numberOfPages = images.count;
    self.pageControl.currentPage = 0;
    
    // 设置内容
    [self updateContent];
    
    // 开始定时器
    [self startTimer];
}


#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _canClickScroll = NO;
    
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        GLImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = 0;
        if (self.isScrollDirectionPortrait) {
            distance = ABS(imageView.frame.origin.y - scrollView.contentOffset.y);
        } else {
            distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        }
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    
    self.pageControl.currentPage = page;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    [self updateContent];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
//    _canClickScroll = YES;

    [self updateContent];
}

#pragma mark - 内容更新
- (void)updateContent
{
    // 设置图片
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        
        GLImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        imageView.tag = index;
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[self.images objectAtIndex:index]] placeholderImage:nil];
        [imageView addTarget:self action:@selector(imageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // 设置偏移量在中间
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);

}


//向左边滚动
-(void)scrollLeft
{    
    if (_timer) {
        [self stopTimer];
        [self.scrollView setContentOffset:CGPointZero animated:YES];
        [self performSelector:@selector(startTimer) withObject:nil afterDelay:0.5f];
    }
    
    else{
        return;
    }
    
}

//向右边滚动
-(void)scrollRight
{
    if (_timer) {
        [self stopTimer];
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width *2, 0) animated:YES];
        [self performSelector:@selector(startTimer) withObject:nil afterDelay:0.5f];
    }
    
    else{
        return;
    }
}


//若滚动视图的图片遭到了点击，则会调用此方法，并且会将点击的到的视图传给相应的控制器去处理
- (void)imageViewClick:(GLImageView *)imgView {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ScrollViewDidClickAtAnyImageView:)]) {
        [self.delegate ScrollViewDidClickAtAnyImageView:imgView];
    }
}

#pragma mark - 定时器处理
- (void)startTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)next
{
    if (self.isScrollDirectionPortrait) {
        [self.scrollView setContentOffset:CGPointMake(0, 2 * self.scrollView.frame.size.height) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];
    }
}
@end
