//
//  DCStatusFrame.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusFrame.h"
#import "DCStatus.h"
#import "DCStatusViewFrame.h"

@implementation DCStatusFrame

-(void)setStatus:(DCStatus *)status
{
    _status = status;
    
    // JWStatusViewFrame
    
    DCStatusViewFrame *statusViewFrame = [[DCStatusViewFrame alloc]init];
    statusViewFrame.status = status;
    self.statusViewFrame = statusViewFrame;

    // toolbar
    CGFloat toolBarX = 0;
    CGFloat toolBarY = CGRectGetMaxY(self.statusViewFrame.frame);
    CGFloat toolBarW = DCScreenW;
    CGFloat toolBarH = 35;
    self.toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    // cell高度
    self.cellHeight = CGRectGetMaxY(self.toolBarFrame);
}

@end
