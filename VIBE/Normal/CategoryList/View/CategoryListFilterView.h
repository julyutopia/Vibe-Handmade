//
//  CategoryListFilterView.h
//  VIBE
//
//  Created by Li Haii on 2016/12/27.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryListFilterViewDelegate;

@interface CategoryListFilterView : UIView
{
    NSInteger             _didSelectIndex;
    
    float                 _singleFilterViewWidth;
    float                 _singleFilterViewHeight;
    
    UIView              * _filterBackView;
    UIView              * _selectedView;
    
    UIButton            * _firstBtn;
    UIButton            * _secondBtn;
    UIButton            * _thirdBtn;
    
    UIVisualEffectView  * _filterBlurBackView;
}

@property(assign, nonatomic)BOOL isFilterViewShown;

@property (weak, nonatomic) id<CategoryListFilterViewDelegate> delegateee;

-(instancetype)initWithFrame:(CGRect)frame WithSingleItemHeight:(float )singleHeight;

-(void)setFilterWithImageNamesFirstNormal:(NSString *)first_normal FirstSelected:(NSString *)first_selected
                              SecondNormal:(NSString *)second_normal SecondSelected:(NSString *)second_selected
                              ThirdNormal:(NSString *)third_normal ThirdSelected:(NSString *)third_selected
                              ButtonWidth:(float )width ButtonHeight:(float )height;

-(void)showFilterView;
-(void)hideFilterView;

@end


@protocol CategoryListFilterViewDelegate <NSObject>

-(void)categoryListFilterViewClickWithIndex:(NSInteger )index;

-(void)categoryListFilrerViewDidHide;

@end
