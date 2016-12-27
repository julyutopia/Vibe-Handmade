//
//  MineFavorStoresTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/8/13.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "MineFavorStoresTableViewCell.h"

@implementation MineFavorStoresTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        UIERealTimeBlurView * _backView;
//        
//        UIImageView * _storeImgView;
//        UILabel * _storeNameLabel;
//        
//        UIImageView * _storeIconImgView;
//        UILabel     * _storeNameImgView;
//        
//        UIView      * _showTagsView;
//        
//        UIView      * _showProductsView;
        
        
//        UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:RGBA(20, 20, 20, 40)];
        [_backView setUserInteractionEnabled:NO];
        [self addSubview:_backView];
        

        _backImgView = [[GLImageView alloc]initWithFrame:CGRectZero];
        [_backImgView addTarget:self action:@selector(clickMineFavorStore) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backImgView];
        
        _storeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 55, 55)];
        [_storeImgView.layer setCornerRadius:27.5];
        [_storeImgView.layer setMasksToBounds:YES];
        [_backImgView addSubview:_storeImgView];
        
        NSString * name = @"店名";
        UIFont * nameFont = [UIFont fontWithName:Default_Font_Bold size:16];
        CGSize nameSize = [name getSizeWithLimitSize:CGSizeMake(200, 20) withFont:nameFont];
        
        
        NSString * owner = @"店主";
        UIFont * ownerFont = [UIFont fontWithName:Default_Font size:12];
        CGSize ownerSize = [owner getSizeWithLimitSize:CGSizeMake(200, 15) withFont:ownerFont];
        
        
        _storeNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 +55 +10, 10, 200, nameSize.height)];
        [_storeNameLabel setTextAlignment:NSTextAlignmentLeft];
        [_storeNameLabel setTextColor:[UIColor whiteColor]];
        [_storeNameLabel setFont:nameFont];
        [_backImgView addSubview:_storeNameLabel];
        
        _storeIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10 +55 +10, 10 +nameSize.height +5, 12, 12)];
        [_storeIconImgView setImage:[UIImage imageNamed:@"Category_Store_Owner"]];
        [_storeIconImgView setAlpha:0.5f];
        [_backImgView addSubview:_storeIconImgView];
        
        
        _storeOwnerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 +55 +10 +12 +2, 10 +nameSize.height +5, 200, ownerSize.height)];
        [_storeOwnerLabel setTextAlignment:NSTextAlignmentLeft];
        [_storeOwnerLabel setTextColor:RGBA(255, 255, 255, 50)];
        [_storeOwnerLabel setFont:ownerFont];
        [_backImgView addSubview:_storeOwnerLabel];
        
        [_storeIconImgView setCenterY:10 +27];
        [_storeOwnerLabel setCenterY:10 +27];
        
        
        _showTagsView = [[UIView alloc]initWithFrame:CGRectMake(70, 65 -16, kScreenWidth -30 -70 -10, 16)];
        [_showTagsView setBackgroundColor:[UIColor clearColor]];
        [_showTagsView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_showTagsView];
        
        
        _imgViewHeight = (kScreenWidth -30 -10 -10 - 15 *3 )/4;
        
        _totalHeight = 10 +55 +15 +_imgViewHeight + 10;

        _showProductsView = [[UIView alloc]initWithFrame:CGRectMake(10, 10 +55 +15, kScreenWidth -30 -20, _imgViewHeight)];
        [_showProductsView setBackgroundColor:[UIColor clearColor]];
        [_showProductsView setUserInteractionEnabled:NO];
        [_backImgView addSubview:_showProductsView];
        
        
        _storeCellLine = [[UIView alloc]initWithFrame:CGRectMake(10, 160 -0.5, kScreenWidth -30 -20, 0.5)];
        [_storeCellLine setBackgroundColor:DefaultQYTextColor20];
        [_storeCellLine setAlpha:0.8f];
        [_backImgView addSubview:_storeCellLine];
    
        
        _maskLayer = [[CAShapeLayer alloc] init];
        
        float widthhh = 60;
        float heightt = 15;
        
        _bottomTitleBtn = [[UIButton alloc]initWithFrame:CGRectMake(  (kScreenWidth -widthhh)/2, _totalHeight +15, widthhh, heightt)];
        [_bottomTitleBtn setBackgroundImage:[UIImage imageNamed:@"Mine_Products_All"] forState:UIControlStateNormal];
        [_bottomTitleBtn addTarget:self action:@selector(showFavorAllStores) forControlEvents:UIControlEventTouchUpInside];
        [_bottomTitleBtn setHidden:YES];
        [self addSubview:_bottomTitleBtn];

    }
    
    return self;
}


