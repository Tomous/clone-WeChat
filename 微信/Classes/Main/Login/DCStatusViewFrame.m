//
//  DCStatusViewFrame.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusViewFrame.h"
#import "DCStatusOriginalFrame.h"
#import "DCStatusDetailViewFrame.h"
#import "DCStatus.h"

@implementation DCStatusViewFrame
-(void)setStatus:(DCStatus *)status
{
    _status = status;
    
    // originalFrame
    DCStatusOriginalFrame *originalFrame = [[DCStatusOriginalFrame alloc]init];
    originalFrame.status = status;
    self.originalFrame = originalFrame;
    
    // retweetedFrame
    // 默认是 original的最大Y值
    CGFloat h = CGRectGetMaxY(self.originalFrame.frame);
    
    if (status.retweeted_status) {
        
        DCStatusDetailViewFrame *retweetedFrame = [[DCStatusDetailViewFrame alloc]init];
        retweetedFrame.retweeted_status = status.retweeted_status;
        self.retweetedFrame = retweetedFrame;
        
        // 给retweetedFrame的y赋值
        CGRect frame = retweetedFrame.frame;
        frame.origin.y = CGRectGetMaxY(self.originalFrame.frame);
        retweetedFrame.frame  = frame;
        
        h = CGRectGetMaxY(self.retweetedFrame.frame);
    }
    
    // 自己frame
    CGFloat x = 0;
    CGFloat y = DCStatusCellMargin;
    CGFloat w = DCScreenW;
    self.frame = CGRectMake(x, y, w, h);
    
}

@end
