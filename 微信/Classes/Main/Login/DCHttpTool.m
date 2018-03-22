//
//  DCHttpTool.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCHttpTool.h"
#import "AFNetworking.h"
@implementation DCHttpTool

+(void)getWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if (success) {
            // 调用外面的block
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        // 调用外面的block
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}








@end
