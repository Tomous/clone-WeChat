//
//  DCUserTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCUserTool.h"

@implementation DCUserTool

+(void)userInfoWithParam:(DCUserinfoParam *)param success:(void (^)(DCUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[DCUserInfoResult class] success:success failure:failure];
    
}

@end
