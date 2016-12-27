//
//  RecommandTopicView.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandTopicView.h"

@implementation RecommandTopicView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _topicViewWidth = frame.size.width;
        _topicViewHeight = frame.size.height;
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _topicViewWidth, _topicViewHeight)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        _backImgView = [[UIImageView alloc]initWithFrame:_backView.frame];
        [_backImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backImgView.layer setMasksToBounds:YES];
        [self addSubview:_backImgView];
        
        UIView * _alphaView = [[UIView alloc]initWithFrame:_backView.frame];
        [_alphaView setBackgroundColor:RGBA(0, 0, 0, 60)];
        [_backImgView addSubview:_alphaView];
        
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _backBlurView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backBlurView setFrame:_backView.frame];
        [_backImgView addSubview:_backBlurView];
 
        
        _topicImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _topicViewWidth/3 *2, _topicViewHeight)];
        [_topicImgView setContentMode:UIViewContentModeScaleAspectFill];
        _topicImgView.layer.shadowColor = RGBA(68, 68, 68, 50).CGColor;//shadowColor阴影颜色
        _topicImgView.layer.shadowOffset = CGSizeMake(0,1);
        _topicImgView.layer.shadowOpacity = 0.2;
        _topicImgView.layer.shadowRadius = 12;
        [_backImgView addSubview:_topicImgView];

        
        _rightSideView = [[UIView alloc]initWithFrame:CGRectMake(_topicViewWidth/3 *2, 0, _topicViewWidth/3, _topicViewHeight)];
        [_rightSideView setBackgroundColor:[UIColor clearColor]];
        [_backImgView addSubview:_rightSideView];
        
      
        _topicTitleLabel = [[UILabel alloc]init];
        [_topicTitleLabel setTextColor:[UIColor whiteColor]];
        [_topicTitleLabel setFont:[VibeFont fontWithName:Default_Font_Bold size:16]];
        [_topicTitleLabel setNumberOfLines:0];
        _topicTitleLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _topicTitleLabel.layer.shadowOffset = CGSizeMake(0,3);
        _topicTitleLabel.layer.shadowOpacity = 0.6;
        _topicTitleLabel.layer.shadowRadius = 7;
        [_rightSideView addSubview:_topicTitleLabel];
        NSString * testString = @"测试看看";
        _singleTitleLineHeight = [testString getSizeWithLimitSize:CGSizeMake(_topicViewWidth/3 - 6*2, 30) withFont:_topicTitleLabel.font].height;
//        [_topicTitleLabel setFrame:CGRectMake(6, 6, _topicViewWidth/3 - 6*2, _singleTitleLineHeight * 3 +2)];
        
        
        //显示标签的视图
        _gradientTagView = [[GradientTagCloudView alloc]init];
        [_rightSideView addSubview:_gradientTagView];
        
        //显示阅读数&喜爱数
        _showInfoView = [[UIView alloc]initWithFrame:CGRectMake(6, _topicViewHeight - 2 -18, _topicViewWidth/3 - 6 *2, 18)];
        [_showInfoView setBackgroundColor:[UIColor clearColor]];
        [_rightSideView addSubview:_showInfoView];
        
        _lookIcon = [[UIImageView alloc]init];
        [_lookIcon setImage:[UIImage imageNamed:@"Topic_Look_Icon"]];
        [_showInfoView addSubview:_lookIcon];
        _lookLabel = [[UILabel alloc]init];
        [_lookLabel setTextAlignment:NSTextAlignmentLeft];
        [_lookLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_lookLabel setFont:[UIFont fontWithName:Default_Number_Font size:11]];
        _lookLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _lookLabel.layer.shadowOffset = CGSizeMake(0,2);
        _lookLabel.layer.shadowOpacity = 0.4;
        _lookLabel.layer.shadowRadius = 8;
        [_showInfoView addSubview:_lookLabel];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Topic_Favor_Icon"]];
        [_showInfoView addSubview:_favorIcon];
        _favorLabel = [[UILabel alloc]init];
        [_favorLabel setTextAlignment:NSTextAlignmentLeft];
        [_favorLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_favorLabel setFont:[UIFont fontWithName:Default_Number_Font size:11]];
        [_showInfoView addSubview:_favorLabel];
    }
    
    return self;
}


-(void)setTopicViewWithTopic:(VibeTopicModal *)modal
{
    //设置图片
    [_topicImgView sd_setImageWithURL:[NSURL URLWithString:modal.topicImgURL]
                     placeholderImage:nil
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                [_backImgView setImage:image];
    }];
    
    
    
    //设置标题
    NSString * titleName = modal.topicTitle;
    CGSize titleNameSize = [titleName getSizeWithLimitSize:CGSizeMake(_topicViewWidth/3 - 6*2, _singleTitleLineHeight *3 +5) withFont:_topicTitleLabel.font];
    [_topicTitleLabel setText:titleName];
    [_topicTitleLabel setFrame:CGRectMake(6, 6, _topicViewWidth/3 - 6*2, titleNameSize.height)];

    
    [_gradientTagView setFrame:CGRectMake(6,6 +titleNameSize.height +3, _topicViewWidth/3 - 6*2, _topicViewHeight -6 -titleNameSize.height -3 -20)];
    [_gradientTagView setGradientTagCloudWithMaxWidth:_topicViewWidth/3 - 6*2 MaxHeight:_topicViewHeight -6 -titleNameSize.height -3 -20 WithFont:[UIFont fontWithName:Default_Font_Middle size:11] AndTags:modal.topicTagsArray];
    
    //设置阅读&喜欢数
    NSString * lookCount = [NSString stringWithFormat:@"%@",modal.topicLookedNumber];
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.topicFavorNumber];
    
    float lookCountWidth = [lookCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:[UIFont fontWithName:Default_Number_Font size:11]].width;
    float favorCountWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:[UIFont fontWithName:Default_Number_Font size:11]].width;
    
    
    float showInfoWidth = _topicViewWidth/3 - 6 *2;
    
    [_favorLabel setFrame:CGRectMake(showInfoWidth -favorCountWidth, 0, favorCountWidth, 18)];
    [_favorLabel setText:favorCount];
    [_favorIcon setFrame:CGRectMake(showInfoWidth -favorCountWidth -3 -12, 3, 12, 12)];
 
    [_lookLabel setFrame:CGRectMake(showInfoWidth -favorCountWidth -3 -12 -6 -lookCountWidth, 0, lookCountWidth, 18)];
    [_lookLabel setText:lookCount];
    [_lookIcon setFrame:CGRectMake(showInfoWidth -favorCountWidth -3 -12 -6 -lookCountWidth -3 -12, 3, 12, 12)];
    
}





@end



