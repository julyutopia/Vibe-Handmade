//
//  CreatorDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/4/18.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDetailViewController.h"

@interface CreatorDetailViewController ()

@end

@implementation CreatorDetailViewController

-(id)initWithCreatorDetailModal:(CreatorDetailModal *)creatorDetailModal
{
    self = [super init];
    if (self)
    {
        _creatorDetailModal = [[CreatorDetailModal alloc]init];
        _creatorDetailModal = creatorDetailModal;
    }
    
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _creatorDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_creatorDetailTableView setBackgroundView:nil];
    [_creatorDetailTableView setBackgroundColor:[UIColor clearColor]];
    [_creatorDetailTableView setDelegate:self];
    [_creatorDetailTableView setDataSource:self];
    [_creatorDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_creatorDetailTableView setShowsVerticalScrollIndicator:NO];
    [_creatorDetailTableView setContentInset:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [_creatorDetailTableView setScrollIndicatorInsets:UIEdgeInsetsMake(Navi_View_Height, 0, 0, 0)];
    [self.view addSubview:_creatorDetailTableView];
    
    [self.navigationView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.naviBlurView setFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [self.view bringSubviewToFront:self.navigationView];
    
    [self.view bringSubviewToFront:self.leftBtn];
    
    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_sectionFooterView setBackgroundColor:[UIColor clearColor]];
    
    
    _bottomViewHeight = 80;
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight -_bottomViewHeight, kScreenWidth, _bottomViewHeight)];
    [self.view addSubview:_bottomView];

    
    UIView  * bottomWhiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _bottomViewHeight)];
    [bottomWhiteView setBackgroundColor:RGBA(255, 255, 255, 80)];
    [_bottomView addSubview:bottomWhiteView];
    
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView * blurView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _bottomViewHeight)];
    [blurView setEffect:effect];
    [_bottomView addSubview:blurView];
    
    UIView * bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
    [bottomLineView setBackgroundColor:Default_Text_Gray_Color];
    [bottomLineView setAlpha:0.1f];
    [_bottomView addSubview:bottomLineView];
    
    float shopBtnWidth = 218;
    float shopBtnHeight = 51;
    
    UIButton * shopBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth -shopBtnWidth)/2, (_bottomViewHeight -shopBtnHeight)/2, shopBtnWidth, shopBtnHeight)];
    [shopBtn setBackgroundImage:[UIImage imageNamed:@"Creator_Detail_Go_Shop"] forState:UIControlStateNormal];
    [shopBtn setBackgroundImage:[UIImage imageNamed:@"Creator_Detail_Go_Shop_Highlight"] forState:UIControlStateHighlighted];
    [_bottomView addSubview:shopBtn];
    
}


