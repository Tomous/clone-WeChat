//
//  DCScrollViewController.m
//  新浪微博
//
//  Created by 尚承教育 on 15/8/2.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCScrollViewController.h"
#import "DCBaseTableViewController.h"
#import "DCFriendsViewController.h"
#define kImageMaxCount 4
@interface DCScrollViewController ()<UIScrollViewDelegate>

@property(weak,nonatomic)UIPageControl *pageControl;

@property (weak,nonatomic)UIImageView *imageView;

@end

@implementation DCScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupScrollView];
    
    [self setupPageControl];
}

-(void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.delegate = self;
    
    for (int i = 0; i < kImageMaxCount; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:scrollView.frame];
        imageView.userInteractionEnabled = YES;
        imageView.x = i *scrollView.width;
        self.imageView = imageView;
        
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i +1];
        if (FourInch) {
            name = [name stringByAppendingString:@"-568h"];
        }
        
        if (i == kImageMaxCount -1) {
            
            [self setupLastImageView];
        }
        imageView.image = [UIImage imageWithName:name];
        
        [scrollView addSubview:imageView];
    }
    
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.shouldGroupAccessibilityChildren = NO;
    scrollView.contentSize = CGSizeMake(kImageMaxCount * self.view.width, 0);
    
    [self.view addSubview:scrollView];

    
}

-(void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.centerX = self.view.width * 0.5;
    pageControl.y = self.view.height - 30;
    pageControl.numberOfPages = kImageMaxCount;
    pageControl.currentPageIndicatorTintColor = DCColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = DCColor(189, 189, 189);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.width + 0.5;
}

-(void)setupLastImageView
{
    [self setupShareBtn];
    [self setupStartBtn];
}

-(void)setupStartBtn
{
    
    
    UIButton *startBtn = [[UIButton alloc]init];
    startBtn.size = CGSizeMake(100, 30);
    startBtn.centerX = self.view.width * 0.5;
    startBtn.centerY = self.view.height * 0.8;
    
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    
    [startBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn addTarget:self action:@selector(clickStartBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addSubview:startBtn];
    
}

-(void)setupShareBtn
{
    
    UIButton *shareBtn = [[UIButton alloc]init];
    shareBtn.adjustsImageWhenHighlighted = NO;
    shareBtn.size = CGSizeMake(110, 30);
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.centerX = self.view.width * 0.5;
    shareBtn.centerY = self.view.height * 0.7;
    
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    
    [shareBtn setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.imageView addSubview:shareBtn];
    
}

-(void)clickShareBtn:(UIButton *)shareBtn
{
    shareBtn.selected = !shareBtn.selected;
}

-(void)clickStartBtn:(UIButton *)startBtn
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    //切换控制器
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[DCFriendsViewController alloc]init];
}
@end
