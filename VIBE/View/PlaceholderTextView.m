//
//  PlaceholderTextView.m
//  SaleHelper
//
//  Created by gitBurning on 14/12/8.
//  Copyright (c) 2014年 Burning_git. All rights reserved.
//

#import "PlaceholderTextView.h"

@interface PlaceholderTextView()<UITextViewDelegate>

//最大长度设置
@property(assign,nonatomic) NSInteger maxTextLength;


@property(copy,nonatomic) id eventBlock;
@property(copy,nonatomic) id BeginBlock;
@property(copy,nonatomic) id EndBlock;



@end
@implementation PlaceholderTextView
- (id) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self awakeFromNib];
    }
    return self;
}


- (void)awakeFromNib {
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidChange:) name:UITextViewTextDidChangeNotification object:self];
    
    //UITextViewTextDidBeginEditingNotification
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewBeginNoti:) name:UITextViewTextDidBeginEditingNotification object:self];
    
    //UITextViewTextDidEndEditingNotification
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEndNoti:) name:UITextViewTextDidEndEditingNotification object:self];

    float left=12,top=3,hegiht=30;
    
    self.placeholderColor = [UIColor lightGrayColor];
    _placeholderLabel=[[UILabel alloc] initWithFrame:CGRectMake(left, top
                                                               , CGRectGetWidth(self.frame)-2*left, hegiht)];
    _placeholderLabel.font=self.placeholderFont?self.placeholderFont:self.font;
    _placeholderLabel.textColor=self.placeholderColor;
    [self addSubview:_placeholderLabel];
    _placeholderLabel.text=self.placeholder;
    
    self.maxTextLength=1000;

}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)setPlaceholder:(NSString *)placeholder{
    if (placeholder.length == 0 || [placeholder isEqualToString:@""]) {
        _placeholderLabel.hidden=YES;
    }
    else
        _placeholderLabel.text=placeholder;
    _placeholder=placeholder;

    
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderLabel.textColor=placeholderColor;
    _placeholderColor=placeholderColor;
}
-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderLabel.font=placeholderFont;
    _placeholderFont=placeholderFont;
}
-(void)setText:(NSString *)tex{
    if (tex.length>0) {
        _placeholderLabel.hidden=YES;
    }
    [super setText:tex];
}

#pragma mark---一些通知
-(void)DidChange:(NSNotification*)noti{
    
    if (self.placeholder.length == 0 || [self.placeholder isEqualToString:@""]) {
        _placeholderLabel.hidden=YES;
    }
    
    if (self.text.length > 0) {
        _placeholderLabel.hidden=YES;
    }
    else{
        _placeholderLabel.hidden=NO;
    }
    
    
    if (_eventBlock && self.text.length > self.maxTextLength) {
        
        void (^limint)(PlaceholderTextView*text) =_eventBlock;
        
        limint(self);
    }
}


-(void)textViewBeginNoti:(NSNotification*)noti{
    
    if (_BeginBlock) {
        void(^begin)(PlaceholderTextView*text)=_BeginBlock;
        begin(self);
    }
}
-(void)textViewEndNoti:(NSNotification*)noti{
 
    if (_EndBlock) {
        void(^end)(PlaceholderTextView*text)=_EndBlock;
        end(self);
    }
}



#pragma mark----使用block 代理 delegate
-(void)addMaxTextLengthWithMaxLength:(NSInteger)maxLength andEvent:(void (^)(PlaceholderTextView *))limit{
    _maxTextLength=maxLength;
    
    if (limit) {
        _eventBlock=limit;

    }
}

-(void)addTextViewBeginEvent:(void (^)(PlaceholderTextView *))begin{
    
    _BeginBlock=begin;
}

-(void)addTextViewEndEvent:(void (^)(PlaceholderTextView *))End{
    _EndBlock=End;
}



-(void)setUpdateHeight:(float)updateHeight{
    
    CGRect frame=self.frame;
    frame.size.height=updateHeight;
    self.frame=frame;
    _updateHeight=updateHeight;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_placeholderLabel removeFromSuperview];
    
}

@end
