//
//  DCHomeResult.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCHomeResult.h"
#import "DCStatus.h"
@implementation DCHomeResult

-(NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [DCStatus class]};
}

@end
