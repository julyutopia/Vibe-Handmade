//
//  CategoryListViewController.m
//  VIBE
//
//  Created by Li Haii on 2016/12/24.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "CategoryListViewController.h"

@interface CategoryListViewController ()

@end

@implementation CategoryListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.line setHidden:YES];
    [self setIsWideNaviView:YES];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Category_List_Filter"] forState:UIControlStateNormal];
    
    
//    _categoryProductsListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [_categoryProductsListTable setBackgroundView:nil];
//    [_categoryProductsListTable setBackgroundColor:[UIColor clearColor]];
//    [_categoryProductsListTable setDelegate:self];
//    [_categoryProductsListTable setDataSource:self];
//    [_categoryProductsListTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    _categoryProductsListTable.contentInset = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
//    _categoryProductsListTable.scrollIndicatorInsets = UIEdgeInsetsMake(Wide_Navi_View_Height, 0, 0, 0);
//    [self.view addSubview:_categoryProductsListTable];
    
    [self setContentData];
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionFillOrderCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FunctionFillOrderCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}






#pragma mark -设置假数据
-(void)setContentData
{
    _categoryDetailModal = [[CategoryModal alloc]init];
    
    [_categoryDetailModal setCategoryTitle:@"女装"];
    
    NSMutableDictionary * detailDict0 = [[NSMutableDictionary alloc]init];
    [detailDict0 setObject:@"全部分类" forKey:@"categorySetName"];
 
    NSMutableDictionary * detailDict1 = [[NSMutableDictionary alloc]init];
    [detailDict1 setObject:@"T恤" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict2 = [[NSMutableDictionary alloc]init];
    [detailDict2 setObject:@"外套" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict3 = [[NSMutableDictionary alloc]init];
    [detailDict3 setObject:@"背心" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict4 = [[NSMutableDictionary alloc]init];
    [detailDict4 setObject:@"裙" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict5 = [[NSMutableDictionary alloc]init];
    [detailDict5 setObject:@"裤子" forKey:@"categorySetName"];
    
    NSMutableDictionary * detailDict6 = [[NSMutableDictionary alloc]init];
    [detailDict6 setObject:@"配饰" forKey:@"categorySetName"];
    
    NSMutableArray * setArray = [[NSMutableArray alloc]initWithObjects:detailDict0, detailDict1, detailDict2, detailDict3,
                                                                        detailDict4, detailDict5, detailDict6, nil];
    _categoryDetailModal.categorySetArray = setArray;
    
    [self.titleLabel setText:_categoryDetailModal.categoryTitle];
    
    if (!_categorySetSegment) {
        
        NSMutableArray * setArray = [[NSMutableArray alloc]init];
        for (int i =0; i <_categoryDetailModal.categorySetArray.count; i++) {
            
            NSDictionary * dict = [_categoryDetailModal.categorySetArray objectAtIndex:i];
            NSString * setName = [dict objectForKey:@"categorySetName"];
            [setArray addObject:setName];
        }
        
        _categorySetSegment = [[YUSegment alloc]initWithTitles:setArray style:YUSegmentStyleLine];
        [_categorySetSegment setFrame:CGRectMake(15, Wide_Navi_View_Height - 44, kScreenWidth -30, 44)];
        [_categorySetSegment setSegmentWidth:68.0f];
        [_categorySetSegment.indicator setBackgroundColor:DefaultPinkColor];
        [_categorySetSegment addTarget:self action:@selector(categorySetNameDidChange) forControlEvents:UIControlEventValueChanged];

        [self.topNavView addSubview:_categorySetSegment];
        
    }
    
}


-(void)categorySetNameDidChange
{
    NSLog(@"______  %ld  _____",_categorySetSegment.selectedIndex);
}


#pragma mark -POP
-(void)popBack
{
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
