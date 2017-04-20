//
//  RecommandTopTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 2017/4/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "RecommandTopTableViewCell.h"

@implementation RecommandTopTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float topViewWidth = kScreenWidth -50;
        float topViewHeight = topViewWidth/16*9;
     
        _showTopView = [[UIView alloc]initWithFrame:CGRectMake(25, 0, kScreenWidth -50, topViewHeight)];
        [_showTopView setBackgroundColor:[UIColor whiteColor]];
        [_showTopView.layer setCornerRadius:8];
        [_showTopView.layer setMasksToBounds:YES];
        [self.contentView addSubview:_showTopView];
                
        //滚动视图
        _topScrollView = [[JGInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -50, topViewHeight)];
        [_topScrollView setBackgroundColor:[UIColor clearColor]];
        _topScrollView.delegate = self;
        [_topScrollView.layer setMasksToBounds:YES];
        [_showTopView addSubview:_topScrollView];
        
        
        _topInfoArrays = [[NSMutableArray alloc]init];
        
    }
    
    
    return self;

}


-(void)setRecommandTopCellWithInfos:(NSArray *)infoArray
{
    if (_topInfoArrays.count) {
        return;
    }
    
    if (infoArray.count) {
        
        for (int i =0; i<infoArray.count; i++) {
            RecommandTopViewModal * modal = [infoArray objectAtIndex:i];
            [_topInfoArrays addObject:modal.imgURL];
        }
        
        [_topScrollView setImages:_topInfoArrays];
    }
    
}


#pragma mark - scrollView的点击代理方法
-(void)ScrollViewDidClickAtAnyImageView:(UIImageView *)imageView
{
    NSInteger imgViewTag = imageView.tag;

    if ([_delegateee respondsToSelector:@selector(recommandTopCellDidTapWithIndex:)]) {
        [_delegateee recommandTopCellDidTapWithIndex:imgViewTag];
    }
}


@end










