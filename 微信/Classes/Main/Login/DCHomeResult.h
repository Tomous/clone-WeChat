//
//  DCHomeResult.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCHomeResult : NSObject

/** 对应返回的statuses字段,里面是JWStatus模型 */
@property (strong, nonatomic) NSArray *statuses;

/** 返回的微博总条数 */
@property(assign, nonatomic) int total_number;
@end
