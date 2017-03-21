//
//  TopicDetailViewController.m
//  VIBE
//
//  Created by Li Haii on 2016/12/19.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()

@end

@implementation TopicDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DefaultBackgroundColor];
    
    //毛玻璃背景
    _backImgView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_backImgView];
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * backView = [[UIVisualEffectView alloc]initWithFrame:self.view.frame];
    [backView setEffect:blurEffect];
    [self.view addSubview:backView];
    
    
    //TableView
    _topicDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_topicDetailTable setBackgroundView:nil];
    [_topicDetailTable setBackgroundColor:[UIColor clearColor]];
    [_topicDetailTable setDelegate:self];
    [_topicDetailTable setDataSource:self];
    [_topicDetailTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_topicDetailTable setShowsVerticalScrollIndicator:NO];
    [_topicDetailTable setHidden:YES];
    [self.view addSubview:_topicDetailTable];
    
    
    UIView * tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
    [tableFooterView setBackgroundColor:[UIColor clearColor]];
    [_topicDetailTable setTableFooterView:tableFooterView];

    
//    //导航栏
//    UIBlurEffect * effect1 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView * blurView1 = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
//    [blurView1 setEffect:effect1];
//    
//    _naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
//    [_naviView setBackgroundColor:RGBA(255, 255, 255, 85)];
//    [_naviView setAlpha:0.0f];
//    [self.view addSubview:_naviView];
//    [_naviView addSubview:blurView1];
//    
//    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 20-1, kScreenWidth, 1)];
//    [lineView setBackgroundColor:RGBA(0, 0, 0, 5)];
//    [_naviView addSubview:lineView];
    
//    _favorBtn = [[UIButton alloc]initWithFrame:CGRectMake( kScreenWidth -30 -7, 27, 30, 30)];
//    [_favorBtn setBackgroundImage:[UIImage imageNamed:@"Topic_Detail_Favor"] forState:UIControlStateNormal];
//    _favorBtn.layer.shadowColor = RGBA(0, 0, 0, 80).CGColor;//shadowColor阴影颜色
//    _favorBtn.layer.shadowOffset = CGSizeMake(2,2);
//    _favorBtn.layer.shadowOpacity = 0.5;
//    _favorBtn.layer.shadowRadius = 4;
//    [_favorBtn addTarget:self action:@selector(addFavorClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_favorBtn];
//    
//    _favorBtnView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth -30 -8, 26, 32, 32)];
//    [_favorBtnView setBackgroundColor:RGBA(255, 255, 255, 95)];
//    [_favorBtnView.layer setCornerRadius:16];
//    [_favorBtnView.layer setMasksToBounds:YES];
//    [_favorBtnView.layer setBorderColor:RGBA(0, 0, 0, 10).CGColor];
//    [_favorBtnView.layer setBorderWidth:0.5f];
//    [_favorBtnView setAlpha:0.0f];
//    [self.view addSubview:_favorBtnView];
//    
//    UIVisualEffectView * favorBackBtnBlurView = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
//    [favorBackBtnBlurView setEffect:blackBackBtnEffect];
//    [_favorBtnView addSubview:favorBackBtnBlurView];
//
//    UIButton * blackFavorBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 28, 28)];
//    [blackFavorBtn setBackgroundImage:[UIImage imageNamed:@"Topic_Detail_Favor_Black"] forState:UIControlStateNormal];
//    [blackFavorBtn addTarget:self action:@selector(addFavorClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [_favorBtnView addSubview:blackFavorBtn];
    

    [self.topNavView setAlpha:0.0f];
    [self.topNavView setFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    [self.view bringSubviewToFront:self.topNavView];
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Navi_Back"] forState:UIControlStateNormal];
    self.backBtn.layer.shadowColor = RGBA(0, 0, 0, 80).CGColor;//shadowColor阴影颜色
    self.backBtn.layer.shadowOffset = CGSizeMake(2,2);
    self.backBtn.layer.shadowOpacity = 0.8;
    self.backBtn.layer.shadowRadius = 4;
    [self.view bringSubviewToFront:self.backBtn];
    
    
    [self.rightButton setHidden:NO];
    [self.rightButton setFrame:CGRectMake( kScreenWidth -30 -7, 27, 30, 30)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"Topic_Detail_Favor"] forState:UIControlStateNormal];
    self.rightButton.layer.shadowColor = RGBA(0, 0, 0, 80).CGColor;//shadowColor阴影颜色
    self.rightButton.layer.shadowOffset = CGSizeMake(2,2);
    self.rightButton.layer.shadowOpacity = 0.5;
    self.rightButton.layer.shadowRadius = 4;
    [self.view bringSubviewToFront:self.rightButton];
    
    [self.titleLabel setTextColor:DefaultQYTextColor80];
    [self.titleLabel setFont:[UIFont fontWithName:Default_Font_Middle size:16]];
    [self.titleLabel setAlpha:0.0f];
    [self.view bringSubviewToFront:self.titleLabel];
    
    [self setContent];
}


