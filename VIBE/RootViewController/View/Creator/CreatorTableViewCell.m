//
//  CreatorTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CreatorTableViewCell.h"

@implementation CreatorTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _viewWidth = kScreenWidth -20;
        _viewHeight = _viewWidth/16 *9;
        
        
        _backView = [[GLImageView alloc]initWithFrame:CGRectMake(10, 0, _viewWidth,_viewHeight)];
        [_backView.layer setMasksToBounds:YES];
        [_backView.layer setCornerRadius:4];
        [_backView addTarget:self action:@selector(creatorCoverCellTap) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backView];

        
        _creatorImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        [_creatorImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backView addSubview:_creatorImgView];

        _gradientView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _viewHeight -_viewWidth/2, _viewWidth, _viewWidth/2)];
        UIImage * imageeee = [UIImage imageNamed:@"Gradien_Shadow"];
        [_gradientView setImage:imageeee];
        [_gradientView setAlpha:0.8f];
        [_backView addSubview:_gradientView];
        
        
        _creatorTitleLabel = [[UILabel alloc]init];
        [_creatorTitleLabel setTextColor:[UIColor whiteColor]];
        [_creatorTitleLabel setFont:[VibeFont fontWithName:Default_Font_Bold size:17]];
        [_creatorTitleLabel setNumberOfLines:0];
        _creatorTitleLabel.layer.shadowColor = RGBA(70, 70, 70, 70).CGColor;
        _creatorTitleLabel.layer.shadowOffset = CGSizeMake(0,3);
        _creatorTitleLabel.layer.shadowOpacity = 0.4;
        _creatorTitleLabel.layer.shadowRadius = 3;
        [_backView addSubview:_creatorTitleLabel];
    
        
        _creatorIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, _viewHeight -8 -15, 15, 15)];
        [_creatorIconImgView setImage:[UIImage imageNamed:@"Creator_Shop_Icon"]];
        [_backView addSubview:_creatorIconImgView];
        
        _creatorShopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 +15 +5, _viewHeight -8 -15, 200, 15)];
        [_creatorShopNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_creatorShopNameLabel setTextColor:[UIColor whiteColor]];
        [_creatorShopNameLabel setFont:[UIFont fontWithName:Default_Font size:13]];
        [_backView addSubview:_creatorShopNameLabel];
    
        
        //显示阅读数&喜爱数
        _showInfoView = [[UIView alloc]initWithFrame:CGRectMake(_viewWidth -120 -10, _viewHeight - 6 -18,120, 18)];
        [_showInfoView setBackgroundColor:[UIColor clearColor]];
        [_backView addSubview:_showInfoView];
        
        _lookIcon = [[UIImageView alloc]init];
        [_lookIcon setImage:[UIImage imageNamed:@"Topic_Look_Icon"]];
        [_showInfoView addSubview:_lookIcon];
        _lookLabel = [[UILabel alloc]init];
        [_lookLabel setTextAlignment:NSTextAlignmentLeft];
        [_lookLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_lookLabel setFont:[UIFont fontWithName:Default_Number_Font size:13]];
        _lookLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _lookLabel.layer.shadowOffset = CGSizeMake(0,2);
        _lookLabel.layer.shadowOpacity = 0.3;
        _lookLabel.layer.shadowRadius = 2;
        [_showInfoView addSubview:_lookLabel];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Topic_Favor_Icon"]];
        [_showInfoView addSubview:_favorIcon];
        _favorLabel = [[UILabel alloc]init];
        [_favorLabel setTextAlignment:NSTextAlignmentLeft];
        [_favorLabel setTextColor:RGBA(255, 255, 255, 90)];
        [_favorLabel setFont:[UIFont fontWithName:Default_Number_Font size:13]];
        _favorLabel.layer.shadowColor = RGBA(132, 132, 132, 50).CGColor;
        _favorLabel.layer.shadowOffset = CGSizeMake(0,2);
        _favorLabel.layer.shadowOpacity = 0.3;
        _favorLabel.layer.shadowRadius = 2;
        [_showInfoView addSubview:_favorLabel];
    }
    
    return self;
}


-(void)setCreatorCellWithModal:(CreatorCoverrrrModal *)modal WithIndex:(NSInteger)index
{
    _cellIndex = index;
    
    
    [_creatorImgView sd_setImageWithURL:[NSURL URLWithString:modal.creatorImgURL] placeholderImage:nil];

    NSString * creatorTitle = modal.creatorTitle;
    float titleSizeHeight = [creatorTitle getSizeWithLimitSize:CGSizeMake(_viewWidth -20, 50) withFont:_creatorTitleLabel.font].height;
    [_creatorTitleLabel setText:creatorTitle];
    [_creatorTitleLabel setFrame:CGRectMake(10, _viewHeight -28 -titleSizeHeight, _viewWidth -20, titleSizeHeight)];
    
    NSString * shopName = modal.creatorShopName;
    [_creatorShopNameLabel setText:shopName];
 
    NSString * lookCount = [NSString stringWithFormat:@"%@",modal.creatorLookedNumber];
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.creatorFavorNumber];

    float lookCountWidth = [lookCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorLabel.font].width;
    float favorCountWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 20) withFont:_favorLabel.font].width;
    
    float showInfoWidth = _showInfoView.frame.size.width;
    
    [_favorLabel setFrame:CGRectMake(showInfoWidth -favorCountWidth, 0, favorCountWidth, 18)];
    [_favorLabel setText:favorCount];
    [_favorIcon setFrame:CGRectMake(showInfoWidth -favorCountWidth -4 -14, 2, 14, 14)];
    
    [_lookLabel setFrame:CGRectMake(showInfoWidth -favorCountWidth -4 -14 - 8 -lookCountWidth, 0, lookCountWidth, 18)];
    [_lookLabel setText:lookCount];
    [_lookIcon setFrame:CGRectMake(showInfoWidth -favorCountWidth -4 -14 - 8 -lookCountWidth -4 -14, 2, 14, 14)];
}


-(void)creatorCoverCellTap
{
    if ([_delegate respondsToSelector:@selector(creatorCoverCellTapIndex:)]) {
        [_delegate creatorCoverCellTapIndex:_cellIndex];
    }
}


@end


