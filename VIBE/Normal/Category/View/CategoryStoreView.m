//
//  CategoryStoreView.m
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryStoreView.h"

@implementation CategoryStoreView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        float productWidth = frame.size.width/2;
        float productHeight = (frame.size.height - 70)/2;
    
        _backImgView = [[GLImageView alloc]initWithFrame:CGRectMake(0, 0,  frame.size.width,  frame.size.height)];
        [_backImgView setBackgroundColor:[UIColor clearColor]];
        [_backImgView.layer setCornerRadius:2.0f];
        [_backImgView.layer setMasksToBounds:YES];
        [_backImgView addTarget:self action:@selector(didTapStoreView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backImgView];
        
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        
        _backView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backView setAlpha:0.5];
        [_backView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_backView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_backView];
        
        _stroreImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 35, 35)];
        [_stroreImgView.layer setCornerRadius:35/2];
        [_stroreImgView.layer setMasksToBounds:YES];
        [_stroreImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_backImgView addSubview:_stroreImgView];
        
        _storeNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 +35 +10, 10, frame.size.width -(10 +35 +10 +10), 20)];
        [_storeNameLabel setTextColor:[UIColor whiteColor]];
        [_storeNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_storeNameLabel setFont:[UIFont fontWithName:Default_Font_Bold size:16]];
        [_backImgView addSubview:_storeNameLabel];
        
        
        _storeIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10 +35 +10, 10 +35 -12 -1, 12, 12)];
        [_storeIconImgView setBackgroundColor:[UIColor clearColor]];
        [_storeIconImgView setImage:[UIImage imageNamed:@"Category_Store_Owner"]];
        [_storeIconImgView setAlpha:0.5f];
        [_backImgView addSubview:_storeIconImgView];

        _storeOwnerNameLabel =[ [UILabel alloc]initWithFrame:CGRectMake(10 +35 +10 + 12 +2, 10 +35 -13, frame.size.width -(10 +35 +10 + 12 +2 +10), 13)];
        [_storeOwnerNameLabel setTextColor:RGBA(255, 255, 255, 50)];
        [_storeOwnerNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_storeOwnerNameLabel setFont:[UIFont fontWithName:Default_Font size:12]];
        [_backImgView addSubview:_storeOwnerNameLabel];
        
        
        _storeFavoredBtn = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width -22 -10, 24 +15, 22, 22)];
        [_storeFavoredBtn setBackgroundColor:[UIColor clearColor]];
        [_storeFavoredBtn setBackgroundImage:[UIImage imageNamed:@"Category_Store_Favor"] forState:UIControlStateNormal];
        [_storeFavoredBtn addTarget:self action:@selector(didTapFavorBtn) forControlEvents:UIControlEventTouchUpInside];
        [_backImgView addSubview:_storeFavoredBtn];
    
        
        _storeSloganTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70 -14 -7, frame.size.width -20 -10, 14)];
        [_storeSloganTitleLabel setTextColor:[UIColor whiteColor]];
        [_storeSloganTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_storeSloganTitleLabel setFont:[UIFont fontWithName:Default_Font size:11]];
        [_backImgView addSubview:_storeSloganTitleLabel];
     
        
        _firstProductImgView = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(0, 70, productWidth, productHeight)];
        [_firstProductImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_firstProductImgView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_firstProductImgView];
        
        _secondProductImgView = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(productWidth, 70, productWidth, productHeight)];
        [_secondProductImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_secondProductImgView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_secondProductImgView];
        
        _thirdProductImgView = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(0, 70 +productHeight, productWidth, productHeight)];
        [_thirdProductImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_thirdProductImgView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_thirdProductImgView];
        
        _fourthProductImgView = [[UIImageViewModeScaleAspect alloc]initWithFrame:CGRectMake(productWidth, 70 +productHeight, productWidth, productHeight)];
        [_fourthProductImgView setContentMode:UIViewContentModeScaleAspectFill];
        [_fourthProductImgView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_fourthProductImgView];
    
    }
    return self;
}


-(void)setCategoryStoreViewWithModal:(CategoryStoreModal *)modal
{
    _storeID = [modal.storeID integerValue];
    
    [_stroreImgView sd_setImageWithURL:[NSURL URLWithString:modal.storeIconImgURL] placeholderImage:nil];
    [_storeNameLabel setText:modal.storeTitle];
    [_storeOwnerNameLabel setText:modal.storeOwnerName];
    
    if (modal.storeIsFavored) {
        [_storeFavoredBtn setBackgroundImage:[UIImage imageNamed:@"Category_Store_Favored"] forState:UIControlStateNormal];
    }
    else{
        [_storeFavoredBtn setBackgroundImage:[UIImage imageNamed:@"Category_Store_Favor"] forState:UIControlStateNormal];        
    }
    
    [_storeSloganTitleLabel setText:modal.storeSloganString];
    
//    if ([modal.storeTopProductsArray objectAtIndex:0]) {
//        NSDictionary * dict =[modal.storeTopProductsArray objectAtIndex:0];
//        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:[dict objectForKey:@"storeImageURL"]]options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            [_firstProductImgView setImage:image];
//        }];
//    }
//    
//    if ([modal.storeTopProductsArray objectAtIndex:1]) {
//        NSDictionary * dict =[modal.storeTopProductsArray objectAtIndex:1];
//        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:[dict objectForKey:@"storeImageURL"]]options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            [_secondProductImgView setImage:image];
//        }];
//    }
//
//    if ([modal.storeTopProductsArray objectAtIndex:2]) {
//        NSDictionary * dict =[modal.storeTopProductsArray objectAtIndex:2];
//        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:[dict objectForKey:@"storeImageURL"]]options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            [_thirdProductImgView setImage:image];
//        }];
//    }
//    
//    if ([modal.storeTopProductsArray objectAtIndex:3]) {
//        NSDictionary * dict =[modal.storeTopProductsArray objectAtIndex:3];
//        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:[dict objectForKey:@"storeImageURL"]]options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            [_fourthProductImgView setImage:image];
//        }];
//    }


    
}


-(void)didTapStoreView
{
    if ([_delegate respondsToSelector:@selector(categoryCellDidTapWithStoreID:)]) {
        [_delegate categoryCellDidTapWithStoreID:_storeID];
    }
}


-(void)didTapFavorBtn
{
    
}

@end





