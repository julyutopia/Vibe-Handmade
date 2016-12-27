//
//  SimpleCameraCell.m
//  SimpleImagePicker
//
//  Created by 田祥根 on 15/6/23.
//
//

#import "SimpleCameraCell.h"

@implementation SimpleCameraCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imageView.image = [UIImage imageNamed:@"take_camera"];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


@end
