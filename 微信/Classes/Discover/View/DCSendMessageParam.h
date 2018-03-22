//
//  DCSendMessageParam.h
//  微信
//
//  Created by 尚承教育 on 15/8/5.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseParam.h"

@interface DCSendMessageParam : DCBaseParam

/** string 要发布的微博的内容 */
@property (copy, nonatomic) NSString *status;

@end
