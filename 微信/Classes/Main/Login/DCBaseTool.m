//
//  DCBaseTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseTool.h"
#import "DCHttpTool.h"
#import "MJExtension.h"
@implementation DCBaseTool

+(void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [DCHttpTool getWithUrl:url params:[param keyValues] success:^(id responseObject) {
        
        if (success) {
            // responseObject是一条刚刚发的微博字典
            id result = [resultClass objectWithKeyValues:responseObject];
            
            // 调用外界的block，并把result结果传出去
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+(void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [DCHttpTool postWithUrl:url params:[param keyValues] success:^(id responseObject) {
        
        if (success) {
            // responseObject是一条刚刚发的微博字典
            id result = [resultClass objectWithKeyValues:responseObject];
            
            // 调用外界的block，并把result结果传出去
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
