//
//  QBAssetCell.h
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/06.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AssetsLibrary/AssetsLibrary.h>

#import "GLImageView.h"

@class QBVideoIndicatorView;

@protocol SimpleAssetCellDelegate;

@interface SimpleAssetCell : UICollectionViewCell
{
    ALAsset * _assetttt;
}

@property (nonatomic,strong) GLImageView* photoImageView;

@property (nonatomic,strong) UIImage    * originalImage;

@property (nonatomic, assign) id<SimpleAssetCellDelegate>   delegate;

-(void)setCellImage:(UIImage *)image WithAsset:(ALAsset *)asset;

@end


@protocol SimpleAssetCellDelegate <NSObject>

-(void)didSelectPhoto:(GLImageView *)imageView WithAsset:(ALAsset *)asset;

@end