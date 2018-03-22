//
//  DCGroup.h
//  微信
//
//  Created by 尚承教育 on 15/7/21.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCGroup : NSObject

@property(copy,nonatomic) NSString *header;
@property(copy,nonatomic) NSString *footer;


@property(strong,nonatomic)NSArray *cells;

//+(instancetype)group;

@end
