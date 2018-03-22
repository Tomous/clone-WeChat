//
//  DCStatusTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusTool.h"
#import "DCHttpTool.h"
#import "MJExtension.h"
#import "DCStatus.h"
@implementation DCStatusTool

// 首页数据
+(void)loadHomeStatusWithParam:(DCHomeParam *)param success:(void(^)(DCHomeResult *result))success failure:(void (^)(NSError *error))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" param:param resultClass:[DCHomeResult class] success:success failure:failure];
}

//发微博
+(void)sendStatusWithParam:(DCSendMessageParam *)param success:(void (^)(DCSendMessageResult *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/2/statuses/update.json" param:param resultClass:[DCSendMessageResult class] success:success failure:failure];
}
@end
