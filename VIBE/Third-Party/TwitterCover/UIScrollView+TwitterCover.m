
//
//  UIScrollView+TwitterCover.m
//  TwitterCover
//
//  Created by hangchen on 1/7/14.
//  Copyright (c) 2014 Hang Chen (https://github.com/cyndibaby905)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIScrollView+TwitterCover.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

static char UIScrollViewTwitterCover;

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@implementation UIScrollView (TwitterCover)

- (void)setTwitterCoverView:(CHTwitterCoverView *)twitterCoverView {
    [self willChangeValueForKey:@"twitterCoverView"];
    objc_setAssociatedObject(self, &UIScrollViewTwitterCover,
                             twitterCoverView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"twitterCoverView"];
}

- (CHTwitterCoverView *)twitterCoverView {
    return objc_getAssociatedObject(self, &UIScrollViewTwitterCover);
}


- (void)addTwitterCoverWithImage:(UIImage*)image
{
    CHTwitterCoverView *view = [[CHTwitterCoverView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, CHTwitterCoverViewHeight)];
    
    view.backgroundColor = [UIColor clearColor];
    view.image = view.placeHolderImg;
    view.scrollView = self;
    
    [self addSubview:view];
    self.twitterCoverView = view;
    
    UIView * shadowView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth*2, CHTwitterCoverViewHeight + 200)];
    [shadowView setBackgroundColor:[UIColor blackColor]];
    [shadowView setAlpha:0.2];
    [view addSubview:shadowView];
    
}
-(void)clearMemory
{
    [self.twitterCoverView clearArr];
}

@end

@interface CHTwitterCoverView ()


@property (strong, nonatomic) NSOperationQueue *operationQueue;
@property (assign, atomic) CGFloat factor;
@end


@implementation CHTwitterCoverView
{
    NSMutableArray *blurImages_;
}

-(void)clearArr
{
    [blurImages_ removeAllObjects];
    if (self.placeHolderImg) {
        [blurImages_ addObject:self.placeHolderImg];
    }
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        blurImages_ = [[NSMutableArray alloc] init];
        
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
        self.placeHolderImg = [UIImage imageNamed:@"Mine_TwitterHead1"];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    
    if (image &&image == self.placeHolderImg) {
        [blurImages_ removeAllObjects];
        [super setImage:image];
        [blurImages_ addObject:image];
        return;
    }
    if (image) {
        
        [self.operationQueue cancelAllOperations];
        
        while (self.operationQueue.operations.count != 0) {
            
        }
     
        self.factor = 0.1;
        [blurImages_ removeAllObjects];
        [super setImage:image];
        [self prepareForBlurImages];
    }
}

- (void)prepareForBlurImages {
    
    [blurImages_ addObject:self.image];
    for (NSUInteger i = 0; i < 2; i++) {
        
        CGFloat blur = self.factor;
        
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            [self addBlurImage:blur];
        }];
        self.factor += 0.2;
        
        [self.operationQueue addOperation:operation];
        
    }
    
}

- (void)addBlurImage:(CGFloat)factor {
    
    @try {
        
        @synchronized(blurImages_) {
            [blurImages_ addObject:[self.image boxblurImageWithBlur:factor]];
        }
        
    }
    @catch (NSException *exception) {
       
    }
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.scrollView.contentOffset.y < 0) {
        
        if (blurImages_.count >0) {
            CGFloat offset = -self.scrollView.contentOffset.y;
            
            self.frame = CGRectMake(-offset,-offset, kScreenWidth + offset * 2, CHTwitterCoverViewHeight + offset);
            NSInteger index = offset / 2;
            if (index < 0) {
                index = 0;
            }
            else if(index >= blurImages_.count) {
                index = blurImages_.count - 1;
            }
            
            UIImage *image = blurImages_[index];
            if (self.image != image) {
                [super setImage:image];
            }
            
        }
        
    }else {
        self.frame = CGRectMake(0,0, kScreenWidth, CHTwitterCoverViewHeight);
        UIImage *image;
        if (blurImages_.count >0) {
             image = blurImages_[0];
        }
        
        
        if (self.image != image &&image) {
            [super setImage:image];
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsLayout];
}

@end

@implementation UIImage (Blur)

-(UIImage *)boxblurImageWithBlur:(CGFloat)blur {
    
    NSData *imageData = UIImageJPEGRepresentation(self, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}


@end





