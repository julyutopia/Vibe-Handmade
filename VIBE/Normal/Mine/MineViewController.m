//
//  MineViewController.m
//  VIBE
//
//  Created by Li Haii on 16/8/3.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.topNavView setHidden:YES];
    
    [self setNeedsStatusBarAppearanceUpdate];

    _backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_backImgView setImage:[UIImage imageNamed:@"Mine_Background_Image"]];
    [self.view addSubview:_backImgView];
    
    
    _userAvatarBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_userAvatarBackImgView setContentMode:UIViewContentModeScaleToFill];
    [_userAvatarBackImgView setAlpha:0.0f];
    [self.view addSubview:_userAvatarBackImgView];

    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:self.view.frame];
    [backView setEffect:blurEffect];
    [self.view addSubview:backView];
    
    
    _contentBackView = [[UIView alloc]initWithFrame:self.view.frame];
    [_contentBackView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_contentBackView];
    
    
    _headerViewHeight = 147;
    
    float _headerViewOriginY = 0.0;
    if (iPhone4) {
        _headerViewOriginY = 50;
    }
    if (iPhone5) {
        _headerViewOriginY = 55;
    }
    if (iPhone6) {
        _headerViewOriginY = 70;
    }
    if (iPhone6plus) {
        _headerViewOriginY = 80;
    }
    
    float tableBackViewHeight = (float)_headerViewOriginY/2;
    
    _tableBackView = [[UIView alloc]initWithFrame:CGRectMake(10, _headerViewOriginY +_headerViewHeight, kScreenWidth -20, kScreenHeight -_headerViewOriginY -_headerViewHeight -tableBackViewHeight)];
    [_tableBackView setBackgroundColor:RGBA(255, 255, 255, 85)];
    [_contentBackView addSubview:_tableBackView];
    
    UIBezierPath *tableMaskPath = [UIBezierPath bezierPathWithRoundedRect:_tableBackView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *tableMaskLayer = [[CAShapeLayer alloc] init];
    tableMaskLayer.frame = _tableBackView.bounds;
    tableMaskLayer.path = tableMaskPath.CGPath;
    _tableBackView.layer.mask = tableMaskLayer;
    
    
    _profileScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -20, _tableBackView.frame.size.height)];
    [_profileScrollView setBackgroundColor:[UIColor clearColor]];
    [_profileScrollView setContentSize:CGSizeMake( (kScreenWidth -20) *2, _tableBackView.frame.size.height)];
    [_profileScrollView setPagingEnabled:YES];
    [_profileScrollView setDelegate:self];
    [_profileScrollView setShowsHorizontalScrollIndicator:YES];
    [_tableBackView addSubview:_profileScrollView];
    
    //收藏商品背景
    _favorProductsBackView = [[UIView alloc]initWithFrame:CGRectMake(10, 15, kScreenWidth -40, _tableBackView.frame.size.height -15 -10)];
    [_favorProductsBackView setBackgroundColor:[UIColor whiteColor]];
    [_favorProductsBackView.layer setCornerRadius:4];
    [_favorProductsBackView.layer setMasksToBounds:YES];
    [_profileScrollView addSubview:_favorProductsBackView];
    
    //收藏商品table
    _favorProductsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -40, _favorProductsBackView.frame.size.height)];
    [_favorProductsTableView setBackgroundView:nil];
    [_favorProductsTableView setBackgroundColor:[UIColor clearColor]];
    [_favorProductsTableView setDelegate:self];
    [_favorProductsTableView setDataSource:self];
    [_favorProductsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_favorProductsTableView setShowsVerticalScrollIndicator:NO];
    [_favorProductsBackView addSubview:_favorProductsTableView];

    
    //收藏专题背景
    _favorTopicsBackView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth -20 +10, 15, kScreenWidth -40, _tableBackView.frame.size.height -15 -10)];
    [_favorTopicsBackView setBackgroundColor:[UIColor whiteColor]];
    [_favorTopicsBackView.layer setCornerRadius:4];
    [_favorTopicsBackView.layer setMasksToBounds:YES];
    [_profileScrollView addSubview:_favorTopicsBackView];
    
    
    _favorTopicsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -40, _favorProductsBackView.frame.size.height)];
    [_favorTopicsTableView setBackgroundView:nil];
    [_favorTopicsTableView setBackgroundColor:[UIColor clearColor]];
    [_favorTopicsTableView setDelegate:self];
    [_favorTopicsTableView setDataSource:self];
    [_favorTopicsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_favorTopicsTableView setShowsVerticalScrollIndicator:NO];
    [_favorTopicsBackView addSubview:_favorTopicsTableView];

    
    
    //顶部固定的View
    _headerBackView = [[UIView alloc]initWithFrame:CGRectMake(10, _headerViewOriginY, kScreenWidth -20, _headerViewHeight)];
    [_headerBackView setBackgroundColor:RGBA(255, 255, 255, 85)];
    [_contentBackView addSubview:_headerBackView];
    
    [_headerBackView.layer setShadowColor:RGBA(140, 188, 244, 20).CGColor];
    [_headerBackView.layer setShadowOffset:CGSizeMake(0, 2)];
    [_headerBackView.layer setShadowOpacity:0.8];
    [_headerBackView.layer setShadowRadius:8.0f];

    CGRect headerShadowBounds = CGRectMake(0, 0, _headerBackView.bounds.size.width,  _headerBackView.bounds.size.height +10);
    
    UIBezierPath *headerMaskPath = [UIBezierPath bezierPathWithRoundedRect:headerShadowBounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *headerMaskLayer = [[CAShapeLayer alloc] init];
    headerMaskLayer.frame = headerShadowBounds;
    headerMaskLayer.path = headerMaskPath.CGPath;
    _headerBackView.layer.mask = headerMaskLayer;
    
    
    //用户头像
    float avatarWidth = 0.0;
    if (iPhone4 || iPhone5) {
        avatarWidth = 50;
    }
    if (iPhone6) {
        avatarWidth = 65;
    }
    if (iPhone6plus) {
        avatarWidth = 80;
    }
    float avatarOriginY = _headerViewOriginY -avatarWidth/2;
    
    
    UIView  * avatarBackView = [[UIView alloc]initWithFrame:CGRectMake( (kScreenWidth -avatarWidth -4)/2, avatarOriginY -2, avatarWidth +4, avatarWidth +4)];
     [avatarBackView setBackgroundColor:RGBA(255, 255, 255, 85)];
    [avatarBackView.layer setCornerRadius:(avatarWidth +2)/2];
    [_contentBackView addSubview:avatarBackView];
    [avatarBackView.layer setShadowColor:RGBA(104, 104, 104, 50).CGColor];
    [avatarBackView.layer setShadowOffset:CGSizeMake(2, 2)];
    [avatarBackView.layer setShadowOpacity:0.6];
    [avatarBackView.layer setShadowRadius:4.0f];
    
    
    _avatarImgView = [[GLImageView alloc]initWithFrame:CGRectMake( (kScreenWidth -avatarWidth)/2, avatarOriginY, avatarWidth, avatarWidth)];
    [_avatarImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_avatarImgView.layer setCornerRadius:avatarWidth/2];
    [_avatarImgView.layer setMasksToBounds:YES];
    [_contentBackView addSubview:_avatarImgView];
    
    
    //用户名Label
    float userNameOriginY = avatarWidth/2 +2 +15;
    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake( (kScreenWidth -20 -100)/2, userNameOriginY, 100, 18)];
    [_userNameLabel setTextAlignment:NSTextAlignmentCenter];
    [_userNameLabel setTextColor:RGBA(30, 30, 51, 80)];
    [_userNameLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:18]];
    [_headerBackView addSubview:_userNameLabel];
    
    //用户签名Label
    _signatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, userNameOriginY +18 +10, kScreenWidth -40, 16)];
    [_signatureLabel setTextAlignment:NSTextAlignmentCenter];
    [_signatureLabel setTextColor:RGBA(25, 39, 58, 90)];
    [_signatureLabel setFont:[VibeFont fontWithName:Default_Font size:14]];
    [_headerBackView addSubview:_signatureLabel];
    
    
    //收藏分类标签
    _headerSegmentControl = [[LUNSegmentedControl alloc]init];
    [_headerSegmentControl setBackgroundColor:RGBA(250, 250, 250, 40)];
    _headerSegmentControl.translatesAutoresizingMaskIntoConstraints = NO;
    [_headerBackView addSubview:_headerSegmentControl];
    
    //创建左边约束
    NSLayoutConstraint *leftLc = [NSLayoutConstraint constraintWithItem:_headerSegmentControl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_headerBackView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:42];
    [_headerBackView addConstraint:leftLc];
    
    //创建右边约束
    NSLayoutConstraint *rightLc = [NSLayoutConstraint constraintWithItem:_headerSegmentControl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_headerBackView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-42];
    [_headerBackView addConstraint:rightLc];
    
    //创建底部约束
    NSLayoutConstraint *bottomLc = [NSLayoutConstraint constraintWithItem:_headerSegmentControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_headerBackView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [_headerBackView addConstraint:bottomLc];
    
    //创建高度约束
    NSLayoutConstraint *heightLc = [NSLayoutConstraint constraintWithItem:_headerSegmentControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:31];
    [_headerBackView addConstraint: heightLc];

    
    _headerSegmentControl.transitionStyle = LUNSegmentedControlTransitionStyleFade;
    _headerSegmentControl.shapeStyle = LUNSegmentedControlShapeStyleLiquid;
    _headerSegmentControl.selectorViewColor = [UIColor clearColor];
    _headerSegmentControl.applyCornerRadiusToSelectorView = YES;
    [_headerSegmentControl setDataSource:self];
    [_headerSegmentControl setDelegate:self];
    [_headerSegmentControl setShadowHideDuration:0.1f];
    [_headerSegmentControl setShadowShowDuration:0.1f];
    [_headerSegmentControl setCornerRadius:16];
    [_headerBackView addSubview:_headerSegmentControl];

    [_headerSegmentControl reloadData];
    [_headerSegmentControl dismissLoading];
    
    
    _favorProductViewNormal = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 95, 25)];
    [_favorProductViewNormal setBackgroundColor:[UIColor redColor]];
    
    _favorProductNormal = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 95, 25)];
    [_favorProductNormal setImage:[UIImage imageNamed:@"Profile_Favor_Product"]];
    
    _favorProductSelected = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 95, 25)];
    [_favorProductNormal setImage:[UIImage imageNamed:@"Profile_Favor_Product_Selected"]];
    
    _favorTopicNormal = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 95, 25)];
    [_favorTopicNormal setImage:[UIImage imageNamed:@"Profile_Favor_Topic"]];
    
    _favorTopicSelected = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 95, 25)];
    [_favorTopicSelected setImage:[UIImage imageNamed:@"Profile_Favor_Topic_Selected"]];
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Cancle_White"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.backBtn];
    
    [self.rightButton setHidden:NO];
    [self.rightButton setFrame:CGRectMake(kScreenWidth -15 -18, 30, 18, 18)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"More_Setting"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.rightButton];
    
    [self.view bringSubviewToFront:self.titleLabel];
    
    [self setContentData];
}


