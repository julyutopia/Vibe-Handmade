//
//  AdView.h
//  广告循环滚动效果
//
//  Created by QzydeMac on 14/12/24.
//  Copyright (c) 2014年 Qzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdViewDelegate;

typedef NS_ENUM(NSUInteger, UIPageControlShowStyle)
{
    /**
     *  @author ZY, 15-04-26
     *
     *  不显示PageControl
     */
    UIPageControlShowStyleNone,//default
    UIPageControlShowStyleLeft,
    UIPageControlShowStyleCenter,
    UIPageControlShowStyleRight,
};

typedef NS_ENUM(NSUInteger, AdTitleShowStyle)
{
    /**
     *  @author ZY, 15-04-26
     *
     *  不显示标题
     */
    AdTitleShowStyleNone,
    AdTitleShowStyleLeft,
    AdTitleShowStyleCenter,
    AdTitleShowStyleRight,
};

@interface AdView : UIView<UIScrollViewDelegate>
{
    UILabel * _centerAdLabel;
    CGFloat _adMoveTime;
}

@property (weak, nonatomic) id<AdViewDelegate> delegate;


/*
  可以在adScrollView上添加一些不随广告滚动的控件
 */

@property (assign,nonatomic) NSInteger indexxx;

@property (retain,nonatomic,readonly) UIScrollView * adScrollView;
@property (retain,nonatomic) NSArray * imageLinkURL;
@property (retain,nonatomic) NSArray * adTitleArray;


@property (strong, nonatomic) NSNumber* centerIndexNumber;
/**
 *  @author ZY, 15-05-17
 *

 *  设置page显示位置
 */
@property (assign,nonatomic) UIPageControlShowStyle  PageControlShowStyle;
/**
 *  @author ZY, 15-05-17
 *
 *  设置标题对应的位置
 */
@property (assign,nonatomic,readonly) AdTitleShowStyle  adTitleStyle;

/**
 *  @author ZY, 15-05-17
 *
 *  设置占位图片
 */
@property (nonatomic,strong) UIImage * placeHoldImage;

/**
 *  @author ZY, 15-05-17
 *
 *  是否需要定时循环滚动
 */
@property (nonatomic,assign) BOOL isNeedCycleRoll;

/**
 *  @author ZY, 15-04-26
 *
 *  @brief  图片移动计时器
 */
@property (nonatomic,assign) CGFloat  adMoveTime;
/**
 *  @author ZY, 15-04-26
 *
 *  @brief  在这里修改Label的一些属性
 */
@property (nonatomic,strong,readonly) UILabel * centerAdLabel;

/**
 *  @author ZY, 15-04-26
 *
 *  @brief  给图片创建点击后的回调方法
 */
@property (nonatomic,strong) void (^callBack)(NSInteger index,NSString * imageURL);

/*
 通过模型获取当前被点击对象,并回传当前图片的模型,只有在使用模型初始化AdView时有效
*/
@property (nonatomic,strong) void (^callBackForModel)(id model);


- (void)setUpTime;

@end



@protocol AdViewDelegate <NSObject>

-(void)AdViewTapWithIndex:(NSInteger )index;

-(void)AdViewScrollIndex:(NSInteger )index;

@end






