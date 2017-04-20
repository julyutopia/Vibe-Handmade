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


#import "MineProfileModal.h"

#import "RecommandTopViewModal.h"
#import "RecommandCateModal.h"
#import "RecommandItemModal.h"

#import "DiscoverTagModal.h"
#import "DiscoverTopicModal.h"
#import "DiscoverStoryModal.h"

#import "CreatorCoverModal.h"

#import "ItemDetailModal.h"
#import "TopicDetailModal.h"
#import "StoryDetailModal.h"
#import "CreatorDetailModal.h"


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

@property (strong, nonatomic) NSMutableArray        * discoverTagsArray;
@property (strong, nonatomic) NSMutableArray        * discoverTopicsArray;
@property (strong, nonatomic) NSMutableArray        * discoverStorysArray;

@property (strong, nonatomic) NSMutableArray        * creatorsArray;

@property (strong, nonatomic) NSMutableArray        * searchResultArray;

@property (strong, nonatomic) ItemDetailModal       * itemDetailModal;

@property (strong, nonatomic) TopicDetailModal      * topicDetailModal;

@property (strong, nonatomic) StoryDetailModal      * storyDetailModal;

@property (strong, nonatomic) CreatorDetailModal    * creatorDetailModal;


-(UIViewController *)getCurrentVC;

@end

