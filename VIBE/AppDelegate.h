//
//  AppDelegate.h
//  VIBE
//
//  Created by Li Haii on 16/7/17.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VibeViewController.h"
#import "LCNavigationController.h"
#import "RootViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    RootViewController  *_rootVC;
}

+(AppDelegate *)sharedAppDelegate;

@property (strong, nonatomic) RootViewController  *rootVC;
@property (strong, nonatomic) UIWindow *window;

-(UIViewController *)getCurrentVC;

@end

