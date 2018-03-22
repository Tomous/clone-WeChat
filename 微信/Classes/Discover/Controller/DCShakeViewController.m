//
//  DCShakeViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/25.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCShakeViewController.h"
#import "DCShakeSettingViewController.h"
#import "DCNavigationViewController.h"
@interface DCShakeViewController ()

@property(strong,nonatomic) UIButton *btn1;
@property(strong,nonatomic) UIButton *btn2;
@property(strong,nonatomic) UIButton *btn3;
@property(strong,nonatomic)UIButton *lastBtn;

@end

@implementation DCShakeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"MoreSetting" higImageName:nil action:@selector(shakeSetting) target:self];
    
    [self setupImageView];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc]init];
    titleItem.title = @"nihao";
    titleItem.tintColor = [UIColor whiteColor];
    
    
}

-(void)setupImageView
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imgView.image = [UIImage imageWithName:@"ShakeforsongBgshade"];
    

    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 180, 150, 100)];
    imageView1.image = [UIImage imageWithName:@"Shake_Logo_Up"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 280, 150, 100)];
    imageView2.image = [UIImage imageWithName:@"Shake_Logo_Down"];
    [imgView addSubview:imageView1];
    [imgView addSubview:imageView2];
    [self.view addSubview:imgView];
    
    CGFloat btn1X = 0;
    CGFloat btn1H = 100;
    CGFloat btn1W = self.view.width / 3;
    CGFloat btn1Y = 580;
    UIButton *Btn1 = [[UIButton alloc]initWithFrame:CGRectMake(btn1X, btn1Y, btn1W, btn1H)];
    Btn1.selected = YES;
    self.btn1 = Btn1;
    
    CGFloat btn2X = btn1W;
    CGFloat btn2H = btn1H;
    CGFloat btn2W = btn1W;
    CGFloat btn2Y = btn1Y;
    UIButton *Btn2 = [[UIButton alloc]initWithFrame:CGRectMake(btn2X, btn2Y, btn2W, btn2H)];
    self.btn2 = Btn2;
    
    CGFloat btn3X = btn2W * 2;
    CGFloat btn3H = btn1H;
    CGFloat btn3W = btn1W;
    CGFloat btn3Y = btn1Y;
    UIButton *Btn3 = [[UIButton alloc]initWithFrame:CGRectMake(btn3X, btn3Y, btn3W, btn3H)];
    self.btn3 = Btn3;
    
    [Btn1 setImage:[UIImage imageWithName:@"Shake_icon_people"] forState:UIControlStateNormal];
    [Btn1 setImage:[UIImage imageWithName:@"Shake_icon_peopleHL"] forState:UIControlStateSelected];
    Btn1.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn1 setTitle:[NSString stringWithFormat:@"人"] forState:UIControlStateNormal];
    Btn1.titleEdgeInsets = UIEdgeInsetsMake(15, -60, 0, -5);
    [Btn1 addTarget:self action:@selector(btn1Clickd) forControlEvents:UIControlEventTouchUpInside];
    
    [Btn2 setImage:[UIImage imageWithName:@"Shake_icon_music"] forState:UIControlStateNormal];
    [Btn2 setImage:[UIImage imageWithName:@"Shake_icon_musicHL"] forState:UIControlStateSelected];
    Btn2.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn2 setTitle:[NSString stringWithFormat:@"歌曲"] forState:UIControlStateNormal];
    Btn2.titleEdgeInsets = UIEdgeInsetsMake(15, -75, 0, -5);
    [Btn2 addTarget:self action:@selector(btn2Clickd) forControlEvents:UIControlEventTouchUpInside];
    
    [Btn3 setImage:[UIImage imageWithName:@"Shake_icon_tv"] forState:UIControlStateNormal];
    [Btn3 setImage:[UIImage imageWithName:@"Shake_icon_tvHL"] forState:UIControlStateSelected];
    Btn3.imageEdgeInsets = UIEdgeInsetsMake(-60, 0, 0, 0);
    [Btn3 setTitle:[NSString stringWithFormat:@"电视"] forState:UIControlStateNormal];
    Btn3.titleEdgeInsets = UIEdgeInsetsMake(15, -75, 0, -5);
    [Btn3 addTarget:self action:@selector(btn3Clickd) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Btn1];
    [self.view addSubview:Btn2];
    [self.view addSubview:Btn3];
    
    
}

-(void)shakeSetting
{
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:[[DCShakeSettingViewController alloc]init]];
    
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)btn1Clickd
{
    if (!self.btn2.selected || !self.btn3.selected) {
        self.btn1.selected = YES;
        self.btn2.selected = NO;
        self.btn3.selected = NO;
    }
}

-(void)btn2Clickd
{
    if (!self.btn1.selected || !self.btn3.selected) {
        self.btn2.selected = YES;
        self.btn1.selected = NO;
        self.btn3.selected = NO;
    }

}

-(void)btn3Clickd
{
    if (!self.btn1.selected || !self.btn2.selected) {
        self.btn3.selected = YES;
        self.btn2.selected = NO;
        self.btn1.selected = NO;
    }


}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"开始摇动手机");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    UIAlertView *yaoyiyao = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:nil delegate:self cancelButtonTitle:@"----" otherButtonTitles:nil, nil];
    [yaoyiyao show];
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"取消");
}


@end
