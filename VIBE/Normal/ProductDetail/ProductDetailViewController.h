//
//  ProductDetailViewController.h
//  VIBE
//
//  Created by Li Haii on 16/8/25.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "VibeViewController.h"

#import "VibeProductModal.h"

#import "ProductDetailHeaderTableViewCell.h"
#import "ProductDetailInfoTableViewCell.h"
#import "ProductDetailShowTableViewCell.h"

#import "ProductDetailGuessHeaderTableViewCell.h"
#import "ProductDetailGuessProductTableViewCell.h"

#import "SDWebImageManager.h"

@interface ProductDetailViewController : VibeViewController<UITableViewDelegate, UITableViewDataSource>
{
    UIView              * _naviView;
    
    UIButton            * _blackBackBtn;
    
    UITableView * _productDetailTable;
    
    VibeProductModal    * _productDetailModal;
    
    UIView              * _bottomView;
    
    VibeShowMoneyView   * _showMoneyView;
    
    UIButton            * _favorBtn;
    UIButton            * _buyBtn;
    
  
    UIButton            * _bottom_ShareBtn;
    UIButton            * _bottom_FavorBtn;
    UIButton            * _bottom_BuyBtn;
    
    UIView              * _sectionFooterView;
}

@property(assign, nonatomic)    NSInteger            productID;

@property(retain, nonatomic)    VibeProductModal    * productDetailModal;


@end
