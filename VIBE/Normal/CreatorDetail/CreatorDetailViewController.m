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
    
    if (indexPath.section == 1) {
        
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
    
    return 0;
}




#pragma mark -设置假数据
-(void)setDataContent
{
    CreatorDetailModal * modal = [[CreatorDetailModal alloc]init];
    
//    @property (nonatomic, copy) NSString * creatorTitle;        //标题
//    @property (nonatomic, copy) NSNumber * creatorID;           //id
//    @property (nonatomic, assign)NSInteger creatorOpenType;     //打开类型
//    @property (nonatomic, copy) NSString * creatorImgURL;       //图片地址
//    @property (nonatomic, copy) NSString * creatorShopName;     //店铺名字
//    @property (nonatomic, copy) NSNumber * creatorLookedNumber; //已查看专题人数
//    @property (nonatomic, copy) NSNumber * creatorFavorNumber;  //已喜欢专题人数
//    @property (nonatomic, copy) NSNumber * creatorDetailIsUserFavored;//用户是否已收藏该专题
//    @property (nonatomic, copy) NSArray  * creatorDetailInfoArray;//详情的图文混排
//    @property (nonatomic, copy) NSArray  * creatorRelatedProductArray;//专题相关的产品
//    @property (nonatomic, copy) NSArray  * creatorDetailBottomInfoArray;//专题底部的图片信息
    
    modal.creatorTitle = @"灵性能量手工饰品，连接天地间的语言祈祷及祝愿";
    modal.creatorImgURL = @"http://oih52ss9e.bkt.clouddn.com/Bohemian-jewelry-16.jpg";
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
    [infoDict1 setObject:@"http://p1.bqimg.com/567571/574a7bf524761c47.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict2 = [NSMutableDictionary dictionary];
    [infoDict2 setObject:Detail_Show_Text_Small forKey:@"type"];
    [infoDict2 setObject:@"宇宙的一切秘密与两件事有关，一是算术，一是几何。/n/n我们的一生也许都被两种情绪所羁绊/n对生活的不可知性、神秘感到害怕，/n/n又想把这个神秘的不可知性加以揭露，解释其含义，/n描绘其壮观。于是，神秘学应运而生。/n/n几何自然而然地成了人们剖开这些未知秘密的利器。" forKey:@"content"];
    
    [infoArray addObject:infoDict0];
    [infoArray addObject:infoDict1];
    [infoArray addObject:infoDict2];
    
    modal.creatorDetailInfoArray = infoArray;
    
    _creatorModal = modal;
    
    [_creatorDetailTable reloadData];
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
