//
//  DCNavigationViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCNavigationViewController.h"

@interface DCNavigationViewController ()

@end

@implementation DCNavigationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
}

+(void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barStyle = UIBarStyleBlackTranslucent;

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    // 返回上一个控制器
    [self popViewControllerAnimated:YES];
    
    // 返回根控制器
//    [self popToRootViewControllerAnimated:YES];
}
@end
