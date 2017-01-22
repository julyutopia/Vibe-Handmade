//
//  SearchShowTopicsViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/1/22.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "SearchShowTopicsViewController.h"

@interface SearchShowTopicsViewController ()

@end

@implementation SearchShowTopicsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNaviBar];
    [self initTableview];
    [self setDataContent];
}


-(void)initNaviBar
{
    [self.backBtn setHidden:NO];
    [self.titleLabel setText:[NSString stringWithFormat:@"关于'%@'的商品搜索结果",self.searchKeyword]];
}


-(void)initTableview
{
    _resultsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_resultsTableView setBackgroundView:nil];
    [_resultsTableView setBackgroundColor:[UIColor clearColor]];
    [_resultsTableView setDelegate:self];
    [_resultsTableView setDataSource:self];
    [_resultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_resultsTableView setShowsVerticalScrollIndicator:NO];
    _resultsTableView.contentInset = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    _resultsTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview +10, 0, 0, 0);
    [self.view insertSubview:_resultsTableView belowSubview:self.topNavView];
    
    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
}


#pragma mark -tableview delegate & datasource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==1 && _topicsArray.count) {
        return _topicsArray.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==1) {
        return 15;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section ==1) {
        return _sectionFooterView;
    }
    return nil;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_topicsArray.count) {
        
        if (indexPath.section == 0) {
            
            NSString * identifierString = @"SearchTopiRoundHeadercCellIdentifier";
            SearchTopicRoundHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchTopicRoundHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            
            return cell;
        }
        
        else{
            NSString * identifierString = @"SearchTopicCellIdentifier";
            SearchTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                cell = [[SearchTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell setBackgroundColor:[UIColor clearColor]];
                [cell setBackgroundView:nil];
            }
            [cell setDelegate:self];
            
            BOOL isLast = NO;
            if (indexPath.row == _topicsArray.count -1) {
                isLast = YES;
            }
            
            VibeTopicModal * modal = [_topicsArray objectAtIndex:indexPath.row];
            [cell setSearchTopicCellWithModal:modal IsLast:isLast];
            
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
        return 10;
    }
    
    if (indexPath.section ==1 && _topicsArray.count) {
        float heightt = (kScreenWidth -40)/3 +10;
        return heightt;
    }
    
    return 0;
}


-(void)setDataContent
{
    if (!_topicsArray) {
        _topicsArray = [[NSMutableArray alloc]init];
    }
    
    VibeTopicModal * topicModal1 = [[VibeTopicModal alloc]init];
    [topicModal1 setTopicImgURL:@"http://p1.bpimg.com/567571/ee75e81e22b17865.png"];
    [topicModal1 setTopicTitle:@"迷醉于土耳其的绚丽多彩"];
    [topicModal1 setTopicID:[NSNumber numberWithInteger:1]];
    NSArray * tagArray1 = [NSArray arrayWithObjects:@"旅行",@"民族风",@"土耳其",@"异域", nil];
    topicModal1.topicTagsArray = [NSArray arrayWithArray:tagArray1];
    [topicModal1 setTopicLookedNumber:[NSNumber numberWithInteger:873]];
    [topicModal1 setTopicFavorNumber:[NSNumber numberWithInteger:302]];
    
    VibeTopicModal * topicModal2 = [[VibeTopicModal alloc]init];
    [topicModal2 setTopicImgURL:@"http://p1.bpimg.com/567571/aec75762d5f7a4c0.png"];
    [topicModal2 setTopicTitle:@"食之精,器之美"];
    [topicModal2 setTopicID:[NSNumber numberWithInteger:2]];
    NSArray * tagArray2 = [NSArray arrayWithObjects:@"家居",@"美食与爱",@"木器", nil];
    topicModal2.topicTagsArray = [NSArray arrayWithArray:tagArray2];
    [topicModal2 setTopicLookedNumber:[NSNumber numberWithInteger:257]];
    [topicModal2 setTopicFavorNumber:[NSNumber numberWithInteger:51]];
    
    VibeTopicModal * topicModal3 = [[VibeTopicModal alloc]init];
    [topicModal3 setTopicImgURL:@"http://p1.bpimg.com/567571/a7d8dfbccdee4778.png"];
    [topicModal3 setTopicTitle:@"自由肆意的吉普赛风情"];
    [topicModal3 setTopicID:[NSNumber numberWithInteger:3]];
    NSArray * tagArray3 = [NSArray arrayWithObjects:@"首饰",@"手工原创",@"部落风", nil];
    topicModal3.topicTagsArray = [NSArray arrayWithArray:tagArray3];
    [topicModal3 setTopicLookedNumber:[NSNumber numberWithInteger:2416]];
    [topicModal3 setTopicFavorNumber:[NSNumber numberWithInteger:1632]];
    
    [_topicsArray addObject:topicModal1];
    [_topicsArray addObject:topicModal2];
    [_topicsArray addObject:topicModal3];
    [_topicsArray addObject:topicModal1];
    [_topicsArray addObject:topicModal2];
    [_topicsArray addObject:topicModal3];
    [_topicsArray addObject:topicModal1];
    [_topicsArray addObject:topicModal2];
    [_topicsArray addObject:topicModal3];
    
    [_resultsTableView reloadData];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