#pragma mark -TableView的代理
-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }
    if (section == 2) {
        return _bottomViewHeight +20;
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
    if (section == 1 && _creatorDetailModal.creatorDetailInfoArray.count) {
        return _creatorDetailModal.creatorDetailInfoArray.count;
    }
    
    if (section == 2 && _creatorDetailModal.creatorDetailBottomInfoArray.count) {
        return _creatorDetailModal.creatorDetailBottomInfoArray.count;
    }
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //顶部Cell
    if (indexPath.section == 0) {
        
        NSString * cellIndentifier = @"CreatorDetailTopTableViewCellIdentifier";
        
        CreatorDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[CreatorDetailTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        [cell setCreatorDetailTopCellWithModal:_creatorDetailModal];
        
        return cell;
    }
    
    //显示详情的Cell
    if (indexPath.section == 1 && _creatorDetailModal.creatorDetailInfoArray.count) {
        
        NSDictionary * storyDetailDict = [_creatorDetailModal.creatorDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [storyDetailDict objectForKey:Creator_Detail_Type];
        
        //显示普通文字
        if ([typeee isEqualToString:Creator_Detail_Text_Normal]) {
            
            NSString * cellIndentifier = @"CreatorDetailTextTableViewCellIdentifier";
            
            CreatorDetailTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CreatorDetailTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * text = [storyDetailDict objectForKey:Creator_Detail_Content];
            [cell setCreatorDetailTextCellWithInfo:text];
            
            return cell;
        }
        //显示高亮文字
        if ([typeee isEqualToString:Creator_Detail_Text_Highlight]) {
            
            NSString * cellIndentifier = @"CreatorDetailTextHighlightTableViewCell";
            
            CreatorDetailTextHighlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CreatorDetailTextHighlightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * highlightText = [storyDetailDict objectForKey:Creator_Detail_Content];
            [cell setCreatorDetailTextHighlightCellWithInfo:highlightText];
            
            return cell;
        }
        //显示粗体文字
        if ([typeee isEqualToString:Creator_Detail_Text_Bold]) {
            
            NSString * cellIndentifier = @"CreatorDetailTextBoldTableViewCell";
            
            CreatorDetailTextBoldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CreatorDetailTextBoldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * boldText = [storyDetailDict objectForKey:Creator_Detail_Content];
            [cell setCreatorDetailTextBoldCellWithInfo:boldText];
            
            return cell;
        }
        //显示单张图片内容
        if ([typeee isEqualToString:Creator_Detail_Photo]) {
            
            NSString * cellIndentifier = @"CreatorDetailPhotoTableViewCellIdentifier";
            
            CreatorDetailSinglePhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CreatorDetailSinglePhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            NSString * imageURL = [storyDetailDict objectForKey:Creator_Detail_Content];
            [cell setCreatorSinglePhotoTableCellWithInfo:imageURL];
            
            return cell;
        }
        //显示滚动图片内容
        if ([typeee isEqualToString:Creator_Detail_More_Photos]) {
            
            NSString * cellIndentifier = @"CreatorDetailMorePhotosTableViewCellIdentifier";
            
            CreatorDetailMorePhotosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CreatorDetailMorePhotosTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.backgroundView = nil;
                cell.backgroundColor = [UIColor clearColor];
            }
            
            [cell setDelegate:self];
            
            NSArray * photosArray = [storyDetailDict objectForKey:Creator_Detail_Content];
            [cell setCreatorDetailMorePhotosCellWithInfo:photosArray];
            
            return cell;
        }
        
    }
    
    //底部显示的图片
    if (indexPath.section == 2 && _creatorDetailModal.creatorDetailBottomInfoArray.count) {
        
        NSString * cellIndentifier = @"CreatorDetailBottomTableViewCellIdentifier";
        
        CreatorDetailBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[CreatorDetailBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = nil;
            cell.backgroundColor = [UIColor clearColor];
        }
        
        NSString * imgURL = [_creatorDetailModal.creatorDetailBottomInfoArray objectAtIndex:indexPath.row];
        
        BOOL isLast = NO;
        if (indexPath.row == _creatorDetailModal.creatorDetailBottomInfoArray.count -1) {
            isLast = YES;
        }
        
        [cell setCreatorBottomTableCellWithInfo:imgURL IsLastCell:isLast];
        
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
        
        float photoViewHeight = kScreenWidth -60;
        
        NSString * shopName = _creatorDetailModal.creatorName;
        UIFont * shopNameFont = [VibeFont fontWithName:Font_Chinese_Regular size:23];
        float shopNameHeight = [shopName getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 40) withFont:shopNameFont].height;
        
        NSString * slogan = _creatorDetailModal.creatorSlogan;
        UIFont * sloganFont = [VibeFont fontWithName:Font_Chinese_Regular size:13];
        float sloganHeight = [slogan getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 200) withFont:sloganFont].height +1.0f;
      
        //超过一行显示
        if (sloganHeight >20) {
            sloganHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:slogan withFont:sloganFont withWidth:kScreenWidth -60 -20 withLineSpacing:4.0] +2.0;
        }
        
        return photoViewHeight +20 +shopNameHeight +10 +sloganHeight;
    }
    
    
    if (indexPath.section == 1 && _creatorDetailModal.creatorDetailInfoArray.count) {
        
        NSDictionary * creatorDetailDict = [_creatorDetailModal.creatorDetailInfoArray objectAtIndex:indexPath.row];
        NSString * typeee = [creatorDetailDict objectForKey:Creator_Detail_Type];
        
        //计算显示普通文字的高度
        if ([typeee isEqualToString:Creator_Detail_Text_Normal]) {
            
            NSString * text = [creatorDetailDict objectForKey:Creator_Detail_Content];
            UIFont * textFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
            float textHeight = [text getSizeWithLimitSize:CGSizeMake(kScreenWidth -60 -20, 500) withFont:textFont].height;
            
            //超过一行的话，有行宽
            if (textHeight >20) {
                textHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:text withFont:textFont withWidth:kScreenWidth -60 -20 withLineSpacing:6.0];
            }
            return textHeight +20;
        }
        
        //计算显示高亮文字的高度
        if ([typeee isEqualToString:Creator_Detail_Text_Highlight]) {
            
            NSString * highlightText = [creatorDetailDict objectForKey:Creator_Detail_Content];
            UIFont * highlightTextFont = [VibeFont fontWithName:Font_Chinese_Regular size:17];
            
            float hightlightTextWidth = kScreenWidth -60 -25 -40;
            
            float hightlightTextHeight = [highlightText getSizeWithLimitSize:CGSizeMake(hightlightTextWidth, 500) withFont:highlightTextFont].height;
            
            if (hightlightTextHeight >20) {
                
                hightlightTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:highlightText withFont:highlightTextFont withWidth:hightlightTextWidth withLineSpacing:6.0];
            }
            
            return 6 +hightlightTextHeight +20;
        }

        //计算显示粗体文字的高度
        if ([typeee isEqualToString:Creator_Detail_Text_Bold]) {
            
            NSString * boldText = [creatorDetailDict objectForKey:Creator_Detail_Content];
            UIFont * boldTextFont = [VibeFont fontWithName:Font_Chinese_Regular size:18];
            
            float boldTextWidth = kScreenWidth -60 -20;
            
            float boldTextHeight = [boldText getSizeWithLimitSize:CGSizeMake(boldTextWidth, 500) withFont:boldTextFont].height;
            
            if (boldTextHeight >20) {
                
                boldTextHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:boldText withFont:boldTextFont withWidth:boldTextWidth withLineSpacing:4.0];
            }
            
            return boldTextHeight +20;
        }
        
        //计算显示单张图片的高度
        if ([typeee isEqualToString:Creator_Detail_Photo]) {
            
            float bottomHeight = 20;
            CreatorDetailSinglePhotoTableViewCell *cell = (CreatorDetailSinglePhotoTableViewCell *)[self tableView:_creatorDetailTableView cellForRowAtIndexPath:indexPath];
            
            float heighttt = cell.imageHeight +bottomHeight;
            return heighttt;
        }
        
        //计算显示更多图片scrollview的高度
        if ([typeee isEqualToString:Creator_Detail_More_Photos]) {
            
            float singlePhotoHeight = (kScreenWidth -60 -20 -12 *3)/3.5;
            return singlePhotoHeight +20;
        }
    }
    
    //计算显示底部图片的高度
    if (indexPath.section == 2 && _creatorDetailModal.creatorDetailBottomInfoArray.count) {
        
        float bottomHeight = 10;
        if (indexPath.row == _creatorDetailModal.creatorDetailBottomInfoArray.count -1) {
            bottomHeight = 0;
        }
        
        CreatorDetailBottomTableViewCell *cell = (CreatorDetailBottomTableViewCell *)[self tableView:_creatorDetailTableView cellForRowAtIndexPath:indexPath];
        
        float heighttt = cell.imageHeight +bottomHeight;
        return heighttt;
    }

    
    return 0;
}


#pragma mark -点击滚动图片Cell的代理方法

-(void)creatorDetailPhotoTableViewShowImages:(NSArray *)imagesArray WithIndex:(NSInteger)index
{
    if (imagesArray.count && index <= imagesArray.count -1) {
        [XLPhotoBrowser showPhotoBrowserWithImages:imagesArray currentImageIndex:index];
    }
}


@end


