//
//  RecommandTableView.m
//  VIBE
//
//  Created by Li Haii on 16/10/7.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "RecommandTableView.h"

@implementation RecommandTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    
    if (self) {
        
        [self setBackgroundView:nil];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setDelegate:self];
        [self setDataSource:self];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self setShowsVerticalScrollIndicator:NO];

        _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
        
        _recommandBannerArray = [[NSMutableArray alloc]init];
        _recommandCategoryArray = [[NSMutableArray alloc]init];
        _recommandTopicsArray = [[NSMutableArray alloc]init];
        _recommandProductsArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}



-(void)setRecommandInfoDict:(NSDictionary *)recommandDict
{
    //有推荐内容
    if (recommandDict.count) {
        
        if ([[recommandDict objectForKey:@"banner"] isKindOfClass:[NSArray class]]) {
            NSArray * array = [recommandDict objectForKey:@"banner"];
            [_recommandBannerArray removeAllObjects];
            [_recommandBannerArray addObjectsFromArray:array];
        }

        if ([[recommandDict objectForKey:@"category"] isKindOfClass:[NSArray class]]) {
            NSArray * array = [recommandDict objectForKey:@"category"];
            [_recommandCategoryArray removeAllObjects];
            [_recommandCategoryArray addObjectsFromArray:array];
        }
        
        if ([[recommandDict objectForKey:@"topic"] isKindOfClass:[NSArray class]]) {
            NSArray * array = [recommandDict objectForKey:@"topic"];
            [_recommandTopicsArray removeAllObjects];
            [_recommandTopicsArray addObjectsFromArray:array];
        }
        if ([[recommandDict objectForKey:@"product"] isKindOfClass:[NSArray class]]) {
            NSArray * array = [recommandDict objectForKey:@"product"];
            [_recommandProductsArray removeAllObjects];
            [_recommandProductsArray addObjectsFromArray:array];
        }

        [self reloadData];
    }
}


#pragma mark -TableDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _sectionFooterView;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 1 +_recommandTopicsArray.count +1;
    }
    if (section ==2) {
        return 1 +_recommandProductsArray.count;
    }
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Banner
    if (indexPath.section == 0 ) {
        
        NSString * identifierString = @"RecommandBannerCellIdentifier";
        
        RecommandBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[RecommandBannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        if (_recommandBannerArray.count && _recommandCategoryArray.count) {
            [cell setDelegate:self];
            [cell setBannerScrollArray:_recommandBannerArray CategoryArray:_recommandCategoryArray];
        }
        return cell;
    }
    
//    //分类
//    if (indexPath.section == 1 ) {
//        
//        NSString * identifierString = @"RecommandCategoryCellIdentifier";
//        
//        RecommandCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
//        if (cell == nil) {
//            cell = [[RecommandCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            [cell setBackgroundColor:[UIColor clearColor]];
//            [cell setBackgroundView:nil];
//        }
//        if (_recommandCategoryArray.count) {
//            [cell setCategoryCellWithArray:_recommandCategoryArray];
//        }
//        return cell;
//    }
    
    //专题
    if (indexPath.section == 1 ) {
        
        if (indexPath.row == 0) {
            NSString * identifierString = @"RecommandCTopicTopCellIdentifier";
            
            RecommandTopicHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[RecommandTopicHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
        }
        
        if (indexPath.row >0 && indexPath.row <= _recommandTopicsArray.count)
        {
            NSString * identifierString = @"RecommandCTopicCellIdentifier";
            RecommandTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[RecommandTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            [cell setDelegate:self];
            
            VibeTopicModal * modal = [_recommandTopicsArray objectAtIndex:indexPath.row -1];
            [cell setRecommandTopicCellWithModal:modal];
            
            return cell;
        }
        
        else{
            NSString * identifierString = @"RecommandCTopicBottomCellIdentifier";
            RecommandTopicFooterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[RecommandTopicFooterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
        }
    }
    
    //推荐商品
    if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            
            NSString * identifierString = @"RecommandCProductTopCellIdentifier";
            RecommandProductHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[RecommandProductHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            return cell;
        }
        else{
            NSString * identifierString = @"RecommandCProductCellIdentifier";
            RecommandProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[RecommandProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }

            VibeProductModal * modal = [_recommandProductsArray objectAtIndex:indexPath.row -1];
            
            BOOL isLastCell = NO;
            if (indexPath.row == _recommandProductsArray.count) {
                isLastCell = YES;
            }
            [cell setProductCellWithModal:modal WithIndex:indexPath.row-1 IsLastCell:isLastCell];
            [cell setDelegateee:self];
            
            return cell;
        }
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionFillOrderCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FunctionFillOrderCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return (kScreenWidth -20)/2 +15 +10 +42.6666666666 *sizeRate * 2 +18;
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            return 44;
        }
        if (indexPath.row >0 && indexPath.row <= _recommandTopicsArray.count) {
            
            float heightt = (kScreenWidth -50)/3 +10;
            return heightt;
        }
        else{
            return 30;
        }
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 44;
        }
        else
        {
            if (indexPath.row == _recommandProductsArray.count) {
                return (kScreenWidth-20)/4 +10;
            }
            else{
                return (kScreenWidth-20)/4;
            }
        }
    }
    
    return 0;
}


#pragma mark - 顶部BannerCell的代理方式
-(void)recommandBannerCellTapIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(recommandTableDidClickBannerWithIndex:)]) {
        [_delegateee recommandTableDidClickBannerWithIndex:index];
    }
}

#pragma mark - 点击分类
-(void)recommandBannerTapCategoryWithIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(recommandTableDidClickCategoryWithIndex:)]) {
        [_delegateee recommandTableDidClickCategoryWithIndex:index];
    }
}

#pragma mark - 点击专题
-(void)recommandTopicCellClickWithIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(recommandTableDidClickTopicWithIndex:)]) {
        [_delegateee recommandTableDidClickTopicWithIndex:index];
    }
}

#pragma mark - 点击单品
-(void)recommandProductCellClickWithIndex:(NSInteger)index
{
    if ([_delegateee respondsToSelector:@selector(recommandTableDidClickProductWithIndex:)]) {
        [_delegateee recommandTableDidClickProductWithIndex:index];
    }
}

@end
