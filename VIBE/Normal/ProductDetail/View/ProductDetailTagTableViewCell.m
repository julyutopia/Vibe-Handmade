//
//  ProductDetailTagTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/2/7.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ProductDetailTagTableViewCell.h"

@implementation ProductDetailTagTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, 35)];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backView];
        
        
        _tagViewMaxWidth = kScreenWidth -20 -30 -80 -20;
        _gradientTagView = [[GradientTagCloudView alloc]initWithFrame:CGRectMake(15, 8, _tagViewMaxWidth, 19)];
        [_backView addSubview:_gradientTagView];
    
    
        _showFavorView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth -20 -80 -15, 10, 80, 15)];
        [_showFavorView setBackgroundColor:[UIColor clearColor]];
        [_backView addSubview:_showFavorView];
        
        _favorIcon = [[UIImageView alloc]init];
        [_favorIcon setImage:[UIImage imageNamed:@"Product_Favor_Icon"]];
        [_showFavorView addSubview:_favorIcon];
        
        _favorCountLabel = [[UILabel alloc]init];
        [_favorCountLabel setTextAlignment:NSTextAlignmentRight];
        [_favorCountLabel setTextColor:RGBA(155, 155, 155, 40)];
        [_favorCountLabel setFont:[UIFont fontWithName:Default_Number_Font size:12]];
        [_showFavorView addSubview:_favorCountLabel];

    }
    
    return self;
}

-(void)setDetailTagCellWithModal:(VibeProductModal *)modal
{
    NSArray * tagArray = modal.productTagsArray;
    
    [_gradientTagView setGradientTagCloudWithMaxWidth:_tagViewMaxWidth MaxHeight:18 WithFont:[UIFont fontWithName:Default_Font_Middle size:11] AndTags:tagArray];
    
    NSString * favorCount = [NSString stringWithFormat:@"%@",modal.productFavorCount];
    float favorWidth = [favorCount getSizeWithLimitSize:CGSizeMake(100, 15) withFont:_favorCountLabel.font].width;
    
    [_favorCountLabel setText:favorCount];
    [_favorCountLabel setFrame:CGRectMake(80 -favorWidth, 0, favorWidth, 15)];
    
    [_favorIcon setFrame:CGRectMake(80 -favorWidth -3 -13, 1, 13, 13)];
}


@end
