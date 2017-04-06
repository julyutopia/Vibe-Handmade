//
//  CreatorDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/3/21.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "CreatorDetailViewController.h"

@interface CreatorDetailViewController ()

@end

@implementation CreatorDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    _creatorDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_creatorDetailTable setBackgroundView:nil];
    [_creatorDetailTable setBackgroundColor:[UIColor clearColor]];
    [_creatorDetailTable setDelegate:self];
    [_creatorDetailTable setDataSource:self];
    [_creatorDetailTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_creatorDetailTable setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_creatorDetailTable];
    

    [self.topNavView setAlpha:0.0f];
    [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    [self.view bringSubviewToFront:self.topNavView];
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    self.backBtn.layer.shadowColor = RGBA(0, 0, 0, 80).CGColor;//shadowColor阴影颜色
    self.backBtn.layer.shadowOffset = CGSizeMake(2,2);
    self.backBtn.layer.shadowOpacity = 0.8;
    self.backBtn.layer.shadowRadius = 4;
    [self.view bringSubviewToFront:self.backBtn];

    
    [self setDataContent];

}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return _creatorModal.creatorDetailInfoArray.count;
    }
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //封图
    if (indexPath.section == 0) {
        
        NSString * identifier = @"CreatorHeaderTableViewCellIdentifier";
        CreatorHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CreatorHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        [cell setHeaderCellWithURL:_creatorModal.creatorImgURL];
        
        return cell;
    }
    
    //标题
    if (indexPath.section == 1) {
        
        NSString * identifier = @"CreatorTitleTableViewCellIdentifier";
        CreatorTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CreatorTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        
        [cell setCreatorDetailTitleCellWithModal:_creatorModal];
        
        return cell;
    }
    
    //显示内容
    if (indexPath.section == 2) {
        
        NSString * identifier = @"CreatorInfoShowTableViewCellIdentifier";
        CreatorInfoShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CreatorInfoShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        
        BOOL isLastCell = NO;
        if (indexPath.row == _creatorModal.creatorDetailInfoArray.count -1) {
            isLastCell = YES;
        }
        
        NSDictionary * infoDict = [_creatorModal.creatorDetailInfoArray objectAtIndex:indexPath.row];
        [cell setCreatorDetailShowTableCellWithInfo:infoDict IsLastCell:isLastCell];
        
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
        
        float headerHeight = kScreenWidth/16 *9;
        return headerHeight;
    }
    
    
    if (indexPath.section == 1) {
        float titleHeight = [_creatorModal.creatorTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:[VibeFont fontWithName:Default_Font_Middle size:16]].height;
        
        float showInfoViewHeight = 15;

        return 20 +titleHeight +15 +showInfoViewHeight +20 +20;
    }
    
    
    if (indexPath.section == 2 && _creatorModal.creatorDetailInfoArray.count) {
        
        NSDictionary * dict = [_creatorModal.creatorDetailInfoArray objectAtIndex:indexPath.row];
        
        NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
        NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];
        
        float lastCellHeight = 0;
        if (indexPath.row == _creatorModal.creatorDetailInfoArray.count -1) {
            lastCellHeight = 5.0f;
        }
        
        if ([type isEqualToString:Detail_Show_Text_Small]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Small size:14] Content:content LineSpace:5.0] +lastCellHeight;
        }
        else if ([type isEqualToString:Detail_Show_Text_Middle]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font size:15] Content:content LineSpace:5.0] +lastCellHeight;
        }
        else if ([type isEqualToString:Detail_Show_Text_Bold]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Middle size:16] Content:content LineSpace:6.0] +lastCellHeight;
        }
        else if ([type isEqualToString:Detail_Show_Image]) {
            
            CreatorInfoShowTableViewCell *cell = (CreatorInfoShowTableViewCell *)[self tableView:_creatorDetailTable cellForRowAtIndexPath:indexPath];
            
            float heighttt = cell.imageHeight +lastCellHeight;
            return heighttt;
        }
        
    }
    
    return 0;
}


#pragma mark - 计算显示内容Cell的文字高度
//计算cell的文字高度
-(float )calculateCellTextHeightWithFont:(UIFont *)font Content:(NSString *)content LineSpace:(CGFloat )space
{
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:content withFont:font withWidth:kScreenWidth -30 withLineSpacing:space];
    
    return labelHeght +10;
}



