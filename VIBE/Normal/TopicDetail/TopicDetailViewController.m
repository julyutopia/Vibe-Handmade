//
//  TopicDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()

@end

@implementation TopicDetailViewController

-(id)initWithTopicDetailModal:(TopicDetailModal *)topicDetailModal
{
    self = [super init];
    if (self)
    {
        _topicDetailModal = [[TopicDetailModal alloc]init];
        _topicDetailModal = topicDetailModal;
    }
    
    return self;
}


-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DefaultBackgroundColor];
    
    
    _topicDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_topicDetailTableView setBackgroundView:nil];
    [_topicDetailTableView setBackgroundColor:[UIColor clearColor]];
    [_topicDetailTableView setDelegate:self];
    [_topicDetailTableView setDataSource:self];
    [_topicDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_topicDetailTableView setShowsVerticalScrollIndicator:NO];
    [_topicDetailTableView setContentInset:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [_topicDetailTableView setScrollIndicatorInsets:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [self.view addSubview:_topicDetailTableView];
    
    
    [self.navigationView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.naviBlurView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.view bringSubviewToFront:self.navigationView];
    
    [self.view bringSubviewToFront:self.leftBtn];

    
    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_sectionFooterView setBackgroundColor:[UIColor clearColor]];
    
}



#pragma mark -TableView的代理
-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 2) {
        return 20;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 2) {
        return _sectionFooterView;
    }
    return nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    //顶部Cell + 描述Cell +底部Cell
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1 && _topicDetailModal.topicDetailInfoArray.count) {
        
        return _topicDetailModal.topicDetailInfoArray.count;
    }
    if (section == 2 && _topicDetailModal.topicDetailBottomInfoArray.count) {
        
        return _topicDetailModal.topicDetailBottomInfoArray.count;
    }
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //顶部Cell
    if (indexPath.section == 0) {
        
        NSString * cellIndentifier = @"TopicDetailTopTableViewCellIdentifier";
        
        TopicDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[TopicDetailTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        [cell setTopicDetailTopCellWithModal:_topicDetailModal];
        
        return cell;
    }
    
    //描述Cell
    if (indexPath.section == 1 && _topicDetailModal.topicDetailInfoArray.count) {
        
        NSDictionary * topicDetailDict = [_topicDetailModal.topicDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [topicDetailDict objectForKey:Topic_Detail_Type];
        
        //显示普通文字
        if ([typeee isEqualToString:Topic_Detail_Text_Normal]) {
            
            NSString * cellIndentifier = @"TopicDetailTextTableViewCellIdentifier";
            
            TopicDetailTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[TopicDetailTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * text = [topicDetailDict objectForKey:Topic_Detail_Content];
            [cell setTopicDetailTextCellWithInfo:text];
        
            return cell;
        }
        
        //显示高亮文字
        if ([typeee isEqualToString:Topic_Detail_Text_Highlight]) {
            
            NSString * cellIndentifier = @"TopicDetailTextHighlightTableViewCellIdentifier";
            
            TopicDetailTextHighlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[TopicDetailTextHighlightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * highlightText = [topicDetailDict objectForKey:Topic_Detail_Content];
            [cell setTopicDetailTextHighlightCellWithInfo:highlightText];
            
            return cell;
        }
        
        //显示图片内容
        if ([typeee isEqualToString:Topic_Detail_Photos]) {
            
            NSString * cellIndentifier = @"TopicDetailPhotoTableViewCellIdentifier";
            
            TopicDtailPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[TopicDtailPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSArray * photosArray = [topicDetailDict objectForKey:Topic_Detail_Content];
            [cell setTopicDetailPhotoCellWithInfo:photosArray];
            
            return cell;
        }
        
        //显示相似推荐的内容
        if ([typeee isEqualToString:Topic_Detail_Items]) {
            
            NSString * cellIndentifier = @"TopicDetailItemsTableViewCellIdentifier";
            
            TopicDetailItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[TopicDetailItemsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSArray * itemsArray = [topicDetailDict objectForKey:Topic_Detail_Content];
            [cell setTopicDetailItemsWithItems:itemsArray];
            
            return cell;
        }
    }
    
    //显示底部的图片内容
    if (indexPath.section == 2 && _topicDetailModal.topicDetailBottomInfoArray.count) {
        
        NSString * cellIndentifier = @"TopicDetailBottomTableViewCellIdentifier";

        TopicDetailBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[TopicDetailBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        BOOL isLast = NO;
        if (indexPath.row == _topicDetailModal.topicDetailBottomInfoArray.count -1) {
            isLast = YES;
        }
        NSString * bottomImageURL = [_topicDetailModal.topicDetailBottomInfoArray objectAtIndex:indexPath.row];
        
        [cell setTopicBottomTableCellWithInfo:bottomImageURL IsLastCell:isLast];
        
        return cell;
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
        
        return kScreenWidth -60 +5;
    }
    
    //显示详细Cell
    if (indexPath.section == 1 && _topicDetailModal.topicDetailInfoArray.count) {
        
        NSDictionary * topicDetailDict = [_topicDetailModal.topicDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [topicDetailDict objectForKey:Topic_Detail_Type];
        
        //计算显示普通文字的高度
        if ([typeee isEqualToString:Topic_Detail_Text_Normal]) {
            
            NSString * text = [topicDetailDict objectForKey:Topic_Detail_Content];
            
            UIFont * textFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
            
            float textHeight = [text getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:textFont].height;
            
            //超过一行的话，有行宽
            if (textHeight >20) {
                  textHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:text withFont:textFont withWidth:kScreenWidth -60 -20 withLineSpacing:6.0];
            }
            
            return textHeight +20;
        }
        
        //计算显示高亮文字的高度
        if ([typeee isEqualToString:Topic_Detail_Text_Highlight]) {
            
            NSString * highlightText = [topicDetailDict objectForKey:Topic_Detail_Content];
            UIFont * highlightTextFont = [VibeFont fontWithName:Font_Chinese_Regular size:17];

            float hightlightTextWidth = kScreenWidth -60 -25 -40;
            
            float hightlightTextHeight = [highlightText getSizeWithLimitSize:CGSizeMake(hightlightTextWidth, 500) withFont:highlightTextFont].height;
            
            if (hightlightTextHeight >20) {
                
                hightlightTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:highlightText withFont:highlightTextFont withWidth:hightlightTextWidth withLineSpacing:4.0];
            }
            
            return 6 +hightlightTextHeight +20;
        }
        
        //计算显示图片的高度
        if ([typeee isEqualToString:Topic_Detail_Photos]) {
            
            float singlePhotoHeight = (kScreenWidth -60 -15 *2)/3.5;
            return singlePhotoHeight +20;
        }
        
        //计算显示类似推荐的高度
        if ([typeee isEqualToString:Topic_Detail_Items]) {
            
            NSString * title = @"相关推荐";
            
            float titleHeight = [title getSizeWithLimitSize:CGSizeMake(100, 20) withFont: [VibeFont fontWithName:Font_Chinese_Regular size:12]].height;
           
            float itemWidth = ((kScreenWidth -60 -20) -20)/2;
            float itemHeight = itemWidth +55;
            
            NSArray * itemsArray = [topicDetailDict objectForKey:Topic_Detail_Content];
            NSInteger itemsRows = itemsArray.count/2;
            
            float totalHeight = titleHeight +20 + (itemHeight +20) *itemsRows;
            
            return totalHeight;
        }
        
    }
    
    if (indexPath.section == 2 && _topicDetailModal.topicDetailBottomInfoArray.count) {
        
        float bottomHeight = 15;
        
        if (indexPath.row == _topicDetailModal.topicDetailBottomInfoArray.count -1) {
            bottomHeight = 0;
        }
        
        TopicDetailBottomTableViewCell *cell = (TopicDetailBottomTableViewCell *)[self tableView:_topicDetailTableView cellForRowAtIndexPath:indexPath];
        
        float heighttt = cell.imageHeight +bottomHeight;
        return heighttt;
    }
    
    
    return 0;
}


#pragma mark -点击收藏按钮
-(void)addFavorClicked:(UIButton *)favorBtn
{
    if ([[VibeAppTool sharedInstance]isUserLogIn]) {
        
    }
    //未登录
    else{
        VibeLogInViewController * logInVC = [[VibeLogInViewController alloc]init];
        logInVC.isPopUp = YES;
        LCNavigationController * navi = [[LCNavigationController alloc]initWithRootViewController:logInVC];
        [navi setCanDragPop:NO];
        [self.lcNavigationController presentViewController:navi animated:YES completion:nil];
    }
}





//#pragma mark -POP
//-(void)backBtnClicked:(id)sender
//{
//    [self.lcNavigationController popViewController];
//}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
