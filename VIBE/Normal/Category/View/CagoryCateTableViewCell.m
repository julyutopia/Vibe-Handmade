//
//  CagoryCateTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/10.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CagoryCateTableViewCell.h"

@implementation CagoryCateTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float imgWidth = (kScreenWidth -30)/3;
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _backView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backView setAlpha:0.3];
        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30,imgWidth)];
        [self addSubview:_backView];
        
        
        _leftView = [[UIView alloc]initWithFrame:CGRectMake(15 , 0, imgWidth, imgWidth)];
        [_leftView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_leftView];
  
        _centerView = [[UIView alloc]initWithFrame:CGRectMake(15 +imgWidth, 0, imgWidth, imgWidth)];
        [_centerView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_centerView];
        
        _rightView = [[UIView alloc]initWithFrame:CGRectMake( 15 +imgWidth *2, 0, imgWidth, imgWidth)];
        [_rightView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_rightView];
        
        
        CGRect frameee = CGRectMake(15 , 15, imgWidth -30, imgWidth -30);
        
        _leftCategoryImgView = [[GLImageView alloc]initWithFrame:frameee];
        [_leftCategoryImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_leftView addSubview:_leftCategoryImgView];
        
        _centerCategoryImgView = [[GLImageView alloc]initWithFrame:frameee];
        [_centerCategoryImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_centerView addSubview:_centerCategoryImgView];
        
        _rightCategoryImgView = [[GLImageView alloc]initWithFrame:frameee];
        [_rightCategoryImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_rightView addSubview:_rightCategoryImgView];
        
        
        [_leftCategoryImgView addTarget:self action:@selector(categoryCellTapLeft) forControlEvents:UIControlEventTouchUpInside];
        [_centerCategoryImgView addTarget:self action:@selector(categoryCellTapCenter) forControlEvents:UIControlEventTouchUpInside];
        [_rightCategoryImgView addTarget:self action:@selector(categoryCellTapRight) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}


-(void)setCategoryCellWithFirstCategory:(CategoryModal *)firstModal AndSecondCategory:(CategoryModal *)secondModal AndThirdCategory:(CategoryModal *)thirdModal
{
    
    [_leftCategoryImgView setTag:7000 + [firstModal.categoryID integerValue]];
    [_centerCategoryImgView setTag:7000 + [secondModal.categoryID integerValue]];
    [_rightCategoryImgView setTag:7000 + [thirdModal.categoryID integerValue]];
    
    [_leftCategoryImgView sd_setImageWithURL:[NSURL URLWithString:firstModal.categoryIconUrl] placeholderImage:nil];
    [_centerCategoryImgView sd_setImageWithURL:[NSURL URLWithString:secondModal.categoryIconUrl] placeholderImage:nil];
    [_rightCategoryImgView sd_setImageWithURL:[NSURL URLWithString:thirdModal.categoryIconUrl] placeholderImage:nil];
}


- (void)categoryCellTapLeft
{
    NSInteger tagIndex = _leftCategoryImgView.tag -7000;
    if ([_delegate respondsToSelector:@selector(categoryCellTapWithModalID:)]) {
        [_delegate categoryCellTapWithModalID:tagIndex];
    }
}

- (void)categoryCellTapCenter
{
    NSInteger tagIndex = _centerCategoryImgView.tag -7000;
    if ([_delegate respondsToSelector:@selector(categoryCellTapWithModalID:)]) {
        [_delegate categoryCellTapWithModalID:tagIndex];
    }
}

- (void)categoryCellTapRight
{
    NSInteger tagIndex = _rightCategoryImgView.tag -7000;
    if ([_delegate respondsToSelector:@selector(categoryCellTapWithModalID:)]) {
        [_delegate categoryCellTapWithModalID:tagIndex];
    }
}

@end






