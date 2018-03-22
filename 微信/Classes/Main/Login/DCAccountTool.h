//
//  DCAccountTool.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseTool.h"
#import "DCAccount.h"
#import "DCAccessTokenParam.h"
#import "DCAccessTokenResult.h"
@class DCAccount;
@interface DCAccountTool : DCBaseTool

+(void)save:(DCAccount *)account;

+(DCAccount *)account;

// 获取accessToken
+(void)accessTokenWithParam:(DCAccessTokenParam *)param success:(void(^)(DCAccessTokenResult *result))success failure:(void (^)(NSError *error))failure;



@end
