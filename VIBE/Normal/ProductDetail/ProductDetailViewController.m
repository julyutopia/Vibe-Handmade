//
//  ProductDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/25.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DefaultBackgroundColor];

    [self.lcNavigationController.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    UIView * viewwwww = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [viewwwww setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewwwww];
    
    _productDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_productDetailTable setBackgroundView:nil];
    [_productDetailTable setBackgroundColor:[UIColor clearColor]];
    [_productDetailTable setDelegate:self];
    [_productDetailTable setDataSource:self];
    [_productDetailTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_productDetailTable setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_productDetailTable];

    UIView * tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    [tableFooterView setBackgroundColor:[UIColor whiteColor]];
    [_productDetailTable setTableFooterView:tableFooterView];
    
    _sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    [_sectionFooterView setBackgroundColor:[UIColor clearColor]];
    
    
    float bottomViewHeight = 67;
  
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight -bottomViewHeight, kScreenWidth, bottomViewHeight)];
    [_bottomView.layer setShadowColor:RGBA(0, 0, 0, 30).CGColor];
    [_bottomView.layer setShadowOffset:CGSizeMake(0, -1)];
    [_bottomView.layer setShadowOpacity:0.4f];
    [_bottomView.layer setShadowRadius:6.0f];
    [_bottomView setBackgroundColor:RGBA(255, 255, 255, 95)];
    [self.view addSubview:_bottomView];
    
    
    UIView * bottomBlurView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight -bottomViewHeight, kScreenWidth, bottomViewHeight)];
    [bottomBlurView setBackgroundColor:RGBA(255, 255, 255, 10)];
    [self.view addSubview:bottomBlurView];
    
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView * blurView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, bottomViewHeight)];
    [blurView setEffect:effect];
    [bottomBlurView addSubview:blurView];
        

    _showMoneyView = [[VibeShowMoneyView alloc]init];
    _showMoneyView.isShowMoneyMiddle = YES;
    [_showMoneyView.moneyLabel.layer setShadowColor:RGBA(122, 122, 122,40).CGColor];
    [_showMoneyView.moneyLabel.layer setShadowOffset:CGSizeMake(0, 1)];
    [_showMoneyView.moneyLabel.layer setShadowRadius:4.0f];
    [_showMoneyView.moneyLabel.layer setShadowOpacity:0.8f];
    [_showMoneyView.priceLabel.layer setShadowColor:RGBA(122, 122, 122,40).CGColor];
    [_showMoneyView.priceLabel.layer setShadowOffset:CGSizeMake(0, 1)];
    [_showMoneyView.priceLabel.layer setShadowRadius:4.0f];
    [_showMoneyView.priceLabel.layer setShadowOpacity:0.8f];
    [bottomBlurView addSubview:_showMoneyView];
    
   
    float buyBtnWidth = 107;
    float buyBtnHeight = 35;
    
    float favorBtnWidth = 84;
    float favorBtnHeight = 35;
    
    _bottom_BuyBtn = [[UIButton alloc]initWithFrame:CGRectMake( kScreenWidth -buyBtnWidth -25, (bottomViewHeight -buyBtnHeight)/2, buyBtnWidth, buyBtnHeight)];
    [_bottom_BuyBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Bottom_Buy"] forState:UIControlStateNormal];
    [_bottom_BuyBtn.layer setShadowColor:RGBA(0, 0, 0, 10).CGColor];
    [_bottom_BuyBtn.layer setShadowOffset:CGSizeMake(0, 1)];
    [_bottom_BuyBtn.layer setShadowOpacity:0.4f];
    [_bottom_BuyBtn.layer setShadowRadius:6.0f];
    [bottomBlurView addSubview:_bottom_BuyBtn];
    
    
    _favorBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth -buyBtnWidth -25 -15 -favorBtnWidth, (bottomViewHeight -favorBtnHeight)/2, favorBtnWidth, favorBtnHeight)];
    [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Bottom_Favor"] forState:UIControlStateNormal];
    [_favorBtn.layer setShadowColor:RGBA(0, 0, 0, 10).CGColor];
    [_favorBtn.layer setShadowOffset:CGSizeMake(0, 1)];
    [_favorBtn.layer setShadowOpacity:0.4f];
    [_favorBtn.layer setShadowRadius:6.0f];
    [bottomBlurView addSubview:_favorBtn];
    

    
    [self.view bringSubviewToFront:self.topNavView];
    [self.topNavView setAlpha:0.0];
    
    _blackBackBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 27, 30, 30)];
    [_blackBackBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back_Black"] forState:UIControlStateNormal];
    [_blackBackBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    [_blackBackBtn setAlpha:0.0f];
    [self.view addSubview:_blackBackBtn];
    
    [self.view bringSubviewToFront:self.titleLabel];
    [self.titleLabel setAlpha:0.0f];
    [self.titleLabel setFrame:CGRectMake( kScreenWidth/2, height_headerview - 35, 0, 30)];

    
    [self.view bringSubviewToFront:self.backBtn];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    self.backBtn.layer.shadowColor = RGBA(0, 0, 0, 20).CGColor;//shadowColor阴影颜色
    self.backBtn.layer.shadowOffset = CGSizeMake(2,2);
    self.backBtn.layer.shadowOpacity = 0.8;
    self.backBtn.layer.shadowRadius = 4;


    [self setContentData];
}


-(void)favorBtnClicked
{
    //没有登录状态
    if ([VibeAppTool isUserLogIn] == NO) {
        
        VibeLogInViewController * logInVC = [[VibeLogInViewController alloc]init];
        logInVC.isPopUp = YES;        
        LCNavigationController * navi = [[LCNavigationController alloc]initWithRootViewController:logInVC];
        [self.lcNavigationController presentViewController:navi animated:YES completion:nil];
        
        return;
    }
    else
    {
    }
    
    NSLog(@"______点击收藏_______");
}


-(void)buyBtnClicked
{
    NSLog(@"______点击购买_______");    
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_productDetailModal.productGuessProductArray.count) {
        return 5;
    }
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==2 && _productDetailModal.productDetailInfoArray.count) {
        return _productDetailModal.productDetailInfoArray.count;
    }
    if (_productDetailModal.productGuessProductArray.count && section ==4) {
        return _productDetailModal.productGuessProductArray.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_productDetailModal.productGuessProductArray.count && section ==4) {
        return 20;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (_productDetailModal.productGuessProductArray.count && section ==4) {
        return _sectionFooterView;
    }
    return nil;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Banner大图，标题
    if (indexPath.section == 0) {
        
        NSString * identifierString = @"ProductDetailCellIdentifier";
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
    
    //信息Cell
    if (indexPath.section == 1) {
        
        NSString * identifierString = @"ProductDetailInfoCellIdentifier";
        ProductDetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ProductDetailInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setInfoCellWithPrice:_productDetailModal.productPrice AndTags:_productDetailModal.productTagsArray];
        
        return cell;
    }
    
    //详情Cell
    if (indexPath.section == 2 && _productDetailModal.productDetailInfoArray.count) {
        
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
    
    
    //相关推荐顶部Cell
    if (indexPath.section == 3 && _productDetailModal.productGuessProductArray.count) {
        
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
    
    //相关推荐产品Cell
    if (indexPath.section == 4 && _productDetailModal.productGuessProductArray.count) {
        
        NSString * identifierString = @"ProductDetailGuessCellIdentifier";
        ProductDetailGuessProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[ProductDetailGuessProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        BOOL isLast = NO;
        if (indexPath.row == _productDetailModal.productGuessProductArray.count -1) {
            isLast = YES;
        }
        VibeProductModal * modal = [_productDetailModal.productGuessProductArray objectAtIndex:indexPath.row];
        [cell setGuessProductWithModal:modal IsLast:isLast];
        
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
    if (indexPath.section == 0 && _productDetailModal.productTitle.length) {
        
        float height = kScreenWidth /16 *9;
        CGSize nameSize = [_productDetailModal.productTitle getSizeWithLimitSize:CGSizeMake(kScreenWidth -30, 100) withFont:[VibeFont fontWithName:Default_Font_Middle size:16]];
        float heightttt = height +15 +nameSize.height +10;
        return heightttt;
    }
    
    if (indexPath.section == 1) {
        
        return 25 +10 +14 +15;
    }
    
    if (indexPath.section ==2 && _productDetailModal.productDetailInfoArray.count) {

        NSDictionary * dict = [_productDetailModal.productDetailInfoArray objectAtIndex:indexPath.row];
        
        NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
        NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];
        
        if ([type isEqualToString:@"text_Small"]) {
           return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Small size:12] Content:content LineSpace:4.0];
        }
        else if ([type isEqualToString:@"text_Middle"]) {
           return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font size:13] Content:content LineSpace:4.0];
        }
        else if ([type isEqualToString:@"text_Bold"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Middle size:14] Content:content LineSpace:5.0];
        }
        else if ([type isEqualToString:@"image"]) {
            
            ProductDetailShowTableViewCell *cell = (ProductDetailShowTableViewCell *)[self tableView:_productDetailTable cellForRowAtIndexPath:indexPath];
            
            float heighttt = cell.imageHeight;
            return heighttt;            
        }
    }
    
    if (indexPath.section == 3 && _productDetailModal.productGuessProductArray.count) {
        return 15 +15 +16 +5;
    }
    
    if (indexPath.section == 4 && _productDetailModal.productGuessProductArray.count) {
        return 60 +20;
    }
    
    return 0;
}


