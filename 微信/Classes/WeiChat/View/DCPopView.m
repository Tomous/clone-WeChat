//
//  DCPopView.m
//  微信
//
//  Created by 尚承教育 on 15/7/22.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCPopView.h"

@interface DCPopView ()

@property(strong,nonatomic)UIView *contentView;

@property(weak,nonatomic)UIImageView *pop;
@property (weak,nonatomic)UIButton *cover;

@end
@implementation DCPopView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        // 初始化
        UIButton *cover = [[UIButton alloc]init];
        cover.backgroundColor = [UIColor greenColor];
        [cover addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;

        
        UIImageView *pop = [[UIImageView alloc]init];
        // 默认imageview不能接受事件
        pop.userInteractionEnabled = YES;
        
//        pop.image = [UIImage resizableImage:@"popover_background"];
        [self addSubview:pop];
        self.pop = pop;

        
    }
    return self;
    
}

-(void)clickBtn
{
    [self removeFromSuperview];
}
-(instancetype)initWithContentView:(UIView *)contentView
{
    _contentView = contentView;
    
    if (self = [super init]) {
        
    }
    return self;
}

+(instancetype)popViewWithContentView:(UIView *)contentView
{
    return [[self alloc]initWithContentView:contentView];
}

-(void)setDimBackgroud:(BOOL)dimBackgroud
{
    _dimBackgroud = dimBackgroud;
    
    // 改变cover的背景
    if (dimBackgroud) {
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 0.4;
        
    }
    else
    {
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }

}

-(void)showInRect:(CGRect)rect
{
    // 设置pop被指定的位置
    self.pop.frame = rect;
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    self.frame = window.bounds;
    self.contentView.x = 5;
    self.contentView.y = 10;
    self.contentView.width = self.pop.width - 10;
    self.contentView.height = self.pop.height - 20;
//    self.contentView.backgroundColor = [UIColor redColor];
    [self.pop addSubview:self.contentView];
    
    [window addSubview:self];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cover.frame = [UIScreen mainScreen].bounds;
}


-(void)setArrowPosition:(DCPopViewArrowPosition)arrowPosition
{
    switch (arrowPosition) {
        case DCPopViewArrowPositionRenter:
            self.pop.image = [UIImage resizableImage:@"popover_background"];
            break;
        case DCPopViewArrowPositionLeft:
            self.pop.image = [UIImage resizableImage:@"popover_background_left"];
            break;
            
        case DCPopViewArrowPositionRight:
            self.pop.image = [UIImage resizableImage:@"popover_background_right"];
            break;

            
        default:
            break;
    }
}
@end
