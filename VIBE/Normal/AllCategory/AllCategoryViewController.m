//
//  AllCategoryViewController.m
//  VIBE
//
//  Created by Li Haii on 16/9/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "AllCategoryViewController.h"

#import "CategoryModal.h"

@interface AllCategoryViewController ()

@end

@implementation AllCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DefaultBackgroundColor];
    [self.topNavView setAlpha:0.0f];
    
    _categoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_categoryTableView setBackgroundView:nil];
    [_categoryTableView setBackgroundColor:[UIColor clearColor]];
    [_categoryTableView setDelegate:self];
    [_categoryTableView setDataSource:self];
    [_categoryTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _categoryTableView.contentInset = UIEdgeInsetsMake(height_headerview, 0, 0, 0);
    _categoryTableView.scrollIndicatorInsets = UIEdgeInsetsMake(height_headerview, 0, 0, 0);
    [self.view addSubview:_categoryTableView];
    
    
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [headView setBackgroundColor:RGBA(0, 189,  156, 60)];
    [self.view addSubview:headView];
    
    _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
    [_footerView setBackgroundColor:[UIColor clearColor]];
    
    
    [self.view bringSubviewToFront:self.topNavView];
    [self.view bringSubviewToFront:self.backBtn];
    [self.view bringSubviewToFront:self.titleLabel];
    
    [self.titleLabel setText:@"全部分类"];
    [self.titleLabel setTextColor:DefaultGreen];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Green"] forState:UIControlStateNormal];
    
    _categoryArray = [[NSMutableArray alloc]init];
    
    [self setContent];
}


-(void)setContent
{
    CategoryModal * modal1 = [[CategoryModal alloc]init];
    [modal1 setCategoryImgURL:@"https://img1.etsystatic.com/067/1/5298684/il_570xN.752968253_q8qx.jpg"];
    [modal1 setCategoryTitle:@"女装"];
    
    CategoryModal * modal2 = [[CategoryModal alloc]init];
    [modal2 setCategoryImgURL:@"https://img0.etsystatic.com/100/0/11453728/il_570xN.834016056_3oxa.jpg"];
    [modal2 setCategoryTitle:@"男装"];
    
    CategoryModal * modal3 = [[CategoryModal alloc]init];
    [modal3 setCategoryImgURL:@"https://img1.etsystatic.com/124/0/11585166/il_570xN.1081585567_4f7o.jpg"];
    [modal3 setCategoryTitle:@"身体护理"];
   
    CategoryModal * modal4 = [[CategoryModal alloc]init];
    [modal4 setCategoryImgURL:@"https://img0.etsystatic.com/104/0/12938933/il_570xN.1017733046_2b3n.jpg"];
    [modal4 setCategoryTitle:@"箱包"];
    
    CategoryModal * modal5 = [[CategoryModal alloc]init];
    [modal5 setCategoryImgURL:@"https://img1.etsystatic.com/128/1/11152706/il_570xN.1083053895_eybx.jpg"];
    [modal5 setCategoryTitle:@"饰品"];
    
    CategoryModal * modal6 = [[CategoryModal alloc]init];
    [modal6 setCategoryImgURL:@"https://img0.etsystatic.com/111/1/5986677/il_570xN.1031959460_sw7v.jpg"];
    [modal6 setCategoryTitle:@"家居"];
    
    CategoryModal * modal7 = [[CategoryModal alloc]init];
    [modal7 setCategoryImgURL:@"https://img0.etsystatic.com/137/0/6976276/il_570xN.999365592_mi09.jpg"];
    [modal7 setCategoryTitle:@"鞋靴"];
    
    [_categoryArray addObject:modal1];
    [_categoryArray addObject:modal2];
    [_categoryArray addObject:modal3];
    [_categoryArray addObject:modal4];
    [_categoryArray addObject:modal5];
    [_categoryArray addObject:modal6];
    [_categoryArray addObject:modal7];
    
    [_categoryTableView reloadData];
}


#pragma mark -TableView DataSource
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _footerView;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _categoryArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_categoryArray.count) {
        
        AllCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllCategoryTableViewCellIdentifier"];
        if (cell == nil) {
            cell = [[AllCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AllCategoryTableViewCellIdentifier"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        CategoryModal * modal = [_categoryArray objectAtIndex:indexPath.section];
        
        CGFloat yOffset = ((_categoryTableView.contentOffset.y - cell.frame.origin.y) / kScreenWidth/2) * IMAGE_OFFSET_SPEED;
        cell.imageOffset = CGPointMake(0.0f, yOffset);

        [cell setCategoryCellWithName:modal.categoryTitle imgUrl:modal.categoryImgURL ID:[modal.categoryID integerValue]];
        
        
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
    return kScreenWidth/2;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offSetY = scrollView.contentOffset.y;
    NSLog(@"~~~~~ %g ~~~~~", -(offSetY/100.0f));
    
    if (offSetY >= -50) {
        
        if (offSetY < 0) {
            [self.titleLabel setAlpha: -(offSetY/100.0f)];
            [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
        }
        else{
            [self.titleLabel setAlpha:0.0f];
            [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Green_Round"] forState:UIControlStateNormal];
        }
    }
    else{
        [self.titleLabel setAlpha:1.0f];
        [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    }
}



#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
