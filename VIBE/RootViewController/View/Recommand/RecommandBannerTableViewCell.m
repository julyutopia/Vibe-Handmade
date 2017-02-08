//
//  RecommandBannerTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/10/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandBannerTableViewCell.h"

@implementation RecommandBannerTableViewCell

@synthesize delegate = _delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float autoScrollViewHeight = (kScreenWidth -20)/2;
        
        _bannerCellHeight =  autoScrollViewHeight + 15 +42.6666666666 *sizeRate * 2 +18;
        
        UIView * shadowView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth -20, _bannerCellHeight)];
        [shadowView setBackgroundColor:[UIColor clearColor]];
        shadowView.layer.shadowColor = RGBA(0, 0, 0, 50).CGColor;//shadowColor阴影颜色
        shadowView.layer.shadowOffset = CGSizeMake(0,1);
        shadowView.layer.shadowOpacity = 0.2;
        shadowView.layer.shadowRadius = 3;
        [self.contentView addSubview:shadowView];
        
        _showBannerView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth -20, _bannerCellHeight)];
        [_showBannerView setBackgroundColor:[UIColor whiteColor]];
        [_showBannerView.layer setCornerRadius:4.0f];
        [_showBannerView.layer setMasksToBounds:YES];
        [self.contentView addSubview:_showBannerView];
        
        _autoScrollView = [[JGInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, autoScrollViewHeight)];
        [_autoScrollView setBackgroundColor:[UIColor whiteColor]];
        _autoScrollView.pageControlPostion = 1;
        _autoScrollView.delegate = self;
        [_autoScrollView.layer setMasksToBounds:YES];
        [_showBannerView addSubview:_autoScrollView];
        
        _showCategoryView = [[UIView alloc]initWithFrame:CGRectMake(15, 15+ autoScrollViewHeight, kScreenWidth -30, _bannerCellHeight - autoScrollViewHeight)];
        [_showCategoryView setBackgroundColor:[UIColor clearColor]];
        [_showBannerView addSubview:_showCategoryView];
        
        _bannerInfoArrays = [[NSMutableArray alloc]init];
        _categoryArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)setBannerScrollArray:(NSArray *)bannerArray CategoryArray:(NSArray *)cateArray
{
    if (_bannerInfoArrays.count >0 && _categoryArray.count >0) {
        return;
    }
    
    if (bannerArray.count) {
        for (int i =0; i<bannerArray.count; i++) {
            RecommandBannerModal * modal = [bannerArray objectAtIndex:i];
            [_bannerInfoArrays addObject:modal.imgURL];
        }
        [_autoScrollView setImages:_bannerInfoArrays];
    }
    
    if (cateArray.count) {
        
        [_categoryArray removeAllObjects];
        [_categoryArray addObjectsFromArray:cateArray];
        
        float singleWidth  = 51.2 *sizeRate;
        float singleHeight = 42.6666666666 * sizeRate;
        
        for (int i =0; i < _categoryArray.count; i ++) {
            
            RecommandCategoryModal * modal = [_categoryArray objectAtIndex:i];
            if (i < 5) {
                GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleWidth+11) *i, 0, singleWidth, singleHeight)];
                [btn setTag:5000 +i];
                [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryImgURL] placeholderImage:nil];
                [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
                [_showCategoryView addSubview:btn];
            }
            if (i >= 5) {
                GLImageView * btn = [[GLImageView alloc]initWithFrame:CGRectMake( (singleWidth+11) * (i -5), singleHeight +8, singleWidth, singleHeight)];
                [btn setTag:5000 +i];
                [btn sd_setImageWithURL:[NSURL URLWithString:modal.categoryImgURL] placeholderImage:nil];
                [btn addTarget:self action:@selector(categoryImgClicked:) forControlEvents:UIControlEventTouchUpInside];
                [_showCategoryView addSubview:btn];
            }
        }

        
    }
}

//点击banner其中一张
-(void)ScrollViewDidClickAtAnyImageView:(UIImageView *)imageView
{
    NSInteger taggg = imageView.tag;
    
    if ([_delegate respondsToSelector:@selector(recommandBannerCellTapIndex:)]) {
        [_delegate recommandBannerCellTapIndex:taggg];
    }
}

//点击类别
-(void)categoryImgClicked:(GLImageView *)imgBtn
{
    NSInteger indexxxx = imgBtn.tag - 5000;
    if (indexxxx < _categoryArray.count && [_delegate respondsToSelector:@selector(recommandBannerTapCategoryWithIndex:)]) {
        
        [_delegate recommandBannerTapCategoryWithIndex:indexxxx];
    }
    
}

@end