#pragma mark -SegmentDelegate
-(NSInteger)numberOfStatesInSegmentedControl:(LUNSegmentedControl *)segmentedControl
{
    return 2;
}

-(NSArray<UIColor *> *)segmentedControl:(LUNSegmentedControl *)segmentedControl gradientColorsForStateAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return @[RGBA(109, 194, 229, 80), RGBA(126 , 118, 230, 80)];
            break;
        case 1:
            return @[RGBA(200, 129, 236, 80),RGBA(118 ,147, 230, 80)];
            break;
        default:
            break;
    }
    return nil;
}


-(NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForStateAtIndex:(NSInteger)index
{
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"收藏商品"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font size:14]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"收藏专题"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font size:14]}];
    }
    return nil;
}

-(NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForSelectedStateAtIndex:(NSInteger)index {
    
    if (index == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"收藏商品"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font_Bold size:14]}];
    }
    else if (index == 1) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"收藏专题"] attributes:@{NSFontAttributeName : [UIFont fontWithName:Default_Font_Bold size:14]}];
    }
    return nil;
}


//切换标签
-(void)segmentedControl:(LUNSegmentedControl *)segmentedControl didChangeStateFromStateAtIndex:(NSInteger)fromIndex toStateAtIndex:(NSInteger)toIndex
{
    if (toIndex ==0) {
        [_profileScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else if (toIndex ==1){
        [_profileScrollView setContentOffset:CGPointMake(kScreenWidth -20, 0) animated:YES];
    }
}


#pragma mark -滚动切换收藏商品 & 专题
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_profileScrollView]) {
        
        float offsetX = scrollView.contentOffset.x;
                
        if (offsetX == 0) {
            [_headerSegmentControl setCurrentState:0];
        }
        else if (offsetX == kScreenWidth -20){
            [_headerSegmentControl setCurrentState:1];
        }
    }
}


