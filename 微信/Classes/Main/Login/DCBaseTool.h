//
//  DCBaseTool.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCBaseTool : NSObject

+(void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;

+(void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;


@end
