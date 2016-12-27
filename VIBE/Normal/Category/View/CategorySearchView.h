//
//  CategorySearchView.h
//  VIBE
//
//  Created by Li Haii on 16/8/9.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategorySearchViewDelegate;


@interface CategorySearchView : UIView
{
    float _searchBarWidth;
}

@property (weak, nonatomic) id<CategorySearchViewDelegate> delegate;

@property(retain, nonatomic)GLImageView * searchBackBtn;
@property(retain, nonatomic)UIView * searchBackView;
@property(retain, nonatomic)UIImageView * searchIconImgView;
@property(retain, nonatomic)UILabel * searchPlaceHolderLabel;

@property(retain, nonatomic)NSString * searchPlaceHolderString;

@property(assign, nonatomic)BOOL isSearchBarActived;

//激活搜索框
-(void)setSearchBarActived;
//关闭搜索框
-(void)setSearchBarClosed;

@end


@protocol CategorySearchViewDelegate <NSObject>

-(void)didTapSearchView;

@end