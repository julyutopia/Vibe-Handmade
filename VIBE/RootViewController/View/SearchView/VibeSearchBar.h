//
//  VibeSearchBar.h
//  VIBE
//
//  Created by Li Haii on 2017/1/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VibeSearchBarDelegate;

@interface VibeSearchBar : UIView<UITextFieldDelegate>
{
    float             _searchBarWidth;
    float             _searchBarHeight;
    
    float             _searchTextFieldWidth;
    
    UIView          * _searchBarBackView;
    
//    UIImageView     * _searchBtnImgView;

    UIImageView     * _searchBarIconImgView;
    UITextField     * _searchBarTextField;
    UIButton        * _searchBarClearBtn;
}

@property (weak, nonatomic) id<VibeSearchBarDelegate> delegateee;

-(void)showSearchBar;
-(void)hideSearchBar;

-(void)resignSearchTextField;

@end

@protocol VibeSearchBarDelegate <NSObject>

-(void)searchBarDidSearch:(NSString *)searchKeyword;

@end




