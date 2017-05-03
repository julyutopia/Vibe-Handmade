//
//  ProfileViewController.m
//  VIBE
//
//  Created by Li Haii on 2017/5/1.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

    _profileModal = [VibeAppTool sharedInstance].userInfoModal;


    _favorProductsArray = [[NSMutableArray alloc]initWithArray:[AppDelegate sharedAppDelegate].recommandItemsArray];
    _favorTopicsArray   = [[NSMutableArray alloc]initWithArray:[AppDelegate sharedAppDelegate].discoverTopicsArray];
    _favorStoriesArray  = [[NSMutableArray alloc]initWithArray:[AppDelegate sharedAppDelegate].discoverStorysArray];
    _favorShopsArray    = [[NSMutableArray alloc]initWithArray:[AppDelegate sharedAppDelegate].creatorsArray];
    
    
    [self initTopView];
    
    [self initNaviView];
    [self initContentView];
}


-(void)initNaviView
{
    [self.rightBtn setHidden:NO];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"More_Setting_Black_Normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"More_Setting_Black_Highlight"] forState:UIControlStateHighlighted];
    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_Black_Normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"Cancle_Black_Highlight"] forState:UIControlStateHighlighted];
    
    [self.view bringSubviewToFront:self.leftBtn];
    [self.view bringSubviewToFront:self.rightBtn];
}


-(void)initTopView
{
    _showFavorViewHeight = kScreenHeight * 0.618 +50;
    _topViewHeight = kScreenHeight - _showFavorViewHeight;
    
    //显示顶部的View
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _topViewHeight)];
    [topView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:topView];
    
    
    float avatarWidth = 70;
    
    
    _backBlurAvatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(60 +5, (_topViewHeight -avatarWidth)/2 +5, avatarWidth -6, avatarWidth -6)];
    [_backBlurAvatarImgView setHidden:YES];
    [_backBlurAvatarImgView setBackgroundColor:[UIColor whiteColor]];
    [_backBlurAvatarImgView.layer setShadowColor:RGBA(100, 100, 100, 40).CGColor];
    [_backBlurAvatarImgView.layer setShadowOffset:CGSizeMake(6, 6)];
    [_backBlurAvatarImgView.layer setShadowOpacity:1.0f];
    [_backBlurAvatarImgView.layer setShadowRadius:8.0f];
    [topView addSubview:_backBlurAvatarImgView];

    _avatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, (_topViewHeight -avatarWidth)/2, avatarWidth, avatarWidth)];
    [_avatarImgView.layer setCornerRadius:4.0f];
    [_avatarImgView.layer setMasksToBounds:YES];
    [_avatarImgView setContentMode:UIViewContentModeScaleAspectFill];
    [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:_profileModal.userAvatarImgURL] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [_backBlurAvatarImgView setHidden:YES];
        [_backBlurAvatarImgView setImage:image];
    }];
    
    [topView addSubview:_avatarImgView];
    
    float textWidth = kScreenWidth -avatarWidth -60 -10 -20;

    _showTextView = [[UIView alloc]initWithFrame:CGRectMake(60 +avatarWidth +10, (_topViewHeight -avatarWidth)/2, textWidth, avatarWidth)];
    [_showTextView setBackgroundColor:[UIColor clearColor]];
    [topView addSubview:_showTextView];
    
    UIFont * userNameFont = [VibeFont fontWithName:Font_Chinese_Regular size:18];
    UIFont * signatureFont = [VibeFont fontWithName:Font_Chinese_Regular size:13];
    
    _userNameLabel = [[UILabel alloc]init];
    [_userNameLabel setTextAlignment:NSTextAlignmentLeft];
    [_userNameLabel setTextColor:Default_Text_Dark_Color_90];
    [_userNameLabel setFont:userNameFont];
    [_showTextView addSubview:_userNameLabel];
    
    _signatureLabel = [[UILabel alloc]init];
    [_signatureLabel setTextAlignment:NSTextAlignmentLeft];
    [_signatureLabel setTextColor:Default_Text_Gray_Color];
    [_signatureLabel setFont:signatureFont];
    [_signatureLabel setNumberOfLines:0];
    [_showTextView addSubview:_signatureLabel];

    NSString * userName = _profileModal.userName;
    NSString * signature = _profileModal.userSignature;
    
    [_userNameLabel setText:userName];
    [_signatureLabel setText:signature];
    
    //没有签名
    if (signature.length == 0) {
        
        [_userNameLabel setFrame:CGRectMake(0, 0, textWidth, avatarWidth)];
    }
    else{
        
        float userNameHeight = [userName getSizeWithLimitSize:CGSizeMake(textWidth, 100) withFont:userNameFont].height;
        float signaureHeight = [signature getSizeWithLimitSize:CGSizeMake(textWidth, 100) withFont:signatureFont].height;
        
        //签名超过一行
        if (signaureHeight >20) {
            [[VibeAppTool sharedInstance] setLabelSpace:_signatureLabel withText:signature withFont:signatureFont withLineSpacing:5.0f];
            signaureHeight = [[VibeAppTool sharedInstance]getSpaceLabelHeight:signature withFont:_signatureLabel.font withWidth:textWidth withLineSpacing:5.0] +2.0f;
        }
        [_userNameLabel setFrame:CGRectMake(0, (avatarWidth -userNameHeight -10 -signaureHeight)/2, textWidth, userNameHeight)];
        [_signatureLabel setFrame:CGRectMake(0, _userNameLabel.frame.origin.y +userNameHeight +10, textWidth, signaureHeight)];
    }
    
    
    _sectionView = [[UIView alloc]initWithFrame:CGRectMake(60, _topViewHeight -50, kScreenWidth -60 -20, 50)];
    [_sectionView setBackgroundColor:[UIColor clearColor]];
    [topView addSubview:_sectionView];
    
    
    NSString * btnText = @"商品";
    UIFont * btnFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
    
    float btnWidth = [btnText getSizeWithLimitSize:CGSizeMake(100, 30) withFont:btnFont].width +20;
    
    float btnGap = (kScreenWidth -60 -20 -btnWidth *4)/3;
    
    for (int i =0; i <4; i ++) {
        
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake( (btnWidth +btnGap) *i , 0, btnWidth, 30)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:Default_Text_Dark_Color_70 forState:UIControlStateNormal];
        [btn setTitleColor:Default_Text_Dark_Color_50 forState:UIControlStateHighlighted];
        [btn setTitleColor:Default_Text_Dark_Color_90 forState:UIControlStateSelected];
        [btn.titleLabel setFont:btnFont];
        [btn setTag:1000 +i];
        [btn addTarget:self action:@selector(sectionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_sectionView addSubview:btn];
        
        switch (i) {
            case 0:
                [btn setTitle:@"商品" forState:UIControlStateNormal];
                [btn setSelected:YES];
               
                _productsBtn = btn;
                _selectedInex = 0;
                
                break;
            case 1:
                [btn setTitle:@"专题" forState:UIControlStateNormal];
                _topicsBtn = btn;
                break;
            case 2:
                [btn setTitle:@"故事" forState:UIControlStateNormal];
                _storiesBtn = btn;
                break;
            case 3:
                [btn setTitle:@"店铺" forState:UIControlStateNormal];
                _shopsBtn = btn;
                break;
            default:
                break;
        }
    }
    
    
    _gapLine = [[UIView alloc]initWithFrame:CGRectMake(0, _sectionView.frame.size.height -10 -0.5, _sectionView.frame.size.width, 0.5)];
    [_gapLine setBackgroundColor:RGBA(211, 211, 211, 30)];
    [_sectionView addSubview:_gapLine];
    
    _slideView = [[UIView alloc]initWithFrame:CGRectMake(0, _sectionView.frame.size.height -10 -4, btnWidth, 4)];
    [_slideView setBackgroundColor:DefaultGreen];
    [_sectionView addSubview:_slideView];
    
}