-(float )calculateCellTextHeightWithFont:(UIFont *)font Content:(NSString *)content LineSpace:(CGFloat )space
{
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:content withFont:font withWidth:kScreenWidth -30 withLineSpacing:space];
    return labelHeght +5 +1;
}


-(void)shareBtnClicked
{

}



-(void)setContentData
{
    _productDetailModal = [[VibeProductModal alloc]init];
    
    _productDetailModal.productTopImageUrlsArray = [NSArray arrayWithObjects:
                                                    @"https://gd3.alicdn.com/bao/uploaded/i3/TB1DR8oIVXXXXXEXVXXXXXXXXXX_!!0-item_pic.jpg",
                                                    @"https://gd4.alicdn.com/imgextra/i4/TB1ywyTHVXXXXamXXXXXXXXXXXX_!!0-item_pic.jpg",
                                                    @"https://gd4.alicdn.com/imgextra/i4/56900907/TB2r8jnXVXXXXcxXXXXXXXXXXXX_!!56900907.jpg",
                                                    @"https://gd2.alicdn.com/imgextra/i2/56900907/TB2b86nXVXXXXX3XXXXXXXXXXXX_!!56900907.jpg", nil];
    _productDetailModal.productShopHeader = @"https://img.alicdn.com/bao/uploaded//83/1c/T1c_RqFrBXXXb1upjX.jpg_50x50.jpg";
    _productDetailModal.productShopName = @"东方编织";
    _productDetailModal.productShopAddress = @"石家庄，河北";
    _productDetailModal.productTitle = @"北欧宜家IKEA风格手工编织羊毛地毯/基利姆kilim地毯沙发茶几地毯";
    _productDetailModal.productPrice = @"738.00";
    _productDetailModal.productStock = [NSNumber numberWithInteger:3];
    _productDetailModal.productFavorCount = [NSNumber numberWithInteger:129];
    
    NSMutableArray * tagsArray = [[NSMutableArray alloc]initWithObjects:@"地毯",@"基利姆",@"土耳其",@"家居", nil];
    _productDetailModal.productTagsArray = tagsArray;
    
    
    //已被用户收藏
    if ([_productDetailModal.productIsUserFavored boolValue]) {
        [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Bottom_Favored"] forState:UIControlStateNormal];
    }
    //未被收藏
    else{
        [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Detail_Bottom_Favor"] forState:UIControlStateNormal];
    }

    
    //详情描述
    NSMutableArray * detailInfoArray = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * infoDict1 = [NSMutableDictionary dictionary];
    [infoDict1 setObject:@"text_Small" forKey:@"type"];
    [infoDict1 setObject:@"本产品为纯手工织造，结实耐用，但纯手工地毯在精准度上无法与机织产品相媲美，本款Kilim地毯厚度为3-5mm左右，有关产品的任何问题均可随时咨询店主 :-)祝您购物愉快！" forKey:@"content"];
    
    
    NSMutableDictionary * infoDict2 = [NSMutableDictionary dictionary];
    [infoDict2 setObject:@"image" forKey:@"type"];
    [infoDict2 setObject:@"https://gd1.alicdn.com/imgextra/i1/56900907/TB24ihebVXXXXX8XpXXXXXXXXXX-56900907.jpg" forKey:@"content"];

    
    NSMutableDictionary * infoDict3 = [NSMutableDictionary dictionary];
    [infoDict3 setObject:@"image" forKey:@"type"];
    [infoDict3 setObject:@"https://img.alicdn.com/imgextra/i4/56900907/TB2fBGqcVXXXXXhXXXXXXXXXXXX-56900907.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict4 = [NSMutableDictionary dictionary];
    [infoDict4 setObject:@"image" forKey:@"type"];
    [infoDict4 setObject:@"https://img.alicdn.com/imgextra/i3/56900907/TB2TICmcVXXXXapXXXXXXXXXXXX-56900907.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict6 = [NSMutableDictionary dictionary];
    [infoDict6 setObject:@"image" forKey:@"type"];
    [infoDict6 setObject:@"https://img.alicdn.com/imgextra/i4/56900907/TB26SqocVXXXXXMXXXXXXXXXXXX-56900907.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict7 = [NSMutableDictionary dictionary];
    [infoDict7 setObject:@"image" forKey:@"type"];
    [infoDict7 setObject:@"https://img.alicdn.com/imgextra/i1/56900907/TB21m1KcVXXXXatXXXXXXXXXXXX_!!56900907.jpg" forKey:@"content"];

    NSMutableDictionary * infoDict11 = [NSMutableDictionary dictionary];
    [infoDict11 setObject:@"text_Bold" forKey:@"type"];
    [infoDict11 setObject:@"重要特征\n \t- 地毯由技艺精湛的工匠手工编织而成，因此，独一无二。\n \t- 长纤维羊毛使得地毯特别耐用。\n \t- 羊毛天生就能防止尘土。\n \t- 两面都可以看见清晰的平织图案，使得地毯可以两面翻转使用。\n \t- 平织地毯，易于保持清洁，而且椅子可以轻松地移进移出。" forKey:@"content"];
    
    NSMutableDictionary * infoDict8 = [NSMutableDictionary dictionary];
    [infoDict8 setObject:@"image" forKey:@"type"];
    [infoDict8 setObject:@"https://img.alicdn.com/imgextra/i2/56900907/TB2X7SvcVXXXXbjXpXXXXXXXXXX_!!56900907.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict9 = [NSMutableDictionary dictionary];
    [infoDict9 setObject:@"image" forKey:@"type"];
    [infoDict9 setObject:@"https://gd4.alicdn.com/imgextra/i4/56900907/TB2nno.aFXXXXaaXXXXXXXXXXXX-56900907.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict12 = [NSMutableDictionary dictionary];
    [infoDict12 setObject:@"text_Middle" forKey:@"type"];
    [infoDict12 setObject:@"本产品为纯手工织造，结实耐用，但纯手工地毯在精准度上无法与机织产品相媲美，本款Kilim地毯厚度为3-5mm左右，有关产品的任何问题均可随时咨询店主 :-) \n祝您购物愉快！" forKey:@"content"];
    
    NSMutableDictionary * infoDict10 = [NSMutableDictionary dictionary];
    [infoDict10 setObject:@"image" forKey:@"type"];
    [infoDict10 setObject:@"https://img.alicdn.com/imgextra/i2/56900907/TB2oMxAcVXXXXXkXXXXXXXXXXXX_!!56900907.jpg" forKey:@"content"];
    
    [detailInfoArray addObject:infoDict1];
    [detailInfoArray addObject:infoDict2];
    [detailInfoArray addObject:infoDict3];
    [detailInfoArray addObject:infoDict4];
    [detailInfoArray addObject:infoDict8];
    [detailInfoArray addObject:infoDict9];
    [detailInfoArray addObject:infoDict11];
    [detailInfoArray addObject:infoDict6];
    [detailInfoArray addObject:infoDict7];
    [detailInfoArray addObject:infoDict12];
    [detailInfoArray addObject:infoDict10];
    
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
    
    [_productDetailTable reloadData];
    
    CGSize showMoneySize = [_showMoneyView setMoneyViewWithMoneyFont:[VibeFont fontWithName:@"HelveticaNeue" size:15] GapWidth:2 PriceFont:[VibeFont fontWithName:@"HelveticaNeue" size:21] Price:_productDetailModal.productPrice TextColor:DefaultGreen];
    [_showMoneyView setFrame:CGRectMake(25, (67 -showMoneySize.height)/2, showMoneySize.width, showMoneySize.height)];
    
    //设置导航栏标题
    [self.titleLabel setText:_productDetailModal.productTitle];
}



#pragma mark

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_productDetailTable])
    {
        float offSetY = scrollView.contentOffset.y;
        
        if (offSetY >= kScreenWidth/16 *9 +22) {
            if (self.topNavView.alpha >0.0f) {
                return;
            }
            [self showNaviViewAnimation];
        }else {
            if (self.topNavView.alpha <1.0f) {
                return;
            }
            [self hideNaviViewAnimation];
        }
    }
}

-(void)showNaviViewAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.topNavView setAlpha:1.0f];
        [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, height_headerview)];
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        
        [self.backBtn setAlpha:0.0f];
        [_blackBackBtn setAlpha:1.0f];
        
        [self.titleLabel setAlpha:1.0f];
        [self.titleLabel setFrame:CGRectMake( 50, height_headerview - 35, kScreenWidth -100, 30)];
        
    }];
    
}

-(void)hideNaviViewAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.topNavView setAlpha:0.0f];
        [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        
        [self.backBtn setAlpha:1.0f];
        [_blackBackBtn setAlpha:0.0f];
        
        [self.titleLabel setAlpha:0.0f];
        [self.titleLabel setFrame:CGRectMake( kScreenWidth/2, height_headerview - 35, 0, 30)];
    }];
}


#pragma mark 后退
-(void)popBack
{
    [self.lcNavigationController popViewController];
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
