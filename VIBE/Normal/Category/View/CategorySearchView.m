//
//  CategorySearchView.m
//  VIBE
//
//  Created by Li Haii on 16/8/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategorySearchView.h"

@implementation CategorySearchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.isSearchBarActived = NO;
        _searchBarWidth = frame.size.width;
        [self setUp];
    }
    return self;
}


-(void)setUp
{
    self.searchBackBtn = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0, _searchBarWidth, 24)];
    [self.searchBackBtn setBackgroundColor:[UIColor clearColor]];
    [self.searchBackBtn.layer setCornerRadius:4.0f];
    [self.searchBackBtn.layer setMasksToBounds:YES];
    [self.searchBackBtn addTarget:self action:@selector(didTapSearchBackView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.searchBackBtn];
 
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    self.searchBackView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    [self.searchBackView setAlpha:0.5];
    [self.searchBackView setFrame:CGRectMake(0, 0, _searchBarWidth, 24)];
    [self.searchBackView.layer setBorderWidth:1.0f];
    [self.searchBackView.layer setBorderColor:RGBA(232, 232, 232, 60).CGColor];
    [self.searchBackView.layer setCornerRadius:4];
    [self.searchBackView.layer setMasksToBounds:YES];
    [self.searchBackView setUserInteractionEnabled:NO];
    [self.searchBackBtn addSubview:self.searchBackView];
    
    NSString * placeHolder = @"搜索";
    CGSize placeHolderSize = [placeHolder getSizeWithLimitSize:CGSizeMake(200, 24) withFont:[UIFont fontWithName:Default_Font size:13]];
    
    float placeHolderWidth = placeHolderSize.width;
    float searchIconWidth = 13;
    float gappp = 4;
    
    float leftOrigin = (_searchBarWidth -searchIconWidth - placeHolderWidth -gappp)/2;
    
    self.searchPlaceHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftOrigin +searchIconWidth +gappp, 1, placeHolderWidth, 24)];
    [self.searchPlaceHolderLabel setBackgroundColor:[UIColor clearColor]];
    [self.searchPlaceHolderLabel setTextColor:RGB(232, 232, 232)];
    [self.searchPlaceHolderLabel setTextAlignment:NSTextAlignmentCenter];
    [self.searchPlaceHolderLabel setFont:[UIFont fontWithName:Default_Font size:13]];
    [self.searchPlaceHolderLabel setText:placeHolder];
    [self.searchBackBtn addSubview:self.searchPlaceHolderLabel];
    
    self.searchIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(leftOrigin, (24-searchIconWidth)/2, searchIconWidth, searchIconWidth)];
    [self.searchIconImgView setBackgroundColor:[UIColor clearColor]];
    [self.searchIconImgView setImage:[UIImage imageNamed:@"SearchBar_Icon"]];
    [self.searchBackBtn addSubview:self.searchIconImgView];
    
}


-(void)setSearchPlaceHolderString:(NSString *)searchPlaceHolderString
{
    if (searchPlaceHolderString && searchPlaceHolderString.length) {
        
        NSString * placeHolder = searchPlaceHolderString;
        CGSize placeHolderSize = [placeHolder getSizeWithLimitSize:CGSizeMake(200, 24) withFont:[UIFont fontWithName:Default_Font size:13]];
        
        float placeHolderWidth = placeHolderSize.width;
        float searchIconWidth = 13;
        float gappp = 4;
        
        float leftOrigin = (_searchBarWidth -searchIconWidth - placeHolderWidth -gappp)/2;
        [self.searchPlaceHolderLabel setFrame:CGRectMake(leftOrigin +searchIconWidth +gappp, 1, placeHolderWidth, 24)];
        
        [self.searchPlaceHolderLabel setText:placeHolder];
        [self.searchIconImgView setFrame:CGRectMake(leftOrigin, (24-searchIconWidth)/2, searchIconWidth, searchIconWidth)];
    }
}


-(void)didTapSearchBackView
{
    [self setSearchBarActived];
    
    if ([_delegate respondsToSelector:@selector(didTapSearchView)]) {
        [_delegate didTapSearchView];
    }
    
}


//激活搜索框
-(void)setSearchBarActived
{
    self.isSearchBarActived = YES;
}

//关闭搜索框
-(void)setSearchBarClosed
{
    self.isSearchBarActived = NO;
}




@end
