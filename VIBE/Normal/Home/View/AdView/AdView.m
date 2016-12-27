//
//  AdView.m
//  广告循环滚动效果
//
//  Created by QzydeMac on 14/12/24.
//  Copyright (c) 2014年 Qzy. All rights reserved.
//

//
//  AdScrollView.m
//  广告循环滚动效果
//
//  Created by QzydeMac on 14/12/20.
//  Copyright (c) 2014年 Qzy. All rights reserved.
//

#import "AdView.h"
#import "UIImageView+WebCache.h"
//广告的宽度
#define kAdViewWidth  _adScrollView.bounds.size.width
//广告的高度
#define kAdViewHeight  _adScrollView.bounds.size.height
//由于_pageControl是添加进父视图的,所以实际位置要参考,滚动视图的y坐标
#define HIGHT _adScrollView.bounds.origin.y

@interface AdView ()
{
    //循环滚动的三个视图
    GLImageView * _leftImageView;
    GLImageView * _centerImageView;
    GLImageView * _rightImageView;
    
    UIView      * _tapView;
    
    //用于确定滚动式由人导致的还是计时器到了,系统帮我们滚动的,YES,则为系统滚动,NO则为客户滚动(ps.在客户端中客户滚动一个广告后,这个广告的计时器要归0并重新计时)
    BOOL _isTimeUp;
}

@property (nonatomic,assign) NSUInteger centerImageIndex;
@property (nonatomic,assign) NSUInteger leftImageIndex;
@property (nonatomic,assign) NSUInteger rightImageIndex;
@property (assign,nonatomic,readonly) NSTimer *moveTimer;
@property (nonatomic,strong) NSArray * models;
@end

@implementation AdView

@synthesize indexxx;
@synthesize centerImageIndex;
@synthesize rightImageIndex;
@synthesize leftImageIndex;
@synthesize moveTimer;

@synthesize centerIndexNumber;

#pragma mark - 自由指定广告所占的frame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //默认滚动式3.0s
        _adMoveTime = 3.0;
        
        _adScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _adScrollView.bounces = NO;
        _adScrollView.delegate = self;
        _adScrollView.pagingEnabled = YES;
        _adScrollView.showsVerticalScrollIndicator = NO;
        _adScrollView.showsHorizontalScrollIndicator = NO;
        _adScrollView.backgroundColor = [UIColor whiteColor];
        _adScrollView.contentOffset = CGPointMake(kAdViewWidth, 0);
        _adScrollView.contentSize = CGSizeMake(kAdViewWidth * 3, kAdViewHeight);
        //该句是否执行会影响pageControl的位置,如果该应用上面有导航栏,就是用该句,否则注释掉即可
        _adScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _leftImageView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, kAdViewWidth, kAdViewHeight)];
        [_leftImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_leftImageView.layer setMasksToBounds:YES];
        [_adScrollView addSubview:_leftImageView];
        
        _centerImageView = [[GLImageView alloc]initWithFrame:CGRectMake(kAdViewWidth, 0, kAdViewWidth, kAdViewHeight)];
        [_centerImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_centerImageView.layer setMasksToBounds:YES];
        [_centerImageView addTarget:self action:@selector(tapppp) forControlEvents:UIControlEventTouchUpInside];
        [_adScrollView addSubview:_centerImageView];
     
        _rightImageView = [[GLImageView alloc]initWithFrame:CGRectMake(kAdViewWidth*2, 0, kAdViewWidth, kAdViewHeight)];
        [_rightImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_rightImageView.layer setMasksToBounds:YES];
        [_adScrollView addSubview:_rightImageView];
        
        
        _isNeedCycleRoll = YES;
        [self addSubview:_adScrollView];
        
        
        _tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kAdViewWidth, kAdViewHeight)];
        [_tapView setBackgroundColor:[UIColor clearColor]];
        [_tapView setHidden:YES];
        [self addSubview:_tapView];
        
        
        [self addObserver:self forKeyPath:@"centerIndexNumber" options:0 context:nil];
        
       }
    
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    NSLog(@"________%@________",self.centerIndexNumber);
}



//这个方法会在子视图添加到父视图或者离开父视图时调用
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
    if (!newSuperview)
    {
        [self.moveTimer invalidate];
        moveTimer = nil;
    }
    else
    {
        [self setUpTime];
    }
}


- (void)setUpTime
{
    if (_isNeedCycleRoll&&_imageLinkURL.count>=2)
    {
        moveTimer = [NSTimer scheduledTimerWithTimeInterval:_adMoveTime target:self selector:@selector(animalMoveImage:) userInfo:nil repeats:YES];
        _isTimeUp = NO;
    }
}