-(void)setMineStoreCellWithModal:(CategoryStoreModal *)modal Index:(NSInteger )index IsLast:(BOOL)last
{
    _cellIndex = index;
    
  
    
    if (!_storeModal) {
        
        
        if (last) {
            
            [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, _totalHeight +40)];
            [_backImgView setFrame:CGRectMake(15, 0, kScreenWidth -30, _totalHeight)];
            
            [_storeCellLine setHidden:YES];
            
            [_bottomTitleBtn setHidden:NO];

            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
            _maskLayer.frame = _backView.bounds;
            _maskLayer.path = maskPath.CGPath;
            _backView.layer.mask = _maskLayer;
            
        }
        else{
            [_backView setFrame:CGRectMake(15, 0, kScreenWidth -30, _totalHeight)];
            [_backImgView setFrame:CGRectMake(15, 0, kScreenWidth -30, _totalHeight)];
            
            [_storeCellLine setHidden:NO];
            
            [_bottomTitleBtn setHidden:YES];
        }
        
        
        _storeModal = modal;
        
        [_storeImgView sd_setImageWithURL:[NSURL URLWithString:modal.storeIconImgURL] placeholderImage:nil];
        [_storeNameLabel setText:modal.storeTitle];
        
        [_storeOwnerLabel setText:modal.storeOwnerName];
        
        if (modal.storeTagsArray.count) {
            
            for (int i =0; i <modal.storeTagsArray.count; i++) {
                
                NSDictionary * tagDict = [modal.storeTagsArray objectAtIndex:i];
                NSString * tagName = [tagDict objectForKey:@"tagName"];
                
                UIFont * tagFont = [UIFont fontWithName:Default_Font size:12];
                
                float tagTextLength = [tagName getSizeWithLimitSize:CGSizeMake(160, 18) withFont:tagFont].width;
                
                if (_tagsViewLeftOrigin +tagTextLength +12 +5 >=kScreenWidth -30 -70 -10) {
                    return;
                }
                
                UIView * tagView = [[UIView alloc]initWithFrame:CGRectMake(_tagsViewLeftOrigin, 0, tagTextLength +12, 16)];
                [tagView setBackgroundColor:DefaultGreen];
                [tagView.layer setCornerRadius:7];
                [tagView.layer setMasksToBounds:YES];
                [_showTagsView addSubview:tagView];
                
                UILabel * tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, tagTextLength, 16)];
                [tagLabel setTextAlignment:NSTextAlignmentCenter];
                [tagLabel setTextColor:[UIColor whiteColor]];
                [tagLabel setFont:tagFont];
                [tagLabel setText:tagName];
                [tagView addSubview:tagLabel];
                
                _tagsViewLeftOrigin = _tagsViewLeftOrigin +tagTextLength +12 +8;
            }
        }
        
        if (modal.storeTopProductsArray.count) {
            
            if (modal.storeTopProductsArray.count >4) {
                [modal.storeTopProductsArray removeAllObjects];
                [modal.storeTopProductsArray addObjectsFromArray:[modal.storeTopProductsArray subarrayWithRange:NSMakeRange(0, 3)]];
            }
            
            float productGap = 15;
            
            for (int i =0; i <modal.storeTopProductsArray.count; i++) {
                
                NSDictionary * dict = [modal.storeTopProductsArray objectAtIndex:i];
                NSString * productImgUrl = [dict objectForKey:@"storeImageURL"];
                
                UIImageView * productImgView = [[UIImageView alloc]initWithFrame:CGRectMake( (_imgViewHeight +productGap) *i, 0, _imgViewHeight, _imgViewHeight)];
                [productImgView sd_setImageWithURL:[NSURL URLWithString:productImgUrl] placeholderImage:nil];
                
                [_showProductsView addSubview:productImgView];
                
                
                UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                UIVisualEffectView * productTopView = [[UIVisualEffectView alloc]initWithEffect:beffect];
                [productTopView setAlpha:0.1];
                [productTopView setFrame:productImgView.frame];
                [_showProductsView addSubview:productTopView];

            }
            
        }
        
        
    }
    
}


-(void)clickMineFavorStore
{
    if ([_delegate respondsToSelector:@selector(showMineFavorStoreWithIndex:)]) {
        [_delegate showMineFavorStoreWithIndex:_cellIndex];
    }
}


-(void)showFavorAllStores
{
    if ([_delegate respondsToSelector:@selector(showMineFavorStoreAll)]) {
        [_delegate showMineFavorStoreAll];
    }
}


@end