#pragma mark -scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_topicDetailTable]) {
        
        CGFloat offsetY = scrollView.contentOffset.y;
        
        CGFloat offsetHeaderView = _headerViewHeight + offsetY;
        if (offsetHeaderView < 0) {
            CGRect headerViewframe = _headerView.frame;
            headerViewframe.size.height = _headerViewHeight - offsetHeaderView;
            headerViewframe.origin.y = -_headerViewHeight + offsetHeaderView;
            _headerView.frame = headerViewframe;
         
            CGRect headerImgViewFrame = _headerImgView.frame;
            headerImgViewFrame.size.height = _headerImgViewHeight - offsetHeaderView;
            _headerImgView.frame = headerImgViewFrame;
            
            CGRect headerInfoViewFrame = _headerInfoView.frame;
            headerInfoViewFrame.origin.y = headerViewframe.size.height -headerInfoViewFrame.size.height;
            _headerInfoView.frame = headerInfoViewFrame;
        }
        
        if (offsetY >= -kScreenWidth/16 *9 +80) {
            [self showNaviViewAnimation];
        }
        else {
            [self hideNaviViewAnimation];
        }
        
    }
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 && _topicModal.topicDetailInfoArray.count) {
        return _topicModal.topicDetailInfoArray.count;
    }
    if (section == 2 && _topicModal.topicRelatedProductArray.count) {
        return _topicModal.topicRelatedProductArray.count;
    }
    if (section ==3 && _topicModal.topicDetailBottomInfoArray.count) {
        return _topicModal.topicDetailBottomInfoArray.count;
    }
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        NSString * identifier = @"TopicDetailShowCellIdentifier";
        TopicDetailShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TopicDetailShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        [cell setDelegate:self];
        
        NSDictionary * detailDict = [_topicModal.topicDetailInfoArray objectAtIndex:indexPath.row];
        
        BOOL isLastCell = NO;
        if (indexPath.row == _topicModal.topicDetailInfoArray.count -1) {
            isLastCell = YES;
        }
        [cell setTopicDetailShowTableCellWithInfo:detailDict IsLastCell:isLastCell];
        
        return cell;
    }
    
    //相关产品推荐header
    if (indexPath.section == 1) {
        
        NSString * identifier = @"TopicDetailRelatedHeaderCellIdentifier";
        TopicDetailRelatedHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TopicDetailRelatedHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        return cell;
    }    
    
    //相关产品推荐Cell
    if (indexPath.section == 2) {
        
        NSString * identifier = @"TopicDetailRelatedProductsCellIdentifier";
        TopicDetailRelatedProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TopicDetailRelatedProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        BOOL isLast = NO;
        if (indexPath.row == _topicModal.topicRelatedProductArray.count -1) {
            isLast = YES;
        }
        [cell setDelegateee:self];
        
        VibeProductModal * modal = [_topicModal.topicRelatedProductArray objectAtIndex:indexPath.row];
        [cell setGuessProductWithModal:modal WithIndex:indexPath.row IsLast:isLast];
        
        return cell;
    }
    
    
    //专题底部信息Cell
    if (indexPath.section == 3) {
        
        NSString * identifier = @"TopicDetailBottomCellIdentifier";
        TopicDetailBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TopicDetailBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundView:nil];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        BOOL isLast = NO;
        if (indexPath.row == _topicModal.topicDetailBottomInfoArray.count -1) {
            isLast = YES;
        }
        
        NSDictionary * dict = [_topicModal.topicDetailBottomInfoArray objectAtIndex:indexPath.row];
        [cell setTopicBottomTableCellWithInfo:dict IsLastCell:isLast];
        
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
    if (indexPath.section == 0 && _topicModal.topicDetailInfoArray.count) {
        NSDictionary * dict = [_topicModal.topicDetailInfoArray objectAtIndex:indexPath.row];
        
        NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
        NSString * content = [NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]];
        
        float lastCellHeight = 0;
        if (indexPath.row == _topicModal.topicDetailInfoArray.count -1) {
            lastCellHeight = 5.0f;
        }
        
        if ([type isEqualToString:@"text_Small"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Small size:14] Content:content LineSpace:5.0] +lastCellHeight;
        }
        else if ([type isEqualToString:@"text_Middle"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font size:15] Content:content LineSpace:5.0] +lastCellHeight;
        }
        else if ([type isEqualToString:@"text_Bold"]) {
            return [self calculateCellTextHeightWithFont:[VibeFont fontWithName:Default_Font_Middle size:16] Content:content LineSpace:6.0] +lastCellHeight;
        }
        else if ([type isEqualToString:@"image"]) {
            
            TopicDetailShowTableViewCell *cell = (TopicDetailShowTableViewCell *)[self tableView:_topicDetailTable cellForRowAtIndexPath:indexPath];
            
            float heighttt = cell.imageHeight +lastCellHeight;
            return heighttt;
        }
    }
    
    //相关产品标题
    if (indexPath.section == 1) {
        return 41;
    }
    //相关产品内容
    if (indexPath.section == 2) {
        
        if (indexPath.row < _topicModal.topicRelatedProductArray.count -1) {
            return 60 +20;
        }
        else{
            return 60 +20 +10;
        }
    }
    //底部信息
    if (indexPath.section == 3 && _topicModal.topicDetailBottomInfoArray.count) {
        NSDictionary * dict = [_topicModal.topicDetailBottomInfoArray objectAtIndex:indexPath.row];
        
        NSString * type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"type"]];
        
        float lastCellHeight = 0;
        if (indexPath.row == _topicModal.topicDetailBottomInfoArray.count -1) {
            lastCellHeight = 5.0f;
        }
        if ([type isEqualToString:@"image"]){
            TopicDetailBottomTableViewCell *cell = (TopicDetailBottomTableViewCell *)[self tableView:_topicDetailTable cellForRowAtIndexPath:indexPath];
        float heighttt = cell.imageHeight +lastCellHeight;
        return heighttt;
            
        }
    }
    
    
    return 0;
}


