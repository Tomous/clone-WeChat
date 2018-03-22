//
//  DCStatusTool.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseTool.h"
#import "DCHomeParam.h"
#import "DCHomeResult.h"
#import "DCSendMessageParam.h"
#import "DCSendMessageResult.h"
@interface DCStatusTool : DCBaseTool

// 加载首页的微博数据
+(void)loadHomeStatusWithParam:(DCHomeParam *)param success:(void(^)(DCHomeResult *result))success failure:(void (^)(NSError *error))failure;

// 发微博
+(void)sendStatusWithParam:(DCSendMessageParam *)param success:(void(^)(DCSendMessageResult *result))success failure:(void (^)(NSError *error))failure;

@end
