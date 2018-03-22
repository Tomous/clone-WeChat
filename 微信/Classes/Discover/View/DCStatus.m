//
//  DCStatus.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatus.h"
#import "MJExtension.h"
#import "DCPhoto.h"
#import "NSDate+MJ.h"
@implementation DCStatus

-(NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[DCPhoto class]};
}

-(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

-(NSString *)created_at
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    NSDate *date = [df dateFromString:_created_at];
    
    if (date.isThisYear) {
        
        if (date.isToday) {
            
            NSDateComponents *components = [date deltaWithNow];
            
            if (components.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前",components.hour];
            }
            else if (components.minute >= 1)
            {
                return [NSString stringWithFormat:@"%ld分钟前",components.minute];
            }
            else
            {
                return @"刚刚";
            }
            
        }
        else if (date.isYesterday)  // 昨天
        {
            df.dateFormat = @"昨天 HH:mm";
            return [df stringFromDate:date];
        }
        else    // 前天以前
        {
            df.dateFormat = @"MM-dd HH:mm";
            return [df stringFromDate:date];
            
        }
    }
    else
    {
        df.dateFormat = @"yyyy-MM-dd";
        return  [df stringFromDate:date];
        
    }
}

// 来源
-(void)setSource:(NSString *)source
{
    if(source.length == 0) return;
    
    NSRange range;
    
    range.location = [source rangeOfString:@">"].location + 1;
    range.length = [source rangeOfString:@"</"].location - range.location;
    
    NSString *realSource = [source substringWithRange:range];
    
    NSLog(@"%@",source);
    
    _source = [NSString stringWithFormat:@"来自%@",realSource];
}

@end