#pragma mark - 相关推荐cell代理方法
-(void)topicDetailRelatedProductCellClickWithIndex:(NSInteger)index
{
    VibeProductModal * modal = [_topicModal.topicRelatedProductArray objectAtIndex:index];
    NewProductDetailViewController * productDetailVC = [[NewProductDetailViewController alloc]init];
    productDetailVC.productDetailModal = modal;
    [self.lcNavigationController pushViewController:productDetailVC];
}

#pragma mark -设置假数据
-(void)setContent
{
    _topicModal = [[VibeTopicModal alloc]init];
    
    [_topicModal setTopicTitle:@"有基利姆作伴。让家中的每个角落都充满生活的细节与温度🌵"];
    [_topicModal setTopicID:[NSNumber numberWithInt:123]];
    [_topicModal setTopicType:1];
    [_topicModal setTopicImgURL:@"http://i1.piimg.com/567571/81df43f74dd8975a.jpg"];
    
    _topicModal.topicIsUserFavored = [NSNumber numberWithInt:1];
    
    NSMutableArray  * tagArray = [[NSMutableArray alloc]initWithObjects:@"家居", @"异域手工",@"Kilim", @"传统", nil];
    _topicModal.topicTagsArray = tagArray;

    NSMutableArray  * detailArray = [[NSMutableArray alloc]init];
    
    
    NSMutableDictionary * infoDict0 = [NSMutableDictionary dictionary];
    [infoDict0 setObject:@"text_Middle" forKey:@"type"];
    [infoDict0 setObject:@"Kilim基利姆花毯是原产自土耳其、伊朗、巴基斯坦等地区的手织毛地毯，颜色鲜艳，毯面平滑柔软，颇受人们喜爱。\n几乎在所有的土耳其旅游攻略中，提到去土耳其必买的东西中都会有土耳其地毯。它是不需要去推销或者反复陈说的，因为它本身,就是完美的代名词。" forKey:@"content"];
    
    NSMutableDictionary * infoDict1 = [NSMutableDictionary dictionary];
    [infoDict1 setObject:@"image" forKey:@"type"];
    [infoDict1 setObject:@"http://p1.bqimg.com/567571/574a7bf524761c47.jpg" forKey:@"content"];

    NSMutableDictionary * infoDict2 = [NSMutableDictionary dictionary];
    [infoDict2 setObject:@"text_Small" forKey:@"type"];
    [infoDict2 setObject:@"土耳其地毯的历史可以追溯到公元前3000年左右的青铜器时期。公元前5世纪，波斯人从米底亚人(土耳其人的古老祖先)身上学到了这门技术。" forKey:@"content"];
    
    NSMutableDictionary * infoDict3 = [NSMutableDictionary dictionary];
    [infoDict3 setObject:@"image" forKey:@"type"];
    [infoDict3 setObject:@"http://oih52ss9e.bkt.clouddn.com/coussin-kilim-deco-boho-etsy.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict4 = [NSMutableDictionary dictionary];
    [infoDict4 setObject:@"image" forKey:@"type"];
    [infoDict4 setObject:@"http://p1.bqimg.com/567571/48af964a18692dd9.jpg" forKey:@"content"];

    NSMutableDictionary * infoDict5 = [NSMutableDictionary dictionary];
    [infoDict5 setObject:@"text_Middle" forKey:@"type"];
    [infoDict5 setObject:@"这种地毯仍采用绘画编织的传统工艺。地毯的图案通常是几何图形和有象征意义的抽象图案，如邪恶之眼，鸟等，还有花卉图案。\n基里姆花毯还经常被用作挂毯、桌布或用来覆盖箱柜和长椅。而零碎余料常用来做家具装饰、靠垫、背包甚至鞋子" forKey:@"content"];
    
    NSMutableDictionary * infoDict6 = [NSMutableDictionary dictionary];
    [infoDict6 setObject:@"image" forKey:@"type"];
    [infoDict6 setObject:@"http://p1.bqimg.com/567571/2c3d9738f036af18.jpg" forKey:@"content"];
    
    NSMutableDictionary * infoDict7 = [NSMutableDictionary dictionary];
    [infoDict7 setObject:@"text_Small" forKey:@"type"];
    [infoDict7 setObject:@"Kilim采用双面平织工艺，正反面都可使用。其工艺复杂，都是匠人手工一针一线钩织而成，因此每一张Kilim更加独一无二。" forKey:@"content"];
    
    NSMutableDictionary * infoDict8 = [NSMutableDictionary dictionary];
    [infoDict8 setObject:@"image" forKey:@"type"];
    [infoDict8 setObject:@"http://p1.bqimg.com/567571/285ea98695f9ab46.jpg" forKey:@"content"];

    NSMutableDictionary * infoDict9 = [NSMutableDictionary dictionary];
    [infoDict9 setObject:@"image" forKey:@"type"];
    [infoDict9 setObject:@"http://p1.bqimg.com/567571/2d96ea0102a44a32.jpg" forKey:@"content"];

    [detailArray addObject:infoDict0];
    [detailArray addObject:infoDict1];
    [detailArray addObject:infoDict2];
    [detailArray addObject:infoDict3];
    [detailArray addObject:infoDict4];
    [detailArray addObject:infoDict5];
    [detailArray addObject:infoDict6];
    [detailArray addObject:infoDict7];
    [detailArray addObject:infoDict8];
    [detailArray addObject:infoDict9];

    _topicModal.topicDetailInfoArray = detailArray;
 
    
    //相关推荐
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

    _topicModal.topicRelatedProductArray = guessArray;
    
    
    NSMutableDictionary * bottomInfoDict0 = [NSMutableDictionary dictionary];
    [bottomInfoDict0 setObject:@"image" forKey:@"type"];
    [bottomInfoDict0 setObject:@"http://oih52ss9e.bkt.clouddn.com/21062013-21062013-E75A0247-Modifier.jpg" forKey:@"content"];
  
    NSMutableDictionary * bottomInfoDict1 = [NSMutableDictionary dictionary];
    [bottomInfoDict1 setObject:@"image" forKey:@"type"];
    [bottomInfoDict1 setObject:@"http://oih52ss9e.bkt.clouddn.com/Rectangle%2035.png" forKey:@"content"];
    
    NSMutableArray * bottomArray = [[NSMutableArray alloc]init];
    [bottomArray addObject:bottomInfoDict0];
    [bottomArray addObject:bottomInfoDict1];
    
    _topicModal.topicDetailBottomInfoArray = bottomArray;
    
    
    NSString * topicTitle = _topicModal.topicTitle;
    UIFont  * topicTitleFont = [VibeFont fontWithName:Default_Font_Middle size:17];
    
    float topicTitleHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:topicTitle withFont:topicTitleFont withWidth:kScreenWidth -30 withLineSpacing:4.0f] +1;
    
    [self.titleLabel setText:topicTitle];
    
    //顶部放大图
    _headerViewHeight = kScreenWidth/16 *9 +20 + topicTitleHeight;
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _headerViewHeight)];
    [_headerView setBackgroundColor:[UIColor clearColor]];
    [_topicDetailTable setContentInset:UIEdgeInsetsMake(_headerViewHeight, 0, 0, 0)];
    [_topicDetailTable addSubview:_headerView];
    
    _headerImgViewHeight = kScreenWidth/16 *9;
    
    _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _headerImgViewHeight)];
    [_headerImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_headerImgView.layer setMasksToBounds:YES];
    [_headerView addSubview:_headerImgView];
    
    _headerInfoView = [[UIView alloc]initWithFrame:CGRectMake(5, _headerImgViewHeight -30, kScreenWidth -10, 50 +topicTitleHeight)];
    [_headerInfoView setBackgroundColor:RGBA(255, 255, 255, 100)];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headerInfoView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _headerInfoView.bounds;
    maskLayer.path = maskPath.CGPath;
    _headerInfoView.layer.mask = maskLayer;
    [_headerView addSubview:_headerInfoView];
    
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth -30, topicTitleHeight)];
    [titleLabel setNumberOfLines:0];
    [titleLabel setTextColor:RGBA(72, 72, 72, 100)];
    [titleLabel.layer setShadowColor:RGBA(0, 0, 0, 30).CGColor];
    [titleLabel.layer setShadowOffset:CGSizeMake(1, 1)];
    [titleLabel.layer setShadowRadius:8.0f];
    [titleLabel.layer setShadowOpacity:0.6f];
    [_headerInfoView addSubview:titleLabel];
    
    [[VibeAppTool sharedInstance]setLabelSpace:titleLabel withText:topicTitle withFont:topicTitleFont withLineSpacing:4.0f];
    
    float tagViewMaxWidth = kScreenWidth -50 -80;
    _gradientTagView = [[GradientTagCloudView alloc]initWithFrame:CGRectMake(10, 10 +topicTitleHeight +10, tagViewMaxWidth, 18)];
    [_gradientTagView setGradientTagCloudWithMaxWidth:tagViewMaxWidth MaxHeight:18 WithFont:[UIFont fontWithName:Default_Font_Middle size:11] AndTags:_topicModal.topicTagsArray];
    [_headerInfoView addSubview:_gradientTagView];
    
    
    [_headerImgView sd_setImageWithURL:[NSURL URLWithString:_topicModal.topicImgURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [_backImgView setImage:image];

        [_topicDetailTable reloadData];
        [_topicDetailTable setContentOffset:CGPointMake(0, -_headerViewHeight -1)];
        [_topicDetailTable setHidden:NO];
        
    }];
    
}


//计算cell的文字高度
-(float )calculateCellTextHeightWithFont:(UIFont *)font Content:(NSString *)content LineSpace:(CGFloat )space
{
    float labelHeght = [[VibeAppTool sharedInstance] getSpaceLabelHeight:content withFont:font withWidth:kScreenWidth -40 withLineSpacing:space];
    
    return labelHeght +10;
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


#pragma mark -点击收藏按钮
-(void)addFavorClicked:(UIButton *)favorBtn
{
    if ([VibeAppTool isUserLogIn]) {
        
    }
    //未登录
    else{
        VibeLogInViewController * logInVC = [[VibeLogInViewController alloc]init];
        logInVC.isPopUp = YES;
        LCNavigationController * navi = [[LCNavigationController alloc]initWithRootViewController:logInVC];
        [navi setCanDragPop:NO];
        [self.lcNavigationController presentViewController:navi animated:YES completion:nil];
    }
}




#pragma mark - 点击专题详情图片
-(void)topicDetailInfoCellDidTapImageWithURL:(NSString *)imgURL
{
    [[VibeShowPhotoView sharedInstance]showWithImageURL:imgURL WithView:self.view];
}



#pragma mark -POP
-(void)popBack
{
    [self.lcNavigationController popViewController];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
