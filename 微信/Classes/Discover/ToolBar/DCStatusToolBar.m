//
//  DCStatusToolBar.m
//  微信
//
//  Created by 尚承教育 on 15/8/4.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusToolBar.h"
#import "DCStatus.h"
@interface DCStatusToolBar()
@property (strong, nonatomic) UIButton *btn;

@property (strong, nonatomic) UIButton *repostsBtn;
@property (strong, nonatomic) UIButton *commentsBtn;
@property (strong, nonatomic) UIButton *attitudesBtn;

@property(strong,nonatomic)UILabel *labelTime;
@property(strong,nonatomic)UILabel *labelSource;

@end
@implementation DCStatusToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        CGFloat btnH = 35;
        CGFloat btnW = btnH;
        CGFloat btnX = 340;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, 0, btnW, btnH)];
        [btn setImage:[UIImage imageWithName:@"timeline_icon_comment"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(commentClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UILabel *labelTime = [[UILabel alloc]initWithFrame:CGRectMake(55, -8, 60, 35)];
        labelTime.font = [UIFont systemFontOfSize:14];
        labelTime.textAlignment = NSTextAlignmentLeft;
        self.labelTime = labelTime;
        labelTime.textColor = [UIColor orangeColor];
        [self addSubview:labelTime];
        
        UILabel *labelSource = [[UILabel alloc]initWithFrame:CGRectMake(114, -8, 200, 35)];
        labelSource.font = [UIFont systemFontOfSize:14];
        self.labelSource = labelSource;
        [self addSubview:labelSource];
        
    }
    return self;
}

-(void)commentClick
{
    NSLog(@"----commentClick---");
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(20, 10, 100, 20);
    [self addSubview:btn];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
}


-(void)setStatus:(DCStatus *)status
{
    _status = status;
    
    self.labelTime.text = status.created_at;
    self.labelSource.text = status.source;
}


@end
