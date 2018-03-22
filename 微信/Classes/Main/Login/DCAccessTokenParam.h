//
//  DCAccessTokenParam.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCAccessTokenParam : NSObject
/*
client_id	true	string	申请应用时分配的AppKey。
client_secret	true	string	申请应用时分配的AppSecret。
grant_type	true	string	请求的类型，填写authorization_code

grant_type为authorization_code时
必选	类型及范围	说明
code	true	string	调用authorize获得的code值。
redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
*/
@property(copy,nonatomic) NSString *client_id;
@property(copy,nonatomic) NSString *client_secret;

@property(copy,nonatomic) NSString *grant_type;

@property(copy,nonatomic) NSString *code;
@property(copy,nonatomic) NSString *redirect_uri;


@end
