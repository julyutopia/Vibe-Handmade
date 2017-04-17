//
//  StoryDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/17.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "StoryDetailViewController.h"

@interface StoryDetailViewController ()

@end

@implementation StoryDetailViewController


-(id)initWithStoryDetailModal:(StoryDetailModal *)storyDetailModal
{
    
    self = [super init];
    if (self)
    {
        _storyDetailModal = [[StoryDetailModal alloc]init];
        _storyDetailModal = storyDetailModal;
    }
    
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _storyDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_storyDetailTableView setBackgroundView:nil];
    [_storyDetailTableView setBackgroundColor:[UIColor clearColor]];
    [_storyDetailTableView setDelegate:self];
    [_storyDetailTableView setDataSource:self];
    [_storyDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_storyDetailTableView setShowsVerticalScrollIndicator:NO];
    [_storyDetailTableView setContentInset:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [_storyDetailTableView setScrollIndicatorInsets:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [self.view addSubview:_storyDetailTableView];
    
    
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
    if (section == 1 && _storyDetailModal.storyDetailInfoArray.count) {
        return _storyDetailModal.storyDetailInfoArray.count;
    }
    if (section == 2 && _storyDetailModal.storyDetailBottomInfoArray.count) {
        return _storyDetailModal.storyDetailBottomInfoArray.count;
    }
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //顶部Cell
    if (indexPath.section == 0) {
        
        NSString * cellIndentifier = @"StoryDetailTopTableViewCellIdentifier";
        
        StoryDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[StoryDetailTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        [cell setStoryDetailTopCellWithModal:_storyDetailModal];
        
        return cell;
    }
    
    //显示详情的Cell
    if (indexPath.section == 1) {
        
        NSDictionary * storyDetailDict = [_storyDetailModal.storyDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [storyDetailDict objectForKey:Story_Detail_Type];
        
        //显示普通文字
        if ([typeee isEqualToString:Story_Detail_Text_Normal]) {
            
            NSString * cellIndentifier = @"StoryDetailTextTableViewCellIdentifier";
            
            StoryDetailTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[StoryDetailTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * text = [storyDetailDict objectForKey:Story_Detail_Content];
            [cell setStorycDetailTextCellWithInfo:text];
            
            return cell;
        }
        //显示高亮文字
        if ([typeee isEqualToString:Story_Detail_Text_Highlight]) {
            
            NSString * cellIndentifier = @"StoryDetailTextHighlightTableViewCellIdentifier";
            
            StoryDetailTextHighlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[StoryDetailTextHighlightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * highlightText = [storyDetailDict objectForKey:Story_Detail_Content];
            [cell setStoryDetailTextHighlightCellWithInfo:highlightText];
            
            return cell;
        }
        //显示图片内容
        if ([typeee isEqualToString:Story_Detail_Photos]) {
            
            NSString * cellIndentifier = @"StoryDetailPhotosTableViewCellIdentifier";
            
            StoryDetailPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[StoryDetailPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSArray * photosArray = [storyDetailDict objectForKey:Story_Detail_Content];
            [cell setStoryDetailPhotoCellWithInfo:photosArray];
            
            return cell;
        }
    }
    
    //显示底部的图片内容
    if (indexPath.section == 2 && _storyDetailModal.storyDetailBottomInfoArray.count) {
        
        NSString * cellIndentifier = @"StoryDetailBottomTableViewCellIdentifier";
        
        StoryDetailBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[StoryDetailBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        BOOL isLast = NO;
        if (indexPath.row == _storyDetailModal.storyDetailBottomInfoArray.count -1) {
            isLast = YES;
        }
        NSString * bottomImageURL = [_storyDetailModal.storyDetailBottomInfoArray objectAtIndex:indexPath.row];
        
        [cell setStoryBottomTableCellWithInfo:bottomImageURL IsLastCell:isLast];
        
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
    
    if (indexPath.section == 1 && _storyDetailModal.storyDetailInfoArray.count) {
        
        NSDictionary * storyDetailDict = [_storyDetailModal.storyDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [storyDetailDict objectForKey:Story_Detail_Type];
        
        //计算显示普通文字的高度
        if ([typeee isEqualToString:Story_Detail_Text_Normal]) {
            
            NSString * text = [storyDetailDict objectForKey:Story_Detail_Content];
            UIFont * textFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
            float textHeight = [text getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:textFont].height;
            
            //超过一行的话，有行宽
            if (textHeight >20) {
                textHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:text withFont:textFont withWidth:kScreenWidth -60 -20 withLineSpacing:6.0];
            }
            return textHeight +20;
        }
        
        //计算显示高亮文字的高度
        if ([typeee isEqualToString:Story_Detail_Text_Highlight]) {
            
            NSString * highlightText = [storyDetailDict objectForKey:Story_Detail_Content];
            UIFont * highlightTextFont = [VibeFont fontWithName:Font_Chinese_Regular size:17];
            
            float hightlightTextWidth = kScreenWidth -60 -25 -40;
            
            float hightlightTextHeight = [highlightText getSizeWithLimitSize:CGSizeMake(hightlightTextWidth, 500) withFont:highlightTextFont].height;
            
            if (hightlightTextHeight >20) {
                
                hightlightTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:highlightText withFont:highlightTextFont withWidth:hightlightTextWidth withLineSpacing:4.0];
            }
            
            return 6 +hightlightTextHeight +20;
        }
        
        //计算显示图片的高度
        if ([typeee isEqualToString:Story_Detail_Photos]) {
            
            float singlePhotoHeight = (kScreenWidth -60 -20 -12 *3)/3.5;
            return singlePhotoHeight +20;
        }
        
    }
    
    //计算底部图片的高度
    if (indexPath.section == 2 && _storyDetailModal.storyDetailBottomInfoArray.count) {
        
        float bottomHeight = 15;
        
        if (indexPath.row == _storyDetailModal.storyDetailBottomInfoArray.count -1) {
            bottomHeight = 0;
        }
        
        StoryDetailBottomTableViewCell *cell = (StoryDetailBottomTableViewCell *)[self tableView:_storyDetailTableView cellForRowAtIndexPath:indexPath];
        
        float heighttt = cell.imageHeight +bottomHeight;
        return heighttt;
    }
    
    return 0;
}


-(void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
}




@end
