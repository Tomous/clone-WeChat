//
//  DCPhoto.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCPhoto.h"

@implementation DCPhoto

-(void)setThumbnail_pic:(NSString *)thumbnail_pic
{
    _thumbnail_pic = thumbnail_pic;
    
    // 原图地址
    self.bmiddle_pic = [thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
}

@end
