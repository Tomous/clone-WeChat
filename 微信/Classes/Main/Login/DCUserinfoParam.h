//
//  DCUserinfoParam.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseParam.h"

@interface DCUserinfoParam : DCBaseParam
/** string 要获取的用户的ID */
@property (copy, nonatomic) NSString *uid;

@end
