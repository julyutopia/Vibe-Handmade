//
//  BasicViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/5.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

@synthesize navigationView = _navigationView;
@synthesize leftBtn = _leftBtn;
@synthesize rightBtn = _rightBtn;


-(instancetype)init
{
    self = [super init];
    if (self)
    {
    
    }
    
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.lcNavigationController.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.backView setBackgroundColor:DefaultWhite];
    [self.view addSubview:self.backView];

    
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, Navi_View_Height)];
    [self.navigationView setBackgroundColor:RGBA(255, 255, 255, 95)];
    [self.navigationView.layer setMasksToBounds:YES];
    [self.view addSubview:self.navigationView];
    
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.naviBlurView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, Navi_View_Height)];
    [self.naviBlurView setEffect:blurEffect];
    [self.view addSubview:self.naviBlurView];

    
    self.navigationLineView = [[UIView alloc]initWithFrame:CGRectMake(0, Navi_View_Height -1, kScreenWidth, 1)];
    [self.navigationLineView setHidden:YES];
    [self.navigationLineView  setBackgroundColor:RGBA(72, 72, 72, 10)];
    [self.view addSubview:self.navigationLineView];
    
    
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(22, 33, 25, 25)];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_Hight_Light"] forState:UIControlStateHighlighted];
    [self.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    
    if (self.isPopUp) {
        [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_White_Normal"] forState:UIControlStateNormal];
        [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_White_Press"] forState:UIControlStateHighlighted];
    }
    
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -22 -25, 33, 25, 25)];
    [self.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn setHidden:YES];
    [self.view addSubview:self.rightBtn];
    
}



-(void)leftBtnClicked:(UIButton *)btn
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


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
