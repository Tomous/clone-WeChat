//
//  DCAccountTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCAccountTool.h"
#import "DCAccount.h"

#define kAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
@implementation DCAccountTool

+(void)save:(DCAccount *)account
{
    NSDate *now = [[NSDate alloc]init];
    account.value_time = [now dateByAddingTimeInterval:account.expires_in.doubleValue];
    
    // 保存
    [NSKeyedArchiver archiveRootObject:account toFile:kAccountPath];
}

+(DCAccount *)account
{
    DCAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountPath];
    
    // 拿出有效期和现在进行比较，如果过期了，返回空
    NSDate *now = [[NSDate alloc]init];
    if ([account.value_time compare:now] == NSOrderedAscending) {
        account = nil;
    }
    return account;
}

// 获取accessToken
+(void)accessTokenWithParam:(DCAccessTokenParam *)param success:(void(^)(DCAccessTokenResult *result))success failure:(void (^)(NSError *error))failure
{
    [self postWithUrl:@"https://api.weibo.com/oauth2/access_token" param:param resultClass:[DCAccessTokenResult class] success:success failure:failure];
}


@end
