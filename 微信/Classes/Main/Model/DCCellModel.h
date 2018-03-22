//
//  DCCellModel.h
//  微信
//
//  Created by 尚承教育 on 15/7/21.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DCCellModel : NSObject

// 点击cell跳到哪个控制器
@property(assign,nonatomic)Class destVC;

@property(copy,nonatomic) NSString *title;

@property(copy,nonatomic) NSString *icon;

// label下面的字体
@property(copy,nonatomic) NSString *subTitle;

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

@end
