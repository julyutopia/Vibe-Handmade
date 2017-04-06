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
#import "MainViewController.h"

#import "RecommandTopViewModal.h"
#import "RecommandCateModal.h"
#import "RecommandItemModal.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MainViewController  *_mainVC;
}

+(AppDelegate *)sharedAppDelegate;

@property (strong, nonatomic) MainViewController  *mainVC;
@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) NSMutableArray        * recommandTopArray;
@property (strong, nonatomic) NSMutableArray        * recommandCateArray;
@property (strong, nonatomic) RecommandItemModal    * recommnadPickModal;
@property (strong, nonatomic) NSMutableArray        * recommandItemsArray;



-(UIViewController *)getCurrentVC;

@end

