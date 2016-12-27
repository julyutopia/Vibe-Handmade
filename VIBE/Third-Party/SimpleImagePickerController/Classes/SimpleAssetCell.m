//
//  QBAssetCell.m
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/06.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import "SimpleAssetCell.h"

@interface SimpleAssetCell ()
{
    QBVideoIndicatorView *m_videoIndicatorView;
//    UIImageView *m_overlayView;
}
@end

@implementation SimpleAssetCell

@synthesize photoImageView = _photoImageView;
@synthesize originalImage = _originalImage;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.photoImageView = [[GLImageView alloc] initWithFrame:self.bounds];
        [self.photoImageView addTarget:self action:@selector(selectedPhotoImgView:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.photoImageView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)setCellImage:(UIImage *)image WithAsset:(ALAsset *)asset
{
    [self.photoImageView setImage:image];
    
    _assetttt = asset;
}


-(void)selectedPhotoImgView:(GLImageView *)imageView
{
    if ([_delegate respondsToSelector:@selector(didSelectPhoto:WithAsset:)]) {
        [_delegate didSelectPhoto:self.photoImageView WithAsset:_assetttt];
    }
}


- (void)setSelected:(BOOL)selected
{
    if (self.selected == selected)
    {
        return;
    }
    [super setSelected:selected];
    
//    // Show/hide overlay view
//    if (self.selected)
//    {
//        m_overlayView.image = [UIImage imageNamed:@"selected.png"];
//        m_overlayView.layer.borderWidth = 0.f;
//        CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//        k.values = @[@(0.1),@(1.0),@(1.25)];
//        k.keyTimes = @[@(0.0),@(0.2),@(0.8),@(1.0)];
//        k.calculationMode = kCAAnimationLinear;
//        [m_overlayView.layer addAnimation:k forKey:@"Show"];
//    }
//    else
//    {
//        m_overlayView.image = nil;
//        m_overlayView.layer.borderWidth = 1.f;
//    }
}

@end
