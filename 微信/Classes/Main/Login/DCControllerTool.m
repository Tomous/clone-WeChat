//
//  DCControllerTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCControllerTool.h"
#import "DCFriendsViewController.h"
#import "DCScrollViewController.h"
#import "DCTabBarViewController.h"
#import "DCWeiChatTableViewController.h"
@implementation DCControllerTool

+(void)chooesRootVC
{
    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
    
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDict[versionKey];
    
    // 上次使用的版本号
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [ud objectForKey:versionKey];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    if (![currentVersion isEqualToString:lastVersion]) {
        // 新特性控制器
        window.rootViewController = [[DCScrollViewController alloc]init];
        
        // 存一下这次使用的版本号
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:currentVersion forKey:versionKey];
        [ud synchronize];
        
    }
    else
    {
        // 0 还原状态栏
        [UIApplication sharedApplication].statusBarHidden = NO;
        
        
        window.rootViewController = [[DCTabBarViewController alloc]init];
        
    }
    
}

@end
