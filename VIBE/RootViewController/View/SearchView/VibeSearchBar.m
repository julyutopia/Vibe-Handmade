//
//  VibeSearchBar.m
//  VIBE
//
//  Created by Li Haii on 2017/1/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeSearchBar.h"

@implementation VibeSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _searchBarWidth = frame.size.width;
        _searchBarHeight = frame.size.height;
        
        _searchTextFieldWidth = _searchBarWidth -28 -30;
        
        _searchBarBackView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2, 0, 0, _searchBarHeight)];
        [_searchBarBackView setBackgroundColor:RGBA(248, 248, 248, 90)];
        [_searchBarBackView.layer setCornerRadius:4.0f];
        [_searchBarBackView.layer setMasksToBounds:YES];
        [_searchBarBackView setAlpha:0.0f];
        [self addSubview:_searchBarBackView];
        
        
        _searchBarIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (_searchBarHeight -13)/2, 13, 13)];
        [_searchBarIconImgView setImage:[UIImage imageNamed:@"Search_Placeholder"]];
        [_searchBarIconImgView setAlpha:0.0f];
        [self addSubview:_searchBarIconImgView];
        
        
        _searchBarTextField = [[UITextField alloc]initWithFrame:CGRectMake(28, 0, _searchBarWidth -28 *2, _searchBarHeight)];
        [_searchBarTextField setBackgroundColor:[UIColor clearColor]];
        [_searchBarTextField setTextAlignment:NSTextAlignmentLeft];
        [_searchBarTextField setTextColor:DefaultQYTextColor80];
        [_searchBarTextField setFont:[UIFont fontWithName:Default_Font size:14]];
        _searchBarTextField.placeholder = @"输入搜索关键字";
        [_searchBarTextField setValue:DefaultQYTextColor30 forKeyPath:@"_placeholderLabel.textColor"];
        [_searchBarTextField setValue:[UIFont fontWithName:Default_Font size:14] forKeyPath:@"_placeholderLabel.font"];
        [_searchBarTextField setAlpha:0.0f];
        [_searchBarTextField setReturnKeyType:UIReturnKeySearch];
        [_searchBarTextField setDelegate:self];
        [_searchBarTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_searchBarTextField];
        
        _searchBarClearBtn = [[UIButton alloc]initWithFrame:CGRectMake(_searchBarWidth -25, (_searchBarHeight -20)/2, 20, 20)];
        [_searchBarClearBtn setBackgroundImage:[UIImage imageNamed:@"Search_Delete"] forState:UIControlStateNormal];
        [_searchBarClearBtn setAlpha:0.0f];
        [_searchBarClearBtn addTarget:self action:@selector(searchBarClearBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_searchBarClearBtn];
    }
    return self;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
     NSInteger textLength = textField.text.length;
    
    if (textLength == 0) {
        return NO;
    }
    else{
        if ([_delegateee respondsToSelector:@selector(searchBarDidSearch:)]) {
            
            [self hideClearBtn];
            [_delegateee searchBarDidSearch:textField.text];
        }
    }
    
    return YES;
}


-(void)textFieldDidChange:(UITextField *)textField
{
    if ([textField isEqual:_searchBarTextField]) {
        
        NSInteger textLength = textField.text.length;
        
        if (textLength == 0) {
            [self hideClearBtn];
        }
        else{
            [self showClearBtn];
        }
    }
}


-(void)searchBarClearBtnClicked
{
    [_searchBarTextField setText:@""];
    [self hideClearBtn];
}


-(void)showSearchBar
{
    [UIView animateWithDuration:0.2f animations:^{
        
        [_searchBarBackView setAlpha:1.0f];
        [_searchBarBackView setFrame:CGRectMake(0, 0, _searchBarWidth, _searchBarHeight)];
        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1f animations:^{
        
            [_searchBarIconImgView setAlpha:1.0f];
        
        } completion:^(BOOL finished) {
            
            [_searchBarTextField setAlpha:1.0f];
            [_searchBarTextField becomeFirstResponder];
            
        }];
    }];
}


-(void)hideSearchBar
{
    [self hideClearBtn];
    
    [_searchBarIconImgView setAlpha:0.0f];
    
    [_searchBarTextField setAlpha:0.0f];
    [_searchBarTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.6f animations:^{
        
        [_searchBarBackView setAlpha:0.0f];
        [_searchBarBackView setFrame:CGRectMake(kScreenWidth/2, 0, 0, _searchBarHeight)];
        
    }completion:^(BOOL finished) {
        //隐藏清空按钮
        [self searchBarClearBtnClicked];
    }];
}



-(void)hideClearBtn
{
    [UIView animateWithDuration:0.3f animations:^{
        [_searchBarClearBtn setAlpha:0.0f];
    }];
}

-(void)showClearBtn
{
    [UIView animateWithDuration:0.3f animations:^{
        [_searchBarClearBtn setAlpha:1.0f];
    }];
}


@end
