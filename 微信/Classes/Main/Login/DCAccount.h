//
//  DCAccount.h
//  微信
//
//  Created by 尚承教育 on 15/7/29.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCAccount : NSObject<NSCoding>

/** string	用于调用access_token，接口获取授权后的access token。*/
@property (copy, nonatomic) NSString *access_token;
/** string	access_token的生命周期，单位是秒数。*/
@property (copy, nonatomic) NSString *expires_in;
/** string	当前授权用户的UID。*/
@property (copy, nonatomic) NSString *uid;
/** string	当前授权用户的昵称。*/
@property (copy, nonatomic) NSString *name;

/** 有限期 */
@property (copy, nonatomic) NSDate *value_time;

+(instancetype)accountWithDict:(NSDictionary *)dict;



@end
