//
//  CategoryListFilterView.m
//  VIBE
//
//  Created by Li Haii on 2016/12/27.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryListFilterView.h"

@implementation CategoryListFilterView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setHidden:YES];
        
        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        
        _filterBackView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        [_filterBackView setEffect:blurEffect];
        [self addSubview:_filterBackView];
        
        
        float btnWidth = 217/2;
        float btnHeight = 25;
        
        
        _firstBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth -btnWidth)/2, Navi_View_Height -btnHeight, btnWidth, btnHeight)];
        [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Selected"] forState:UIControlStateNormal];
        [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Selected_Press"] forState:UIControlStateHighlighted];
        [_firstBtn setAlpha:0.0f];
        [_firstBtn addTarget:self action:@selector(didClickFirstBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_firstBtn];
        
        
        _secondBtn = [[UIButton alloc]initWithFrame:CGRectMake( (kScreenWidth -btnWidth)/2, Navi_View_Height , btnWidth, btnHeight)];
        [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal"] forState:UIControlStateNormal];
        [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal_Press"] forState:UIControlStateHighlighted];
        [_secondBtn setAlpha:0.0f];
        [_secondBtn addTarget:self action:@selector(didClickSecondBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_secondBtn];

        _thirdBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth -btnWidth)/2, Navi_View_Height +btnHeight, btnWidth, btnHeight)];
        [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal"] forState:UIControlStateNormal];
        [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal_Press"] forState:UIControlStateHighlighted];
        [_thirdBtn setAlpha:0.0f];
        [_thirdBtn addTarget:self action:@selector(didClickThirdBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_filterBackView addSubview:_thirdBtn];
        
        _didSelectIndex = 0;
        
    }
    return self;
}


-(void)showFilterView
{
    [self setHidden:NO];

    [UIView animateWithDuration:0.35f animations:^{
        
        [_filterBackView setAlpha:1.0f];
        
        [_filterBackView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
        float btnWidth = 217/2;
        float btnHeight = 25;
        [_firstBtn setFrame:CGRectMake((kScreenWidth -btnWidth)/2, kScreenHeight/2 -50 -btnHeight, btnWidth, btnHeight)];
        [_secondBtn setFrame:CGRectMake( (kScreenWidth -btnWidth)/2, (kScreenHeight -btnHeight)/2, btnWidth, btnHeight)];
        [_thirdBtn setFrame:CGRectMake((kScreenWidth -btnWidth)/2, kScreenHeight/2 +50, btnWidth, btnHeight)];
        
        [_firstBtn setAlpha:1.0f];
        [_secondBtn setAlpha:1.0f];
        [_thirdBtn setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        self.isFilterViewShow = YES;
    }];
}


-(void)hideFilterView
{
    if ([_delegateee respondsToSelector:@selector(categoryListFilterViewWillHide)]) {
        [_delegateee categoryListFilterViewWillHide];
    }
    
    [UIView animateWithDuration:0.35f animations:^{
        
        [_filterBackView setAlpha:0.5f];
        
        [_filterBackView setFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        
        float btnWidth = 217/2;
        float btnHeight = 25;
        
        [_firstBtn setFrame:CGRectMake((kScreenWidth -btnWidth)/2, Navi_View_Height -btnHeight, btnWidth, btnHeight)];
        [_secondBtn setFrame:CGRectMake( (kScreenWidth -btnWidth)/2, Navi_View_Height, btnWidth, btnHeight)];
        [_thirdBtn setFrame:CGRectMake((kScreenWidth -btnWidth)/2, Navi_View_Height +btnHeight, btnWidth, btnHeight)];
        
        [_firstBtn setAlpha:0.0f];
        [_secondBtn setAlpha:0.0f];
        [_thirdBtn setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        self.isFilterViewShow = NO;
        
        if ([_delegateee respondsToSelector:@selector(categoryListFilrerViewDidHide)]) {
            [_delegateee categoryListFilrerViewDidHide];
        }
        
        [self setHidden:YES];
    }];
}



#pragma mark 点击按钮
-(void)didClickFirstBtn:(UIButton *)btn
{
    if (_didSelectIndex == 0) {
        return;
    }
    
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Selected"] forState:UIControlStateNormal];
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Selected_Press"] forState:UIControlStateHighlighted];
    
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal"] forState:UIControlStateNormal];
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal_Press"] forState:UIControlStateHighlighted];
    
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal"] forState:UIControlStateNormal];
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal_Press"] forState:UIControlStateHighlighted];
    
    _didSelectIndex = 0;
    
    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.0f];
}

-(void)didClickSecondBtn:(UIButton *)btn
{
    if (_didSelectIndex == 1) {
        return;
    }
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Nomal"] forState:UIControlStateNormal];
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Normal_Press"] forState:UIControlStateHighlighted];
    
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Selected"] forState:UIControlStateNormal];
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Selected_Press"] forState:UIControlStateHighlighted];
    
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal"] forState:UIControlStateNormal];
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Normal_Press"] forState:UIControlStateHighlighted];
    
    _didSelectIndex = 1;
    
    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.0f];
}

-(void)didClickThirdBtn:(UIButton *)btn
{
    if (_didSelectIndex == 2) {
        return;
    }
    
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Nomal"] forState:UIControlStateNormal];
    [_firstBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Default_Normal_Press"] forState:UIControlStateHighlighted];
    
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal"] forState:UIControlStateNormal];
    [_secondBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Price_Normal_Press"] forState:UIControlStateHighlighted];
    
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Selected"] forState:UIControlStateNormal];
    [_thirdBtn setBackgroundImage:[UIImage imageNamed:@"Cate_Filter_Hot_Selected_Press"] forState:UIControlStateHighlighted];
    
    _didSelectIndex = 2;
    
    [self performSelector:@selector(sendResponse) withObject:nil afterDelay:0.0f];
}


-(void)sendResponse
{
    [self hideFilterView];
    
    if ([_delegateee respondsToSelector:@selector(categoryListFilterViewClickWithIndex:)]) {
        [_delegateee categoryListFilterViewClickWithIndex:_didSelectIndex];
    }
}



@end
