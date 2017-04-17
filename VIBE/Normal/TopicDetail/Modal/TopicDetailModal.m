//
//  TopicDetailModal.m
//  VIBE
//
//  Created by Li Haii on 2017/4/15.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "TopicDetailModal.h"

@implementation TopicDetailModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"            : @"topicID",
                                                       @"topic_title"   : @"topicTitle",
                                                       @"topic_time"    : @"timeStampTitle",
                                                       @"topic_cover"   : @"topicCoverImgURL",
                                                       @"topic_favored" : @"topicIsUserFavored",
                                                       @"topic_detail"  : @"topicDetailInfoArray",
                                                       @"topic_bottom"  : @"topicDetailBottomInfoArray",
                                                       }
            ];
}



@end
