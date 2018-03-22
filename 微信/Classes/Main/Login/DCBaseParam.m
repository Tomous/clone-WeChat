//
//  DCBaseParam.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseParam.h"
#import "DCAccountTool.h"
@implementation DCBaseParam

-(instancetype)init
{
    if (self = [super init]) {
        self.access_token = [DCAccountTool account].access_token;
    }
    return self;
}

@end