-(void)initContentView
{
    _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _topViewHeight, kScreenWidth, _showFavorViewHeight)];
    [_contentScrollView setContentSize:CGSizeMake(kScreenWidth *4, _showFavorViewHeight)];
    [_contentScrollView setPagingEnabled:YES];
    [_contentScrollView setBounces:YES];
    [_contentScrollView setDelegate:self];
    [_contentScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:_contentScrollView];
    
    
    _favorProductsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorProductsView setBackgroundColor:[UIColor clearColor]];
    [_contentScrollView addSubview:_favorProductsView];
    
    _favorTopicssView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorTopicssView setBackgroundColor:[UIColor clearColor]];
    [_contentScrollView addSubview:_favorTopicssView];
    
    _favorStoriesView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth *2, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorStoriesView setBackgroundColor:[UIColor clearColor]];
    [_contentScrollView addSubview:_favorStoriesView];
    
    _favorShopsView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth *3, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorShopsView setBackgroundColor:[UIColor greenColor]];
    [_contentScrollView addSubview:_favorShopsView];
    

    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 20;
    //最小两行之间的间距
    layout.minimumLineSpacing = 15;
    //Footer的大小
    layout.footerReferenceSize = CGSizeMake(kScreenWidth, 20);
    
    _favorProductsCollectionView = [[FavorProductsCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _showFavorViewHeight) collectionViewLayout:layout];
    [_favorProductsCollectionView initCollectionView];
    [_favorProductsCollectionView setFavorProductsCollectionViewWithArray:_favorProductsArray];
    
    [_favorProductsView addSubview:_favorProductsCollectionView];
    
    
    UICollectionViewFlowLayout *layout1=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout1.minimumInteritemSpacing = 20;
    //最小两行之间的间距
    layout1.minimumLineSpacing = 15;
    //Footer的大小
    layout1.footerReferenceSize = CGSizeMake(kScreenWidth, 20);
    
    _favorStoriesCollectionView = [[FavorStoriesCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _showFavorViewHeight) collectionViewLayout:layout1];
    [_favorStoriesCollectionView initCollectionView];
    [_favorStoriesCollectionView setFavorStoriesCollectionViewWithArray:_favorStoriesArray];
    [_favorStoriesView addSubview:_favorStoriesCollectionView];
    
    
    _favorTopicsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorTopicsTable setBackgroundView:nil];
    [_favorTopicsTable setBackgroundColor:[UIColor clearColor]];
    [_favorTopicsTable setDelegate:self];
    [_favorTopicsTable setDataSource:self];
    [_favorTopicsTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_favorTopicsTable setShowsVerticalScrollIndicator:NO];
    [_favorTopicsTable setContentInset:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_favorTopicsTable setScrollIndicatorInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_favorTopicssView addSubview:_favorTopicsTable];

    
    
    
    _favorShopsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _showFavorViewHeight)];
    [_favorShopsTable setBackgroundView:nil];
    [_favorShopsTable setBackgroundColor:[UIColor clearColor]];
    [_favorShopsTable setDelegate:self];
    [_favorShopsTable setDataSource:self];
    [_favorShopsTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_favorShopsTable setShowsVerticalScrollIndicator:NO];
    [_favorShopsTable setContentInset:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_favorShopsTable setScrollIndicatorInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_favorShopsView addSubview:_favorShopsTable];


    _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
}