#pragma mark -设置假数据
-(void)setDataContent
{
    CreatorDetailModal * modal = [[CreatorDetailModal alloc]init];
    
    modal.creatorTitle = @"灵性能量手工饰品，连接天地间的语言祈祷及祝愿";
    modal.creatorImgURL = @"http://oih52ss9e.bkt.clouddn.com/Bohemian-jewelry-15.jpg";
    modal.creatorShopName = @"香巴拉Creation";
    
    modal.creatorLookedNumber = [NSNumber numberWithInteger:1504];
    modal.creatorFavorNumber = [NSNumber numberWithInteger:365];
    
    modal.creatorDetailIsUserFavored = [NSNumber numberWithBool:0];
    
    NSMutableArray  * infoArray = [[NSMutableArray alloc]init];
 
    NSMutableDictionary * infoDict0 = [NSMutableDictionary dictionary];
    [infoDict0 setObject:Detail_Show_Text_Bold forKey:@"type"];
    [infoDict0 setObject:@"宇宙的镜子" forKey:@"content"];
    
    NSMutableDictionary * infoDict1 = [NSMutableDictionary dictionary];
    [infoDict1 setObject:Detail_Show_Image forKey:@"type"];
    [infoDict1 setObject:@"http://oih52ss9e.bkt.clouddn.com/sg.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict2 = [NSMutableDictionary dictionary];
    [infoDict2 setObject:Detail_Show_Text_Small forKey:@"type"];
    [infoDict2 setObject:@"宇宙的一切秘密与两件事有关，一是算术，一是几何。\n\n我们的一生也许都被两种情绪所羁绊\n对生活的不可知性、神秘感到害怕，\n\n又想把这个神秘的不可知性加以揭露，解释其含义，\n描绘其壮观。于是，神秘学应运而生。\n\n几何自然而然地成了人们剖开这些未知秘密的利器。" forKey:@"content"];
    
    
    NSMutableDictionary * infoDict3 = [NSMutableDictionary dictionary];
    [infoDict3 setObject:Detail_Show_Text_Middle forKey:@"type"];
    [infoDict3 setObject:@"即使在今天，几何形状被认为是不同的真理或精神信仰的重要标志。\n\n作为一个例子，在圆被认为是该符号的宇宙、 团结、 永恒、 平衡。所以，神圣几何学也揭示通过各种符咒，被认为能够带来好运气的对象本身。\n\n某些几何符号形状被看作是具有超自然能力，保护所有者或给他的能力或权力像内在的和平，勇气、 自尊、 自我平衡 … …符咒是历来重视对其外部的美丽方面，如珠宝首饰，但特别是由于其积极的能量和愈合质量。" forKey:@"content"];
    
    NSMutableDictionary * infoDict4 = [NSMutableDictionary dictionary];
    [infoDict4 setObject:Detail_Show_Image forKey:@"type"];
    [infoDict4 setObject:@"http://oih52ss9e.bkt.clouddn.com/ankh5.jpg" forKey:@"content"];
    
    
    [infoArray addObject:infoDict0];
    [infoArray addObject:infoDict1];
    [infoArray addObject:infoDict2];
    [infoArray addObject:infoDict3];
    [infoArray addObject:infoDict4];
    
    
    modal.creatorDetailInfoArray = infoArray;
    
    _creatorModal = modal;
    
    [_creatorDetailTable reloadData];

}



#pragma mark -scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_creatorDetailTable]) {
        
        CGFloat offsetY = scrollView.contentOffset.y -50;
        
        NSLog(@"__________%g_________",offsetY);
        
//        CGFloat offsetHeaderView = _headerViewHeight + offsetY;
//        if (offsetHeaderView < 0) {
//            CGRect headerViewframe = _headerView.frame;
//            headerViewframe.size.height = _headerViewHeight - offsetHeaderView;
//            headerViewframe.origin.y = -_headerViewHeight + offsetHeaderView;
//            _headerView.frame = headerViewframe;
//            
//            CGRect headerImgViewFrame = _headerImgView.frame;
//            headerImgViewFrame.size.height = _headerImgViewHeight - offsetHeaderView;
//            _headerImgView.frame = headerImgViewFrame;
//            
//            CGRect headerInfoViewFrame = _headerInfoView.frame;
//            headerInfoViewFrame.origin.y = headerViewframe.size.height -headerInfoViewFrame.size.height;
//            _headerInfoView.frame = headerInfoViewFrame;
//        }
        
        if (offsetY >= -kScreenWidth/16 *9 +80) {
            [self showNaviViewAnimation];
        }
        else {
            [self hideNaviViewAnimation];
        }
        
    }
}



#pragma mark -显示&隐藏导航栏
-(void)showNaviViewAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.topNavView setAlpha:1.0f];
        [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, height_headerview)];
        
    } completion:^(BOOL finished) {
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [self.titleLabel setAlpha:1.0f];
        
        [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back_Black"] forState:UIControlStateNormal];
        self.backBtn.layer.shadowOpacity = 0.0;
        
        [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Topic_Detail_Favor_Black"] forState:UIControlStateNormal];
        self.rightButton.layer.shadowOpacity = 0.0;
        
    }];
}

-(void)hideNaviViewAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.topNavView setAlpha:0.0f];
        [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        
    } completion:^(BOOL finished) {
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [self.titleLabel setAlpha:0.0f];
        
        [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
        self.backBtn.layer.shadowOpacity = 0.8;
        
        [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Topic_Detail_Favor"] forState:UIControlStateNormal];
        self.rightButton.layer.shadowOpacity = 0.8;
    }];
    
}



#pragma mark -ViewWillApear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
