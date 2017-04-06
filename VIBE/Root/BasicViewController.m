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
    [self.navigationView setBackgroundColor:DefaultWhite];
    [self.view addSubview:self.navigationView];
    
    
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(55, 70, 30, 30)];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Back_Hight_Light"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    
    
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -55 -30, 70, 30, 30)];
    [self.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn setHidden:YES];
    [self.view addSubview:self.rightBtn];
    
}






-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
