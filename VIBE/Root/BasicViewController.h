//
//  BasicViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/5.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

@property (strong, nonatomic) UIView                * backView;//背景视图

@property (strong, nonatomic) UIView                * navigationView;//导航栏
@property (strong, nonatomic) UIButton              * leftBtn;//左边按钮
@property (strong, nonatomic) UIButton              * rightBtn;//右边按钮
@property (strong, nonatomic) UILabel               * titleLabel;//标题栏



-(void)leftBtnClicked:(id)sender;
-(void)rightBtnClicked:(id)sender;

@end
