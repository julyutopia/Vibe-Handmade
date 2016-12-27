//
//  AlbumCell.h
//  TheThing
//
//  Created by Leno on 15/7/17.
//  Copyright (c) 2015年 Leno. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlbumCellDelegate;


#import "GLImageView.h"
#import "AMBlurView.h"

@interface AlbumCell : UITableViewCell
{
    GLImageView * _backImgView;
    AMBlurView * _backView;
    
    UIImageView * _photoImgView;
    
    UILabel     * _albumLabel;
    
    UILabel     * _countLabel;
    UILabel     * _zhangLabel;
}

@property (nonatomic, assign) id<AlbumCellDelegate> delegate;

-(void)setAlbumCellWithImage:(UIImage *)image Title:(NSString *)title Count:(NSInteger )count WithAlbumIndex:(NSInteger )index;

@end

@protocol AlbumCellDelegate <NSObject>

-(void)didSelectAlbumWithIndex:(NSInteger )index;

@end



