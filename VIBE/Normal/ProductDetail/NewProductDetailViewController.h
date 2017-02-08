//
//  NewProductDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/2/6.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "ProductDetailHeaderTableViewCell.h"
#import "ProductDetailTagTableViewCell.h"
#import "ProductDetailInfoTableViewCell.h"
#import "ProductDetailShowTableViewCell.h"

#import "ProductDetailGuessHeaderTableViewCell.h"
#import "ProductDetailGuessProductTableViewCell.h"

@interface NewProductDetailViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    VibeProductModal    * _productDetailModal;

    //背景模糊图片
    UIImageView         * _blurImgView;
    
    //白色的背景
    UIView              * _contentBackView;
    
    UITableView         * _productTableview;
    UIView              * _tableFooterView;

    //底部显示的内容
    float                 _bottomViewHeight;
    UIView              * _bottomView;
    VibeShowMoneyView   * _showMoneyView;
    UIButton            * _favorBtn;
    UIButton            * _buyBtn;
}

@property(retain, nonatomic)    VibeProductModal    * productDetailModal;

@end



