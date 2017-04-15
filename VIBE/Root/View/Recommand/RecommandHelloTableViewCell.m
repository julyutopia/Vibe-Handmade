//
//  RecommandHelloTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandHelloTableViewCell.h"

@implementation RecommandHelloTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _helloLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, kScreenWidth -50, 16)];
        [_helloLabel setTextAlignment:NSTextAlignmentLeft];
        [_helloLabel setTextColor:Default_Text_Dark_Color];
        [_helloLabel setFont:[VibeFont fontWithName:Font_Chinese_Regular size:14]];
        [self.contentView addSubview:_helloLabel];
    }
    
    
    return self;
    
}

-(void)setHelloTableCellInfo
{
    //用户登录时显示，未登录不显示
    if ([[VibeAppTool sharedInstance] isUserLogIn])
    {
        [_helloLabel setHidden:NO];
    
        NSString * userName = [VibeAppTool sharedInstance].userInfoModal.userName;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
        [formatter setDateFormat:@"HH"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
        NSString *currentTime = [formatter stringFromDate:[NSDate date]];//将NSDate  ＊对象 转化为 NSString ＊对象。
        
        NSInteger hourTime = [currentTime integerValue];
                
        NSString * timeStamp;
                
        if (hourTime >=18 || hourTime <4) {
            timeStamp = @"晚上好。";
        }
        if (hourTime >=4 && hourTime < 11) {
            timeStamp = @"早上好。";
        }
        if (hourTime >= 11 && hourTime <13) {
            timeStamp = @"中午好。";
        }
        if (hourTime >= 13 && hourTime <18) {
            timeStamp = @"下午好。";
        }
        
        [_helloLabel setText:[NSString stringWithFormat:@"Hey! %@,%@",userName,timeStamp]];
    }
    else{
        [_helloLabel setHidden:YES];
    }
    
}


@end
