//
//  DCTabBarViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCTabBarViewController.h"
#import "DCWeiChatTableViewController.h"
#import "DCChatListTableViewController.h"
#import "DCDiscoverTableViewController.h"
#import "DCMeTableViewController.h"
#import "DCNavigationViewController.h"

@interface DCTabBarViewController ()

@end

@implementation DCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    DCWeiChatTableViewController *weiChat = [[DCWeiChatTableViewController alloc]init];
    [self addchilVC:weiChat title:@"微信" imageName:@"tabbar_mainframe" selImageName:@"tabbar_mainframeHL"];
    
    DCChatListTableViewController *chatList = [[DCChatListTableViewController alloc]init];
    [self addchilVC:chatList title:@"通讯录" imageName:@"tabbar_contacts" selImageName:@"tabbar_contactsHL"];
    
    DCDiscoverTableViewController *discover = [[DCDiscoverTableViewController alloc]init];
    [self addchilVC:discover title:@"发现" imageName:@"tabbar_discover" selImageName:@"tabbar_discoverHL"];
    
    
    DCMeTableViewController *me = [[DCMeTableViewController alloc]init];
    [self addchilVC:me title:@"我" imageName:@"tabbar_me" selImageName:@"tabbar_meHL"];
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *selDict = [NSMutableDictionary dictionary];
    selDict[NSForegroundColorAttributeName] = [UIColor greenColor];
    [item setTitleTextAttributes:selDict forState:UIControlStateSelected];
    
    
}

-(void)addchilVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    VC.title = title;
    
    UIImage *selImage = [UIImage imageWithName:selImageName];
    
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    [VC.tabBarItem setImage:[UIImage imageWithName:imageName]];
    [VC.tabBarItem setSelectedImage:selImage];
    
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
    [self addChildViewController:nav];
}

@end
