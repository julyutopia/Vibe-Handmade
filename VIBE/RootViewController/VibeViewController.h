//
//  VibeViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//


//导航栏样式
typedef enum
{
    white_Navi = 0,           //白色
    Green_Navi = 1,           //绿色
    Clear_Navi = 2,           //不要导航栏
} ViewController_Navi_Type;


@interface VibeViewController : UIViewController

@property (strong, nonatomic) UIVisualEffectView    * naviBlurView;
@property (strong, nonatomic) UIView                * topNavView;

@property (nonatomic, assign) NSInteger             * naviBarType;

@property (strong, nonatomic) UIButton              * backBtn;
@property (nonatomic, strong) UIButton              * rightButton;

@property (strong, nonatomic) UILabel               * titleLabel;
@property (strong, nonatomic) UIImageView           * titleImgView;

@property (strong, nonatomic) UIView                * line;
@property (nonatomic, assign) BOOL                  isPopUp;//判断是否是升起

@property (nonatomic, assign) BOOL                  isWideNaviView;

-(void)backBtnClicked:(id)sender;
-(void)rightBtnClicked:(id)sender;

-(BOOL)checkIsLogIn;

@end
