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
    
  
    UIVisualEffectView  * _filterBackView;
    
//    UIView              * _selectedView;
    
    UIButton            * _firstBtn;
    UIButton            * _secondBtn;
    UIButton            * _thirdBtn;
}

@property(assign, nonatomic)BOOL isFilterViewShow;


@property (weak, nonatomic) id<CategoryListFilterViewDelegate> delegateee;

-(void)showFilterView;
-(void)hideFilterView;

@end


@protocol CategoryListFilterViewDelegate <NSObject>

-(void)categoryListFilterViewClickWithIndex:(NSInteger )index;

-(void)categoryListFilterViewWillHide;

-(void)categoryListFilrerViewDidHide;

@end
