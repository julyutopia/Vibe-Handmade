//
//  CategoryListFilterView.m
//  VIBE
//
//  Created by Li Haii on 2016/12/27.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryListFilterView.h"

@implementation CategoryListFilterView

- (instancetype)initWithFrame:(CGRect)frame WithSingleItemHeight:(float )singleHeight;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setHidden:YES];

        [self setUserInteractionEnabled:YES];
        
        self.isFilterViewShown = NO;
        
        _singleFilterViewWidth = frame.size.width;
        _singleFilterViewHeight = singleHeight;

        
        UIBlurEffect * filterBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _filterBlurBackView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, _singleFilterViewWidth, frame.size.height)];
        [_filterBlurBackView setEffect:filterBlurEffect];
        [_filterBlurBackView setAlpha:0.0f];
        _filterBlurBackView.userInteractionEnabled = YES;
        UITapGestureRecognizer * filterBlurTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapFilterBackView:)];
        [_filterBlurBackView addGestureRecognizer:filterBlurTap];
        [self addSubview:_filterBlurBackView];
        
        
        _filterBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _singleFilterViewWidth, 0)];
        [_filterBackView setBackgroundColor:RGBA(255, 255, 255, 100)];
        [_filterBackView setAlpha:0.0f];
        [self addSubview:_filterBackView];
        
        _selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _singleFilterViewWidth, _singleFilterViewHeight)];
        [_selectedView setBackgroundColor:RGBA(244, 244, 244, 100)];
        [_filterBackView addSubview:_selectedView];
        
        
        for (int i =1; i <3; i ++) {
            UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(10, _singleFilterViewHeight *i  -1, _singleFilterViewWidth -20, 1)];
            [lineView setBackgroundColor:RGBA(240, 240, 240, 100)];
            [_filterBackView addSubview:lineView];
        }
        
        _firstBtn = [[UIButton alloc]init];
        [_firstBtn setSelected:YES];
        [_firstBtn addTarget:self action:@selector(didClickFirstBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_firstBtn];
        
        _secondBtn = [[UIButton alloc]init];
        [_secondBtn addTarget:self action:@selector(didClickSecondBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_secondBtn];

        _thirdBtn = [[UIButton alloc]init];
        [_thirdBtn addTarget:self action:@selector(didClickThirdBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_thirdBtn];
        
        _didSelectIndex = 0;
        
    }
    return self;
}


-(void)setFilterWithImageNamesFirstNormal:(NSString *)first_normal FirstSelected:(NSString *)first_selected
                             SecondNormal:(NSString *)second_normal SecondSelected:(NSString *)second_selected
                              ThirdNormal:(NSString *)third_normal ThirdSelected:(NSString *)third_selected
                              ButtonWidth:(float)width ButtonHeight:(float)height
{
    
    float originGap = (_singleFilterViewHeight -height)/2;
    
    [_firstBtn setFrame:CGRectMake( (_singleFilterViewWidth -width)/2, originGap, width, height)];
    [_secondBtn setFrame:CGRectMake( (_singleFilterViewWidth -width)/2, _singleFilterViewHeight +originGap, width, height)];
    [_thirdBtn setFrame:CGRectMake( (_singleFilterViewWidth -width)/2, _singleFilterViewHeight *2 +originGap, width, height)];
    
    [_firstBtn setBackgroundImage:[UIImage imageNamed:first_normal] forState:UIControlStateNormal];
    [_firstBtn setBackgroundImage:[UIImage imageNamed:first_selected] forState:UIControlStateSelected];

    [_secondBtn setBackgroundImage:[UIImage imageNamed:second_normal] forState:UIControlStateNormal];
    [_secondBtn setBackgroundImage:[UIImage imageNamed:second_selected] forState:UIControlStateSelected];
    
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:third_normal] forState:UIControlStateNormal];
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:third_selected] forState:UIControlStateSelected];
}


-(void)didTapFilterBackView:(UITapGestureRecognizer *)tappp
{
    [self hideFilterView];
}


