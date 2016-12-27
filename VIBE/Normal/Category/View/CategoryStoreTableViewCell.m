//
//  CategoryStoreTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryStoreTableViewCell.h"

@implementation CategoryStoreTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

        float titleWidthhh = 80;
        float titleHeightt = 19;
        
        int storeViewHeight = (int)(kScreenWidth -(15 +10 +20 +15))/1.5;
        
        
        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        _backView = [[UIVisualEffectView alloc]initWithEffect:beffect];
        [_backView setAlpha:0.3];
        [_backView.layer setCornerRadius:4.0f];
        [_backView.layer setMasksToBounds:YES];
        [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, 15 +titleHeightt +15 + storeViewHeight +10)];
        [self addSubview:_backView];
        
        _storeTitleImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -titleWidthhh)/2, 15, titleWidthhh, titleHeightt)];
        [_storeTitleImgView setImage:[UIImage imageNamed:@"Category_Store_Title"]];
        [self addSubview:_storeTitleImgView];
        
        
        _storeScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 15 +titleHeightt +15, kScreenWidth -30, storeViewHeight)];
        [_storeScrollView setBackgroundColor:[UIColor clearColor]];
        [_storeScrollView setShowsHorizontalScrollIndicator:NO];
        [_storeScrollView setPagingEnabled:NO];
        [self addSubview:_storeScrollView];
        
    }
    
    return self;
}



-(void)setCategoryStoreCellWithContent:(NSArray *)array
{
    int storeViewHeight = (int)(kScreenWidth -(15 +10 +20 +15))/1.5;
    
    if (_storeArray.count == 0) {
        
        [_storeArray addObjectsFromArray:array];
     
        for (int i =0; i <array.count; i ++) {
            
            CategoryStoreModal * modal = [array objectAtIndex:i];
            
            CategoryStoreView * storeView = [[CategoryStoreView alloc]initWithFrame:CGRectMake(15 + (storeViewHeight +20) *i, 0, storeViewHeight, storeViewHeight)];
            [storeView setDelegate:self];
            [storeView setCategoryStoreViewWithModal:modal];
            
            [_storeScrollView addSubview:storeView];
        }
        
        if (array.count >1) {
            [_storeScrollView setContentSize:CGSizeMake(15 + (storeViewHeight +20)* array.count -5, storeViewHeight)];
        }
    }
    
}


#pragma mark -
-(void)categoryCellDidTapWithStoreID:(NSInteger )storeID
{
    if ([_delegate respondsToSelector:@selector(categoryCellDidTapWithStoreID:)]) {
        [_delegate categoryCellDidTapWithStoreID:storeID];
    }
}



@end