-(void)setIsNeedCycleRoll:(BOOL)isNeedCycleRoll
{
    _isNeedCycleRoll = isNeedCycleRoll;
    if (!_isNeedCycleRoll)
    {
        [moveTimer invalidate];
        moveTimer = nil;
    }
}


#pragma mark - 设置广告所使用的图片(名字)
- (void)setImageLinkURL:(NSArray *)imageLinkURL
{
    _imageLinkURL = imageLinkURL;
    leftImageIndex = imageLinkURL.count-1;
    centerImageIndex = 0;
    
    self.centerIndexNumber = [NSNumber numberWithInteger:centerImageIndex];
    
    rightImageIndex = 1;
    
    if (imageLinkURL.count==1)
    {
        _adScrollView.scrollEnabled = NO;
        rightImageIndex = 0;
    }
    
    
    [_leftImageView sd_setImageWithURL:imageLinkURL[leftImageIndex] placeholderImage:self.placeHoldImage];
    [_centerImageView sd_setImageWithURL:imageLinkURL[centerImageIndex] placeholderImage:self.placeHoldImage];
    [_rightImageView sd_setImageWithURL:imageLinkURL[rightImageIndex] placeholderImage:self.placeHoldImage];
}



#pragma mark - 计时器到时,系统滚动图片
- (void)animalMoveImage:(NSTimer *)time
{
    [_adScrollView setContentOffset:CGPointMake(kAdViewWidth * 2, 0) animated:YES];
    _isTimeUp = YES;
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}

#pragma mark - 图片停止时,调用该函数使得滚动视图复用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    _pageControl.currentPage = centerImageIndex;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_adScrollView.contentOffset.x == 0)
    {
        centerImageIndex = centerImageIndex - 1;
        
        self.centerIndexNumber = [NSNumber numberWithInteger:centerImageIndex];
        
        leftImageIndex = leftImageIndex - 1;
        rightImageIndex = rightImageIndex - 1;
        
        if (leftImageIndex == -1) {
            leftImageIndex = _imageLinkURL.count-1;
        }
        if (centerImageIndex == -1)
        {
            centerImageIndex = _imageLinkURL.count-1;
            
            self.centerIndexNumber = [NSNumber numberWithInteger:centerImageIndex];
        }
        if (rightImageIndex == -1)
        {
            rightImageIndex = _imageLinkURL.count-1;
        }
    }
    
    else if(_adScrollView.contentOffset.x == kAdViewWidth * 2)
    {
        
        centerImageIndex = centerImageIndex + 1;
        
        self.centerIndexNumber = [NSNumber numberWithInteger:centerImageIndex];
        
        leftImageIndex = leftImageIndex + 1;
        rightImageIndex = rightImageIndex + 1;
                
        if (leftImageIndex == _imageLinkURL.count) {
            leftImageIndex = 0;
        }
        if (centerImageIndex == _imageLinkURL.count)
        {
            centerImageIndex = 0;
            
            centerIndexNumber = [NSNumber numberWithInteger:centerImageIndex];
        }
        if (rightImageIndex == _imageLinkURL.count)
        {
            rightImageIndex = 0;
        }
        
    }
    
    else
    {
        return;
    }
    
    
    [_leftImageView sd_setImageWithURL:_imageLinkURL[leftImageIndex] placeholderImage:self.placeHoldImage];
    [_centerImageView sd_setImageWithURL:_imageLinkURL[centerImageIndex] placeholderImage:self.placeHoldImage];
    [_rightImageView sd_setImageWithURL:_imageLinkURL[rightImageIndex] placeholderImage:self.placeHoldImage];
    
    _adScrollView.contentOffset = CGPointMake(kAdViewWidth, 0);
    
    //手动控制图片滚动应该取消那个三秒的计时器
    if (!_isTimeUp) {
        [moveTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:_adMoveTime]];
    }
    _isTimeUp = NO;
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [moveTimer invalidate];
    moveTimer = nil;
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setUpTime];
}



/**
 *  @author ZY, 15-04-26
 *
 *  @brief  当前显示的图片被点击
 */


-(void)tapppp
{
    [_delegate AdViewTapWithIndex:centerImageIndex];
    
    NSLog(@"________点击:%ld_______",centerImageIndex);
    
//    if (_callBack)
//    {
//        _callBack(centerImageIndex,_imageLinkURL[centerImageIndex]);
//    }
//    
//    if (self.models&&_callBackForModel)
//    {
//        _callBackForModel(self.models[centerImageIndex]);
//    }
}
@end