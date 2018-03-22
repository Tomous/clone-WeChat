//
//  DCUserTool.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseTool.h"
#import "DCUserinfoParam.h"
#import "DCUserInfoResult.h"
@interface DCUserTool : DCBaseTool
// 获取用户信息
+(void)userInfoWithParam:(DCUserinfoParam *)param success:(void(^)(DCUserInfoResult *result))success failure:(void (^)(NSError *error))failure;


@end
