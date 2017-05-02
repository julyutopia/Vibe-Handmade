//
//  MineProfileModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineProfileModal.h"

@implementation MineProfileModal

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       
                                                       @"uid"               : @"userID",
                                                       @"avatar"            : @"userAvatarImgURL",
                                                       @"user_name"         : @"userName",
                                                       @"user_sign"         : @"userSignature",
                                                       @"following_count"   : @"userFollowingNumber",
                                                       @"followed_count"    : @"userFollowedNumber",
                                                       
                                                       }
            ];
}


@end
