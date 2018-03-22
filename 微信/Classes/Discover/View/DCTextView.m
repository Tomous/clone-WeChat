//
//  DCTextView.m
//  微信
//
//  Created by 尚承教育 on 15/8/5.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCTextView.h"

@interface DCTextView()

@property (strong, nonatomic) UILabel *placeLabel;

@end

@implementation DCTextView

-(instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    if (self = [super initWithFrame:frame textContainer:textContainer]) {
        
        // 总是能滚动
        self.alwaysBounceVertical = YES;
        
        UILabel *placeLabel = [[UILabel alloc]init];
        placeLabel.numberOfLines = 0;
        
        placeLabel.textColor = [UIColor grayColor];
        
        [self addSubview:placeLabel];
        self.placeLabel = placeLabel;
        
        self.font = [UIFont systemFontOfSize:15];
        
        
        //        self.delegate = self;
        
        //        通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

-(void)textChange
{
    self.placeLabel.hidden = self.text.length != 0;
}

// 外界改变textView的font会调用setFont，保持textView的font和placeLabel的font一致
-(void)setFont:(UIFont *)font
{
    // 重新给self.font赋值
    [super setFont:font];
    
    self.placeLabel.font = self.font;
    
    // 根据最新的文字的大小font,重新计算placelabel的size
    [self setNeedsLayout];
}

-(void)setPlaceHoledr:(NSString *)placeHoledr
{
    _placeHoledr = placeHoledr;
    
    self.placeLabel.text = placeHoledr;
    
    // 根据最新的文字多少重新计算placelabel的size
    [self setNeedsLayout];
}

-(void)setPlaceHoledrColor:(UIColor *)placeHoledrColor
{
    _placeHoledrColor = placeHoledrColor;
    
    self.placeLabel.textColor = placeHoledrColor;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeLabel.x = 5;
    self.placeLabel.y = 8;
    self.placeLabel.width = self.width - self.placeLabel.x * 2;
    
    CGSize maxSize = CGSizeMake(self.placeLabel.width, MAXFLOAT);
    
    CGSize size = [self.placeLabel.text sizeWithFont:self.placeLabel.font constrainedToSize:maxSize];
    
    self.placeLabel.height = size.height;
}

//每次程序结束的时候调用 注销通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
