//
//  DCAccount.m
//  微信
//
//  Created by 尚承教育 on 15/7/29.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCAccount.h"

@implementation DCAccount

+(instancetype)accountWithDict:(NSDictionary *)dict
{
    DCAccount *account = [[DCAccount alloc]init];
    account.access_token = dict[@"access_token"];
    account.uid = dict[@"uid"];
    account.expires_in = dict[@"expires_in"];
    return account;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.value_time = [aDecoder decodeObjectForKey:@"value_time"];
        self.name = [aDecoder decodeObjectForKey:@"name"];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.value_time forKey:@"value_time"];
    [aCoder encodeObject:self.name forKey:@"name"];

}

@end
