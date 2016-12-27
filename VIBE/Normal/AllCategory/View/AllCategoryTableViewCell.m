//
//  AllCategoryTableViewCell.m
//  VIBE
//
//  Created by Li Haii on 16/9/6.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import "AllCategoryTableViewCell.h"

#import "TDImageColors.h"

@interface AllCategoryTableViewCell()

@property (nonatomic, strong, readwrite) UIImageView *MJImageView;

@property (nonatomic, strong, readwrite) UIView     * colorView;

@property (nonatomic, strong, readwrite) UIView     * nameView;
@property (nonatomic, strong, readwrite) UIVisualEffectView * nameBackView;
@property (nonatomic, strong, readwrite) UILabel            * nameLabel;

@property (nonatomic, strong, readwrite) TDImageColors      * imageColors;

@end


@implementation AllCategoryTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) [self setupImageView];
    return self;
}



#pragma mark - Setup Method
- (void)setupImageView
{
    // Clip subviews
    self.clipsToBounds = YES;
    
    // Add image subview
    self.MJImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, kScreenWidth, kScreenWidth/2)];
    self.MJImageView.backgroundColor = [UIColor clearColor];
    self.MJImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.MJImageView.clipsToBounds = NO;
    [self addSubview:self.MJImageView];
    
    
    self.colorView = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, kScreenWidth, kScreenWidth/2)];
    [self.colorView setAlpha:0.35];
    [self addSubview:self.colorView];
    
    
    self.nameView = [[UIView alloc]init];
    [self.nameView setAlpha:0.9];
    [self addSubview:self.nameView];
    
    
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.nameBackView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    [self.nameBackView setFrame:CGRectZero];
    [self.nameBackView.layer setMasksToBounds:YES];
    [self.nameBackView setAlpha:0.8f];
    [self addSubview:self.nameBackView];
    
    
    self.nameLabel = [[UILabel alloc]init];
    [self.nameLabel setTextColor:[UIColor whiteColor]];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setFont:[VibeFont fontWithName:Default_Font_Middle size:16]];
    [self addSubview:self.nameLabel];
    
}

# pragma mark - Setters

-(void)setCategoryCellWithName:(NSString *)name imgUrl:(NSString *)img ID:(NSInteger )cateID
{
    [self.MJImageView sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        // Update padding
        [self setImageOffset:self.imageOffset];
        
        if (!self.imageColors) {
            self.imageColors = [[TDImageColors alloc]initWithImage:image count:1];
            UIColor * colorrr =  [self.imageColors.colors objectAtIndex:0];
            
            [self.colorView setBackgroundColor:colorrr];
            [self.nameView setBackgroundColor:colorrr];
            
            [self.nameView.layer setShadowOffset:CGSizeMake(2, 2)];
            [self.nameView.layer setShadowOpacity:0.6f];
            [self.nameView.layer setShadowColor:RGBA(0, 0, 0, 70).CGColor];
        }

        CGSize nameSize = [name getSizeWithLimitSize:CGSizeMake(300, 30) withFont:self.nameLabel.font];
        
        [self.nameLabel setFrame:CGRectMake((kScreenWidth -nameSize.width)/2, (kScreenWidth/2 -(nameSize.height +2))/2, nameSize.width, nameSize.height +2)];
        [self.nameLabel setText:name];
        
        [self.nameBackView setFrame:CGRectMake( (kScreenWidth -(nameSize.width +40))/2, (kScreenWidth/2 -(nameSize.height +10))/2, nameSize.width +40, nameSize.height +10)];
        [self.nameBackView.layer setCornerRadius:(nameSize.height +10)/2];
        
        [self.nameView setFrame:self.nameBackView.frame];
        [self.nameView.layer setCornerRadius:(nameSize.height +10)/2];

    }];
    
}


- (void)setImageOffset:(CGPoint)imageOffset
{
    NSLog(@"________%g_________",imageOffset.y);
    
    // Store padding value
    _imageOffset = imageOffset;
    
    // Grow image view
    CGRect frame = self.MJImageView.bounds;
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    self.MJImageView.frame = offsetFrame;
}








@end