#pragma mark -Tableview代理
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _footerView;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_favorTopicsTable] && _favorTopicsArray.count) {
        return _favorTopicsArray.count;
    }
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_favorTopicsTable] && _favorTopicsArray.count) {
        
        NSString * identifierString = @"FavorTopicsTableViewCellIdentifier";
        
        FavorTopicsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
        if (cell == nil) {
            cell = [[FavorTopicsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            [cell setBackgroundView:nil];
        }
        
        DiscoverTopicModal * topicModal = [_favorTopicsArray objectAtIndex:indexPath.row];
        [cell setFavorTopicTableCellWithModal:topicModal];
        
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
    if ([tableView isEqual:_favorTopicsTable] && _favorTopicsArray.count)
    {
        float photoWidth = kScreenWidth -60 -20;
        float photoHeight = photoWidth/16 *9;
        
        return photoHeight +10 +10;
    }
    
    return 0;
}



#pragma mark -点击切换分类
-(void)sectionBtnClicked:(UIButton *)btn
{
    float slideViewWidth = btn.frame.size.width;
    
    float slideViewGap = (_sectionView.frame.size.width -slideViewWidth *4)/3;
    
    NSInteger tagIndex = btn.tag -1000;
    
    if (_selectedInex == tagIndex) {
        return;
    }
    
    
    UIFont * normalFont = [VibeFont fontWithName:Font_Chinese_Regular size:14];
    UIFont * selectedFont = [VibeFont fontWithName:Font_Chinese_Regular size:16];
    
    if (_selectedInex == 0) {
        [_productsBtn setSelected:NO];
        [_productsBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 1) {
        [_topicsBtn setSelected:NO];
        [_topicsBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 2) {
        [_storiesBtn setSelected:NO];
        [_storiesBtn.titleLabel setFont:normalFont];
    }
    if (_selectedInex == 3) {
        [_shopsBtn setSelected:NO];
        [_shopsBtn.titleLabel setFont:normalFont];
    }
    
    //之前点击的按钮与现在的差
    NSInteger betweenIndex = _selectedInex -tagIndex;
    if (betweenIndex <0) {
        betweenIndex = -betweenIndex;
    }
    
    _selectedInex = tagIndex;
    

    if (tagIndex == 0) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            
            [_slideView setFrame:CGRectMake(0, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
            [_contentScrollView setContentOffset:CGPointMake(0, 0)];
            
        } completion:^(BOOL finished) {
            [_productsBtn setSelected:YES];
            [_productsBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 1) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{

            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) , _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
            [_contentScrollView setContentOffset:CGPointMake(kScreenWidth, 0)];

        } completion:^(BOOL finished) {
            [_topicsBtn setSelected:YES];
            [_topicsBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 2) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            
            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) *2, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
            [_contentScrollView setContentOffset:CGPointMake(kScreenWidth *2, 0)];
            
        } completion:^(BOOL finished) {
            [_storiesBtn setSelected:YES];
            [_storiesBtn.titleLabel setFont:selectedFont];
        }];
    }
    if (tagIndex == 3) {
        [UIView animateWithDuration:0.15 *betweenIndex animations:^{
            
            [_slideView setFrame:CGRectMake( (slideViewWidth +slideViewGap) *3, _sectionView.frame.size.height -10 -4, slideViewWidth, 4)];
            [_contentScrollView setContentOffset:CGPointMake(kScreenWidth *3, 0)];

        } completion:^(BOOL finished) {
            [_shopsBtn setSelected:YES];
            [_shopsBtn.titleLabel setFont:selectedFont];
        }];
    }
    
}


-(void)rightBtnClicked:(id)sender
{
    
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}


@end