-(void)showFilterView
{
    [self setHidden:NO];

    [UIView animateWithDuration:0.3f animations:^{
        
        [_filterBlurBackView setAlpha:1.0f];
        
        [_filterBackView setFrame:CGRectMake(0, 0, _singleFilterViewWidth, _singleFilterViewHeight *3)];
        [_filterBackView setAlpha:1.0f];
        
        [_selectedView setAlpha:1.0f];

    } completion:^(BOOL finished) {
        self.isFilterViewShown = YES;
    }];
}


-(void)hideFilterView
{
    [UIView animateWithDuration:0.3f animations:^{
        
        [_filterBlurBackView setAlpha:0.0f];

        [_filterBackView setFrame:CGRectMake(0, 0, _singleFilterViewWidth, 0)];
        [_filterBackView setAlpha:0.0f];
        
        [_selectedView setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        self.isFilterViewShown = NO;
        
        [self setHidden:YES];
        
        if ([_delegateee respondsToSelector:@selector(categoryListFilrerViewDidHide)]) {
            [_delegateee categoryListFilrerViewDidHide];
        }
    }];
}


-(void)didClickFirstBtn:(UIButton *)btn
{
    if (_didSelectIndex == 0) {
        return;
    }
    _didSelectIndex = 0;
    
    [UIView animateWithDuration:0.1f animations:^{
        [_selectedView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [_selectedView setFrame:CGRectMake(0, 0, _singleFilterViewWidth, _singleFilterViewHeight)];
        [UIView animateWithDuration:0.15f animations:^{
            [_selectedView setAlpha:1.0f];
        } completion:^(BOOL finished) {
            [_firstBtn setSelected:YES];
            [_secondBtn setSelected:NO];
            [_thirdBtn setSelected:NO];
        }];
    }];
    
//    [UIView animateWithDuration:0.15f animations:^{
//        [_selectedView setFrame:CGRectMake(0, 0, _singleFilterViewWidth, _singleFilterViewHeight)];
//    } completion:^(BOOL finished) {
//        [_firstBtn setSelected:YES];
//        [_secondBtn setSelected:NO];
//        [_thirdBtn setSelected:NO];
//    }];
    
    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.3f];
}

-(void)didClickSecondBtn:(UIButton *)btn
{
    if (_didSelectIndex == 1) {
        return;
    }
    _didSelectIndex = 1;
    
    [UIView animateWithDuration:0.1f animations:^{
        [_selectedView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [_selectedView setFrame:CGRectMake(0, _singleFilterViewHeight, _singleFilterViewWidth, _singleFilterViewHeight)];
        [UIView animateWithDuration:0.15f animations:^{
            [_selectedView setAlpha:1.0f];
        } completion:^(BOOL finished) {
            [_firstBtn setSelected:NO];
            [_secondBtn setSelected:YES];
            [_thirdBtn setSelected:NO];
        }];
    }];
    
//    [UIView animateWithDuration:0.15f animations:^{
//        [_selectedView setFrame:CGRectMake(0, _singleFilterViewHeight, _singleFilterViewWidth, _singleFilterViewHeight)];
//    } completion:^(BOOL finished) {
//        [_firstBtn setSelected:NO];
//        [_secondBtn setSelected:YES];
//        [_thirdBtn setSelected:NO];
//    }];
   
    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.3f];
}

-(void)didClickThirdBtn:(UIButton *)btn
{
    if (_didSelectIndex == 2) {
        return;
    }
    _didSelectIndex = 2;
    
    
    [UIView animateWithDuration:0.1f animations:^{
        [_selectedView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [_selectedView setFrame:CGRectMake(0, _singleFilterViewHeight *2, _singleFilterViewWidth, _singleFilterViewHeight)];
        [UIView animateWithDuration:0.15f animations:^{
            [_selectedView setAlpha:1.0f];
        } completion:^(BOOL finished) {
            [_firstBtn setSelected:NO];
            [_secondBtn setSelected:NO];
            [_thirdBtn setSelected:YES];
        }];
    }];

    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.3f];
}

-(void)sendResponse
{
    [self hideFilterView];
    
    if ([_delegateee respondsToSelector:@selector(categoryListFilterViewClickWithIndex:)]) {
        [_delegateee categoryListFilterViewClickWithIndex:_didSelectIndex];
    }
}



@end