#pragma mark -tableDelegate
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_favorProductsTableView]) {
        return _favorProductsArray.count;
    }
    if ([tableView isEqual:_favorTopicsTableView]) {
        return _favorTopicsArray.count;
    }
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_favorProductsTableView] && _favorProductsArray.count) {
        
        NSString * identifierString = @"MineFavorProductCellIdentifier";
        MineFavorProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[MineFavorProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        VibeProductModal * modal = [_favorProductsArray objectAtIndex:indexPath.row];
        
        BOOL isLast = NO;
        if (indexPath.row == _favorProductsArray.count -1) {
            isLast = YES;
        }
        [cell setDelegateee:self];
        [cell setFavorProductWithModal:modal WithIndex:indexPath.row isLast:isLast];
        
        return cell;
    }
    
    
    if ([tableView isEqual:_favorTopicsTableView]) {
        NSString * identifierString = @"MineFavorTopicCellIdentifier";
        MineFavorTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[MineFavorTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        VibeTopicModal * modal = [_favorTopicsArray objectAtIndex:indexPath.row];
        
        BOOL isLast = NO;
        if (indexPath.row == _favorProductsArray.count -1) {
            isLast = YES;
        }
        
        [cell setMineFavorTopicCellModal:modal WithIndex:indexPath.row IsLast:isLast];
        [cell setDelegate:self];
        
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
    if ([tableView isEqual:_favorProductsTableView]) {
        return 70 +20;
    }
    if ([tableView isEqual:_favorTopicsTableView]) {
        
        if (indexPath.row == _favorTopicsArray.count -1) {
            return (kScreenWidth -60)/3 +20;
        }
        else{
            return (kScreenWidth -60)/3 +10;
        }
        
    }
    return 0;
}


#pragma mark - 收藏商品Cell代理方法
-(void)mineFavorProductCellClickWithIndex:(NSInteger)index
{
//    VibeProductModal * modal = [_favorProductsArray objectAtIndex:index];
//    
//    NewProductDetailViewController * productDetailVC = [[NewProductDetailViewController alloc]init];
//    productDetailVC.productDetailModal = modal;
//    [self.lcNavigationController pushViewController:productDetailVC];
}

#pragma mark -收藏专题Cell代理方法
-(void)mineFavorTopicCellClickWithIndex:(NSInteger )index
{
//    VibeTopicModal * modal = [_favorTopicsArray objectAtIndex:index];
//    TopicDetailViewController * topicDetailVC = [[TopicDetailViewController alloc]init];
//    [topicDetailVC setTopicModal:modal];
//    [self.lcNavigationController pushViewController:topicDetailVC];
}


#pragma mark -设置假数据
-(void)setContentData
{
    if (!_userProfileModal) {
        _userProfileModal = [[MineProfileModal alloc]init];
    }
    
    [_userProfileModal setUserAvatarImgURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1489653273&di=20dc18f337119f3036a5fd1482b42694&src=http://easyread.ph.126.net/pRj-9MtJUSNo0jnM-BDD3A==/7917043371407872049.jpg"];
    [_userProfileModal setUserName:@"里海Lihaii"];
    [_userProfileModal setUserSignature:@"每个不曾起舞的日子，都是对生命的辜负"];

    
    [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:_userProfileModal.userAvatarImgURL] placeholderImage:nil];
    [_userNameLabel setText:_userProfileModal.userName];
    [_signatureLabel setText:_userProfileModal.userSignature];

    
    
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
    
    if (!_favorProductsArray) {
        _favorProductsArray = [[NSMutableArray alloc]init];
    }
    [_favorProductsArray addObject:modal1];
    [_favorProductsArray addObject:modal2];
    [_favorProductsArray addObject:modal3];
    [_favorProductsArray addObject:modal1];
    [_favorProductsArray addObject:modal2];
    [_favorProductsArray addObject:modal3];
    [_favorProductsArray addObject:modal1];
    [_favorProductsArray addObject:modal2];
    [_favorProductsArray addObject:modal3];

    
    
    //收藏专题
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
   
    if (!_favorTopicsArray) {
        _favorTopicsArray = [[NSMutableArray alloc]init];
    }
    [_favorTopicsArray addObject:topicModal1];
    [_favorTopicsArray addObject:topicModal2];
    [_favorTopicsArray addObject:topicModal3];
    [_favorTopicsArray addObject:topicModal1];
    [_favorTopicsArray addObject:topicModal2];
    [_favorTopicsArray addObject:topicModal3];
    [_favorTopicsArray addObject:topicModal1];
    [_favorTopicsArray addObject:topicModal2];
    [_favorTopicsArray addObject:topicModal3];

    [_favorProductsTableView reloadData];
    
    
    
    [_userAvatarBackImgView sd_setImageWithURL:[NSURL URLWithString:_userProfileModal.userAvatarImgURL] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [UIView animateWithDuration:0.5f animations:^{
            
            [_backImgView setAlpha:0.0f];
            [_userAvatarBackImgView setAlpha:1.0f];
            
        }];
        
    }];
    
}


-(void)rightBtnClicked:(id)sender
{
    if (!_moreSettingView) {
        _moreSettingView = [[MoreSettingView alloc]initWithFrame:self.view.frame];
        [_moreSettingView setDelegateee:self];
        [self.view addSubview:_moreSettingView];
    }
    
    [_moreSettingView showSettingView];
    
    [UIView animateWithDuration:0.5f animations:^{
        
        [_contentBackView setFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        [_contentBackView setAlpha:0.0f];
        
        [self.backBtn setAlpha:0.0f];
        [self.rightButton setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        [self.titleLabel setHidden:NO];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setText:@"更多设置"];

    }];
}

#pragma mark -取消设置的代理方法
-(void)moreSettingViewDidHide
{
    [self.titleLabel setText:@""];
    
    [UIView animateWithDuration:0.5f animations:^{
        
        [_contentBackView setFrame:self.view.frame];
        [_contentBackView setAlpha:1.0f];
        
        [self.backBtn setAlpha:1.0f];
        [self.rightButton setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
    }];
    
}


#pragma mark -点击‘更多设置’
-(void)moreSettingDidTapIndex:(NSInteger)index
{
    //意见反馈
    if (index == 1) {
        FeedBackViewController * feedbackVC = [[FeedBackViewController alloc]init];
        [self.lcNavigationController pushViewController:feedbackVC];
    }
    //清理缓存
    if (index ==2) {
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
            [_moreSettingView.settingTableView reloadData];
            [FTIndicator showInfoWithMessage:@"已清空缓存内容" userInteractionEnable:NO];
        }];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
