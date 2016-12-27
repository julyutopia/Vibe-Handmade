//
//  VibeTopicModal.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeTopicModal.h"

@implementation VibeTopicModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"             : @"topicTitle",
                                                       @"img"               : @"topicImgURL",
                                                       @"open_type"         : @"topicType",
                                                       @"id"                : @"topicID",
                                                       @"topic_tags"        : @"topicTagsArray",
                                                       @"look_count"        : @"topicLookedNumber",
                                                       @"favor_count"       : @"topicFavorNumber",
                                                       @"user_Favor"        :@"topicIsUserFavored",
                                                       @"detail_Info"       :@"topicDetailInfoArray",
                                                       @"related_Products"  :@"topicRelatedProductArray"
                                                       }
            ];
}

@end
