//
//  VibeViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

@interface VibeViewController ()

@end

@implementation VibeViewController

@synthesize topNavView          = _topNavView;
@synthesize naviBarType         = _naviBarType;
@synthesize backBtn             = _backBtn;
@synthesize rightButton         = _rightButton;
@synthesize titleLabel          = _titleLabel;
@synthesize titleImgView        = _titleImgView;
@synthesize line                = _line;
@synthesize isPopUp             = _isPopUp;


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.isPopUp = NO;
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.lcNavigationController.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];

    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = DefaultBackgroundColor;
    
    //导航栏
    UIBlurEffect * naviBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * naviBlurView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height_headerview)];
    [naviBlurView setEffect:naviBlurEffect];

    self.topNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height_headerview)];
    [self.topNavView setBackgroundColor:RGBA(255, 255, 255, 85)];
    [self.view addSubview:self.topNavView];
    [self.topNavView addSubview:naviBlurView];
    
    
    self.line = [[UIView alloc] initWithFrame:CGRectMake(0, height_headerview - 0.5, kScreenWidth, 0.5)];
    self.line.backgroundColor = RGBA(31, 32, 35, 20);
    [self.topNavView addSubview:self.line];

    
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 30, 30)];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back_Black"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backBtn];
 
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake( kScreenWidth -35, 27, 30, 30)];
    [self.rightButton setBackgroundColor:[UIColor clearColor]];
    [self.rightButton setHidden:YES];
    [self.rightButton addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rightButton];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake( 50, height_headerview - 35, kScreenWidth -100, 30)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont fontWithName:Default_Font_Middle size:18];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor     = DefaultQYTextColor90;
    [self.view addSubview:self.titleLabel];

    self.titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth -107)/2, (44 -30)/2 +20, 107, 30)];
    [self.titleImgView setBackgroundColor:[UIColor clearColor]];
    [self.titleImgView setImage:[UIImage imageNamed:@"VIBE_Icon_Green"]];
    [self.titleImgView setHidden:YES];
    [self.view addSubview:self.titleImgView];
}


-(void)backBtnClicked:(id)sender
{
    if (self.isPopUp == NO) {
        if (self.lcNavigationController) {
            [self.lcNavigationController popViewController];
        }
    }
    
    else
    {
        if (self.lcNavigationController) {
            [self.lcNavigationController dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
    }
   
}

-(void)rightBtnClicked:(id)sender
{

}


-(BOOL)checkIsLogIn
{
    BOOL isLogIn = NO;
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isLogIn"]) {
        isLogIn = YES;
    }
    return isLogIn;
}


-(void)setIsWideNaviView:(BOOL)isWideNaviView
{
    if (isWideNaviView == YES) {
     
        [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, Wide_Navi_View_Height)];
        [self.line setFrame:CGRectMake(0, Wide_Navi_View_Height - 0.5, kScreenWidth, 0.5)];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end









