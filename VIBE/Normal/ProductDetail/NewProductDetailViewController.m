//
//  NewProductDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/2/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "NewProductDetailViewController.h"

@interface NewProductDetailViewController ()

@end

@implementation NewProductDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _blurImgView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_blurImgView];
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:self.view.frame];
    [backView setEffect:blurEffect];
    [self.view addSubview:backView];
 
    _contentBackView = [[UIView alloc]initWithFrame:CGRectMake(10, 20, kScreenWidth -20, kScreenHeight -30)];
    [_contentBackView setBackgroundColor:RGBA(255, 255, 255, 100)];
    [_contentBackView.layer setCornerRadius:8];
    [_contentBackView.layer setMasksToBounds:YES];
    [_contentBackView setUserInteractionEnabled:YES];
    [self.view addSubview:_contentBackView];

  
    
    //初始化tableView
    _productTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, kScreenHeight -30)];
    [_productTableview setBackgroundView:nil];
    [_productTableview setBackgroundColor:[UIColor clearColor]];
    [_productTableview setDelegate:self];
    [_productTableview setDataSource:self];
    [_productTableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_productTableview setShowsVerticalScrollIndicator:NO];
    [_contentBackView addSubview:_productTableview];
    
    
    
    //底部信息栏
    _bottomViewHeight = 58;
    
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight -30 -_bottomViewHeight, kScreenWidth -20, _bottomViewHeight)];
    [_bottomView setBackgroundColor:RGBA(255, 255, 255, 80)];
    [_contentBackView addSubview:_bottomView];
    
    
    UIBlurEffect * bottomBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * bottomEffectView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, _bottomViewHeight)];
    [bottomEffectView setEffect:bottomBlurEffect];
    [_bottomView addSubview:bottomEffectView];
    
    
    UIView * bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, 0.5)];
    [bottomLine setBackgroundColor:RGBA(231, 231, 231, 20)];
    [_bottomView addSubview:bottomLine];
    
    //显示价格
    _showMoneyView = [[VibeShowMoneyView alloc]init];
    _showMoneyView.isShowMoneyMiddle = YES;
    [_bottomView addSubview:_showMoneyView];
    
    
    _buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -20 -20 -94, (_bottomViewHeight -30)/2, 92, 30)];
    [_buyBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Link"] forState:UIControlStateNormal];
    [_buyBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Link_HighLight"] forState:UIControlStateHighlighted];
    [_bottomView addSubview:_buyBtn];
    
    [_buyBtn.layer setShadowOffset:CGSizeMake(1, 1)];
    [_buyBtn.layer setShadowColor:RGBA(180, 180, 194, 40).CGColor];
    [_buyBtn.layer setShadowRadius:1.0f];
    [_buyBtn.layer setShadowOpacity:0.8f];
    
    _favorBtn = [[UIButton alloc]initWithFrame:CGRectMake(_buyBtn.frame.origin.x -20 -86, (_bottomViewHeight -32)/2, 86, 32)];
    [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Favor"] forState:UIControlStateNormal];
    [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Favor_HighLight"] forState:UIControlStateHighlighted];
    [_bottomView addSubview:_favorBtn];
    
    //底部的FooterView
    _tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, 30 +_bottomViewHeight)];
    [_tableFooterView setBackgroundColor:RGBA(255, 255, 255, 95)];
    [_productTableview setTableFooterView:_tableFooterView];

    
    [self setContentData];
    
    //返回键
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    self.backBtn.layer.shadowColor = RGBA(0, 0, 0, 40).CGColor;//shadowColor阴影颜色
    self.backBtn.layer.shadowOffset = CGSizeMake(2,2);
    self.backBtn.layer.shadowOpacity = 0.8;
    self.backBtn.layer.shadowRadius = 4;
    [self.view bringSubviewToFront:self.backBtn];
 
}

#pragma mark -Delegate & Datasource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_productDetailModal.productGuessProductArray.count) {
        return 6;
    }
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_productDetailModal.productDetailInfoArray.count && section ==3) {
        return _productDetailModal.productDetailInfoArray.count;
    }
    if (_productDetailModal.productGuessProductArray.count && section ==5) {
        return _productDetailModal.productGuessProductArray.count;
    }
    return 1;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (_productDetailModal.productGuessProductArray.count && section ==5) {
//        return _bottomViewHeight;
//    }
//    else if(section == 3){
//        return _bottomViewHeight;
//    }
//    return 0;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    if (_productDetailModal.productGuessProductArray.count && section ==5) {
//        return _bottomView;
//    }
//    else if (section ==3){
//        return _bottomView;
//    }
//    return nil;
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Banner大图，标题
    if (indexPath.section == 0) {
        
        NSString * identifierString = @"ProductDetailBannerCellIdentifier";
        ProductDetailHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ProductDetailHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setProductDetailHeaderCellWithModal:_productDetailModal];
        
        return cell;
    }
    
    //标签 & 已被收藏数
    if (indexPath.section == 1) {
        NSString * identifierString = @"ProductDetailTagCellIdentifier";
        ProductDetailTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ProductDetailTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setDetailTagCellWithModal:_productDetailModal];
        
        return cell;
    }
    
    //详情标题
    if (indexPath.section == 2) {
        NSString * identifierString = @"ProductDetailInfoCellIdentifier";
        ProductDetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ProductDetailInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
    //显示详情内容
    if (indexPath.section == 3) {
        
        NSString * identifierString = @"ProductDetailShowCellIdentifier";
        ProductDetailShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            
            cell = [[ProductDetailShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        NSDictionary * dict = [_productDetailModal.productDetailInfoArray objectAtIndex:indexPath.row];
        [cell setDetailShowTableCellWithInfo:dict];
        
        return cell;
    }
    
    //显示相关推荐
    if (_productDetailModal.productGuessProductArray.count) {
        
        //标题
        if (indexPath.section ==4) {
            NSString * identifierString = @"ProductDetailGuessHeaderCellIdentifier";
            ProductDetailGuessHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                
                cell = [[ProductDetailGuessHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                [cell setBackgroundView:nil];
                [cell setBackgroundColor:[UIColor clearColor]];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            return cell;
        }
        //猜你喜欢
        if (indexPath.section == 5) {
            NSString * identifierString = @"ProductDetailGuessProductCellIdentifier";
            ProductDetailGuessProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
            if (cell == nil) {
                
                cell = [[ProductDetailGuessProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
                [cell setBackgroundView:nil];
                [cell setBackgroundColor:[UIColor clearColor]];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            VibeProductModal * modal = [_productDetailModal.productGuessProductArray objectAtIndex:indexPath.row];
            
            BOOL isLast = NO;
            if (indexPath.row == _productDetailModal.productGuessProductArray.count -1) {
                isLast = YES;
            }
            [cell setGuessProductWithModal:modal IsLast:isLast];
            
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

        float width = kScreenWidth -20;
        float height = width/16*9;
 
        NSString * productName = _productDetailModal.productTitle;
        CGSize nameSize = [productName getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:[VibeFont fontWithName:Default_Font_Middle size:15]];

        return height +15 +nameSize.height +10;
    }
    
    if (indexPath.section == 1) {
        return 35;
    }
    
    if (indexPath.section == 2) {
        return 44;
    }

    if (indexPath.section ==3 && _productDetailModal.productDetailInfoArray.count) {
        
        NSDictionary * dict = [_productDetailModal.productDetailInfoArray objectAtIndex:indexPath.row];
        
        NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
        NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];
        
        if ([type isEqualToString:@"text_Small"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Small size:12] Content:content LineSpace:5.0];
        }
        else if ([type isEqualToString:@"text_Middle"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font size:13] Content:content LineSpace:5.0];
        }
        else if ([type isEqualToString:@"text_Bold"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font size:14] Content:content LineSpace:6.0];
        }
        
        return 0;
    }
    
    if (_productDetailModal.productGuessProductArray.count) {
        
        //标题
        if (indexPath.section == 4) {
            return 56;
        }
        //相关推荐产品
        if (indexPath.section ==5) {
            
            float imageViewHeight = 60;
            
            //最后一行
            if (indexPath.row == _productDetailModal.productGuessProductArray.count -1) {
                return imageViewHeight +20 +5;
            }
            else{
                return imageViewHeight +20;
            }
        }
    }
    
    
    return 0;
}


#pragma mark -scrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_productTableview]) {
        
        float offSetY = scrollView.contentOffset.y;
        
        if (offSetY <=0) {
            [_contentBackView setBackgroundColor:[UIColor clearColor]];
        }
        else{
            [_contentBackView setBackgroundColor:RGBA(255, 255, 255, 100)];
        }
        
    }
}




#pragma mark - 设置数据
-(void)setContentData
{
    _productDetailModal = [[VibeProductModal alloc]init];
    
    _productDetailModal.productTopImageUrlsArray = [NSArray arrayWithObjects:
                                                    @"https://gd3.alicdn.com/bao/uploaded/i3/TB1DR8oIVXXXXXEXVXXXXXXXXXX_!!0-item_pic.jpg",
                                                    @"https://gd4.alicdn.com/imgextra/i4/TB1ywyTHVXXXXamXXXXXXXXXXXX_!!0-item_pic.jpg",
                                                    @"https://gd4.alicdn.com/imgextra/i4/56900907/TB2r8jnXVXXXXcxXXXXXXXXXXXX_!!56900907.jpg",
                                                    @"https://gd2.alicdn.com/imgextra/i2/56900907/TB2b86nXVXXXXX3XXXXXXXXXXXX_!!56900907.jpg", nil];
    _productDetailModal.productTitle = @"北欧宜家IKEA风格手工编织羊毛地毯/基利姆kilim地毯沙发茶几地毯";
    _productDetailModal.productPrice = @"738.00";
    _productDetailModal.productStock = [NSNumber numberWithInteger:3];
    _productDetailModal.productFavorCount = [NSNumber numberWithInteger:129];
    
    
    [_blurImgView sd_setImageWithURL:[NSURL URLWithString:[_productDetailModal.productTopImageUrlsArray objectAtIndex:0]] placeholderImage:nil];
    
    NSMutableArray * tagsArray = [[NSMutableArray alloc]initWithObjects:@"地毯",@"基利姆",@"土耳其",@"家居", nil];
    _productDetailModal.productTagsArray = tagsArray;

    
    //详情描述
    NSMutableDictionary * infoDict0 = [NSMutableDictionary dictionary];
    [infoDict0 setObject:@"text_Middle" forKey:@"type"];
    [infoDict0 setObject:@"Kilim基利姆花毯是原产自土耳其、伊朗、巴基斯坦等地区的手织毛地毯，颜色鲜艳，毯面平滑柔软，颇受人们喜爱。" forKey:@"content"];
    
    NSMutableDictionary * infoDict1 = [NSMutableDictionary dictionary];
    [infoDict1 setObject:@"text_Bold" forKey:@"type"];
    [infoDict1 setObject:@"本产品为纯手工织造，结实耐用，但纯手工地毯在精准度上无法与机织产品相媲美，本款Kilim地毯厚度为3-5mm左右。" forKey:@"content"];

    NSMutableDictionary * infoDict2 = [NSMutableDictionary dictionary];
    [infoDict2 setObject:@"text_Small" forKey:@"type"];
    [infoDict2 setObject:@"重要特征\n \t- 地毯由技艺精湛的工匠手工编织而成，因此，独一无二。\n \t- 长纤维羊毛使得地毯特别耐用。\n \t- 羊毛天生就能防止尘土。\n \t- 两面都可以看见清晰的平织图案，使得地毯可以两面翻转使用。\n \t- 平织地毯，易于保持清洁，而且椅子可以轻松地移进移出。" forKey:@"content"];
    
    NSMutableArray * detailInfoArray = [[NSMutableArray alloc]init];
    [detailInfoArray addObject:infoDict0];
    [detailInfoArray addObject:infoDict1];
    [detailInfoArray addObject:infoDict2];
    _productDetailModal.productDetailInfoArray = detailInfoArray;
    
    
    //猜你喜欢
    VibeProductModal * modal1 = [[VibeProductModal alloc]init];
    modal1.productID = [NSNumber numberWithInteger:5];
    modal1.productImgURL = @"https://gd2.alicdn.com/bao/uploaded/i2/1770722776/TB2x7h3auTyQeBjSspaXXcjjFXa_!!1770722776.jpg";
    modal1.productTitle = @"拉美玛雅图腾 手工墙挂壁饰 孤品";
    modal1.productPrice = @"128.00";
    modal1.productFavorCount = [NSNumber numberWithInt:12];
    
    VibeProductModal * modal2 = [[VibeProductModal alloc]init];
    modal2.productID = [NSNumber numberWithInteger:6];
    modal2.productImgURL = @"https://gd3.alicdn.com/bao/uploaded/i3/51346374/TB25GOTbFXXXXa9XpXXXXXXXXXX_!!51346374.jpg";
    modal2.productTitle = @"订制手工印第安捕梦网传统风格嬉皮挂饰天然材质dream catcher";
    modal2.productPrice = @"248.00";
    modal2.productFavorCount = [NSNumber numberWithInt:231];
    
    VibeProductModal * modal3 = [[VibeProductModal alloc]init];
    modal3.productID = [NSNumber numberWithInteger:7];
    modal3.productImgURL = @"https://gd1.alicdn.com/bao/uploaded/i1/1033697014/TB20r1eaB6xQeBjSsziXXXxVVXa_!!1033697014.jpg";
    modal3.productTitle = @"小块阿富汗进口kilim挂毯装饰毯垫 民族方毯垫薄毯桌垫 手工现货";
    modal3.productPrice = @"36.00";
    modal3.productFavorCount = [NSNumber numberWithInt:3];
    
    NSMutableArray * guessArray = [[NSMutableArray alloc]init];
    [guessArray addObject:modal1];
    [guessArray addObject:modal2];
    [guessArray addObject:modal3];
    _productDetailModal.productGuessProductArray = guessArray;
    
    
    CGSize showMoneySize = [_showMoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:@"HelveticaNeue" size:15] GapWidth:2 PriceFont:[VibeFont fontWithName:@"HelveticaNeue" size:21] Price:_productDetailModal.productPrice TextColor:DefaultQYTextColor80];
    [_showMoneyView setFrame:CGRectMake(20, (_bottomViewHeight -showMoneySize.height)/2, showMoneySize.width, showMoneySize.height)];
    
    
    [_productTableview reloadData];
}


#pragma mark -计算显示文字详情的高度
-(float )calculateCellTextHeightWithFont:(UIFont *)font Content:(NSString *)content LineSpace:(CGFloat )space
{
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:content withFont:font withWidth:kScreenWidth -50 withLineSpacing:space];
    return  15 +labelHeght +2;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
