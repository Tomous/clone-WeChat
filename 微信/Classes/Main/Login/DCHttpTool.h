//
//  DCHttpTool.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCHttpTool : NSObject

+(void)getWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
