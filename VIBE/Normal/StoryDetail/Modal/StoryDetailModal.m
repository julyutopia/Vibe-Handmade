//
//  StoryDetail.m
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "StoryDetailModal.h"

@implementation StoryDetailModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       
                                                       @"id"            : @"storyID",
                                                       @"story_title"   : @"sotryTitle",
                                                       @"story_time"    : @"timeStampTitle",
                                                       @"story_cover"   : @"storyCoverImgURL",
                                                       @"story_favored" : @"storyIsUserFavored",
                                                       @"story_detail"  : @"storyDetailInfoArray",
                                                       @"story_bottom"  : @"storyDetailBottomInfoArray",
                                                       
                                                       }
            ];
    
}


@end
