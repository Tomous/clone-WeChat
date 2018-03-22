//
//  DCStatusFrame.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCStatus,DCStatusViewFrame;
@interface DCStatusFrame : NSObject

// JWStatusViewFrame
@property (strong, nonatomic) DCStatusViewFrame *statusViewFrame;

// toolbar
@property(assign, nonatomic) CGRect toolBarFrame;

// cell高度
@property(assign, nonatomic) CGFloat cellHeight;

// 根据数据计算子控件的frame
@property (strong, nonatomic) DCStatus *status;
@end
