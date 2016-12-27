//
//  DiscoverHotTagView.m
//  VIBE
//
//  Created by Li Haii on 16/10/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "DiscoverHotTagView.h"

@implementation DiscoverHotTagView

-(id)initWithFrame:(CGRect)frame AndIndex:(NSInteger )index
{
    self = [super initWithFrame:frame];
    
    if (self) {

        float width = frame.size.width;
        float height = frame.size.height;
        

        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [_backView.layer setCornerRadius:1.0f];
        [_backView.layer setMasksToBounds:YES];
        [self addSubview:_backView];
        
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        [_imgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_imgView];
        
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        
        UIColor * colorrrr1;
        UIColor * colorrrr2;
        
        if (index ==0) {
            colorrrr1 = RGBA(87, 80, 241, 50);
            colorrrr2 = RGBA(124, 39, 227, 60);
        }
        if (index ==1) {
            colorrrr1 = RGBA(243, 219, 109, 60);
            colorrrr2 = RGBA(243, 81, 8, 70);
        }
        if (index ==2) {
            colorrrr1 = RGBA(67, 203, 242, 60);
            colorrrr2 = RGBA(44, 250, 131, 70);
        }
        if (index ==3) {
            colorrrr1 = RGBA(181, 245, 89, 60);
            colorrrr2 = RGBA(231, 225, 14, 75);
        }
        if (index ==4) {
            colorrrr1 = RGBA(7, 247, 240, 60);
            colorrrr2 = RGBA(7, 142, 247, 70);
        }
        if (index ==5) {
            colorrrr1 = RGBA(226, 87, 233, 60);
            colorrrr2 = RGBA(246, 43, 43, 70);
        }
        
        CAGradientLayer * tagViewLayer = [CAGradientLayer layer];
        tagViewLayer.frame = CGRectMake(0, 0, _maskView.frame.size.width, _maskView.frame.size.height);
        tagViewLayer.startPoint = CGPointMake(0, 0);
        tagViewLayer.endPoint = CGPointMake(1.0, 1.0);
        tagViewLayer.colors = @[
                                (id)colorrrr1.CGColor,
                                (id)colorrrr2.CGColor,
                                ];
        [_maskView.layer addSublayer:tagViewLayer];
        [_backView addSubview:_maskView];
        
        _tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (height -20)/2, width, 20)];
        [_tagLabel setTextAlignment:NSTextAlignmentCenter];
        [_tagLabel setTextColor:[UIColor whiteColor]];
        [_tagLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:12]];
        _tagLabel.layer.shadowColor = RGBA(106, 106, 106, 80).CGColor;
        _tagLabel.layer.shadowOffset = CGSizeMake(2,2);
        _tagLabel.layer.shadowOpacity = 0.5;
        _tagLabel.layer.shadowRadius = 4;
        [_backView addSubview:_tagLabel];
        
    }
    
    return self;
}


-(void)setDiscoverHotTagViewWithModal:(DiscoverHotTagModal *)modal
{
    [_imgView sd_setImageWithURL:[NSURL URLWithString:modal.discoverHotTagImgUrl] placeholderImage:nil];
    [_tagLabel setText:modal.discoverHotTagTitle];
}


@end
