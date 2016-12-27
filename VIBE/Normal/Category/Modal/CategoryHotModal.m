//
//  CategoryHotModal.m
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryHotModal.h"

@implementation CategoryHotModal


+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"title"         : @"categoryHotTitle",
                                                       @"id"           : @"categoryHotID",
                                                       @"open_type"           : @"categoryHotOpenType",
                                                       @"image"     : @"categoryHotImgURL",
                                                       @"link"            : @"categoryLinkURL",
                                                       
                                                       }
            ];
}



@end


















