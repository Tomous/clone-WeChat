//
//  DCCommontItem.h
//  微信
//
//  Created by 尚承教育 on 15/7/21.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCCommontItem : NSObject

@property(copy,nonatomic) NSString *title;
@property(copy,nonatomic) NSString *icon;

@property(assign,nonatomic)Class destVcClass;


@end
