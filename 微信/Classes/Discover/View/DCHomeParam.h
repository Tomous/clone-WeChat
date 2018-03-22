//
//  DCHomeParam.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseParam.h"

@interface DCHomeParam :DCBaseParam

/** 	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。*/
//@property (copy, nonatomic) NSString *access_token;

/** 	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。*/
@property (strong, nonatomic) NSNumber *since_id;

/** 	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。*/
@property (strong, nonatomic) NSNumber *max_id;

/** 	false	int	单页返回的记录条数，最大不超过100，默认为20。*/
//@property(strong, nonatomic) NSNumber *count;

@end
