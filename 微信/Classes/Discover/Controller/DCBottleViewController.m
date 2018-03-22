//
//  DCBottleViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/29.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//
//#define 250 150;
#import "DCBottleViewController.h"
#import "DCMyBottleViewController.h"
#import "DCNavigationViewController.h"
@interface DCBottleViewController ()

@property(strong,nonatomic)UIButton *coverBtn;
@property(strong,nonatomic) UIView *imageview;

@end

@implementation DCBottleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"MoreSetting" higImageName:nil action:@selector(setting) target:self];
    
    [self setupImageView];
    
    [self setupDonghua];
    
}

-(void)setupDonghua
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 30, 30)];
    imageview.image = [UIImage imageNamed:@"sandyBalloon"];
    self.imageview = imageview;
    [self.view addSubview:imageview];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(donghua) userInfo:nil repeats:YES];
    
    [timer fire];

}
-(void)donghua
{
    
    [UIView animateWithDuration:10 animations:^{
        self.imageview.x += (20 + (arc4random() % 2)) ;
        self.imageview.y += (20 + (arc4random() % 2) ) ;
        
        if (self.imageview.x > 250 || self.imageview.y > 150) {
            self.imageview.x -= (20 + (arc4random() % 2)) ;
            self.imageview.y -= (20 + (arc4random() % 2)) ;
        }
    }];
        
    
 
}
-(void)setupImageView
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imgView.image = [UIImage imageWithName:@"bottleNightBkg-1"];
    imgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgViewClick)];
    [imgView addGestureRecognizer:gesture];
    [self.view addSubview:imgView];
    
    CGFloat viewX = 0;
    CGFloat viewW = self.view.width;
    CGFloat viewH = 40;
    CGFloat viewY = self.view.height - viewH;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageWithName:@"bottleBoard"];
    [self.view addSubview:imageView];
    
    CGFloat btn1X = 0;
    CGFloat btn1H = 40;
    CGFloat btn1W = imageView.width / 3;
    CGFloat btn1Y = 0;
    UIButton *Btn1 = [[UIButton alloc]initWithFrame:CGRectMake(btn1X, btn1Y, btn1W, btn1H)];
    
    CGFloat btn2X = btn1W;
    CGFloat btn2H = btn1H;
    CGFloat btn2W = btn1W;
    CGFloat btn2Y = 0;
    UIButton *Btn2 = [[UIButton alloc]initWithFrame:CGRectMake(btn2X, btn2Y, btn2W, btn2H)];
    
    CGFloat btn3X = btn2W * 2;
    CGFloat btn3H = btn1H;
    CGFloat btn3W = btn1W;
    CGFloat btn3Y = 0;
    UIButton *Btn3 = [[UIButton alloc]initWithFrame:CGRectMake(btn3X, btn3Y, btn3W, btn3H)];
    
    [Btn1 setImage:[UIImage imageWithName:@"bottleButtonThrow"] forState:UIControlStateNormal];
    Btn1.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn1 setTitle:[NSString stringWithFormat:@"扔一个"] forState:UIControlStateNormal];
    Btn1.titleEdgeInsets = UIEdgeInsetsMake(15, -100, 0, -5);
    [Btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    [Btn2 setImage:[UIImage imageWithName:@"bottleButtonFish"] forState:UIControlStateNormal];
    Btn2.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn2 setTitle:[NSString stringWithFormat:@"捡一个"] forState:UIControlStateNormal];
    Btn2.titleEdgeInsets = UIEdgeInsetsMake(15, -100, 0, -5);
    [Btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    [Btn3 setImage:[UIImage imageWithName:@"bottleButtonMine"] forState:UIControlStateNormal];
    Btn3.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn3 setTitle:[NSString stringWithFormat:@"我的瓶子"] forState:UIControlStateNormal];
    Btn3.titleEdgeInsets = UIEdgeInsetsMake(15, -100, 0, -5);
    [Btn3 addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:Btn1];
    [imageView addSubview:Btn2];
    [imageView addSubview:Btn3];


}

-(void)setting
{
    NSLog(@"------setting-----");
}

-(void)imgViewClick
{
    if (self.navigationController.navigationBar.hidden) {
        
        self.navigationController.navigationBar.hidden = NO;
    }
    else
    {
        self.navigationController.navigationBar.hidden = YES;
    }

}

-(void)btn1Click
{
    NSLog(@"---btn1Click---");
    self.navigationController.navigationBar.hidden = YES;
    UIButton *coverBtn = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageWithName:@"bottleMaskBkg"];
    [coverBtn addSubview:image];
    
    self.coverBtn = coverBtn;
    [coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coverBtn];
}

-(void)btn2Click
{
    NSLog(@"---btn2Click---");
    self.navigationController.navigationBar.hidden = YES;
    UIButton *coverBtn = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageWithName:@"bottleBkgSpotLight"];
    
    [coverBtn addSubview:image];
    self.coverBtn = coverBtn;
    [coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coverBtn];
}

-(void)btn3Click
{
    DCMyBottleViewController *VC = [[DCMyBottleViewController alloc]init];
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)coverBtnClick
{
    [self.coverBtn removeFromSuperview];
}
@end
