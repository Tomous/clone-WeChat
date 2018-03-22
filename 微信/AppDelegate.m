//
//  AppDelegate.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "AppDelegate.h"
#import "DCTabBarViewController.h"
#import "DCLoginViewController.h"
#import "DCAccount.h"
#import "DCAccountTool.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "DCControllerTool.h"
#import "DCTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //还原状态栏
//    application.statusBarHidden = NO;
    
    // 1 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 3 成为主窗口并显示
    [self.window makeKeyAndVisible];
    
    // 2 取出来account
    DCAccount *account = [DCAccountTool account];
    if (account) {
        
        [DCControllerTool chooesRootVC];
    }
    else
    {
        self.window.rootViewController = [[DCTabBarViewController alloc]init];
    }
    
    // 监听网络
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:     // 未知网络
            case AFNetworkReachabilityStatusNotReachable:
                [MBProgressHUD showError:@"网络异常，请检查网络设置！"];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"手机自带网络");
                break;
                
            default:
                break;
        }
    }];
    
    [manager startMonitoring];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
