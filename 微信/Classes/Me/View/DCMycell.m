//
//  DCMycell.m
//  微信
//
//  Created by 尚承教育 on 15/7/25.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCMycell.h"

@implementation DCMycell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *str = @"cell";
    DCMycell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell = [[DCMycell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    return cell;
}
@end
