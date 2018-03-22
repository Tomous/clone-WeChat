//
//  DCCellModel.m
//  微信
//
//  Created by 尚承教育 on 15/7/21.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCCellModel.h"

@implementation DCCellModel

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.destVC = destVC;
    }
    return self;
}

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC
{
    return [[self alloc]initWithIcon:icon title:title destVC:destVC];
}

@end
