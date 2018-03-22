//
//  DCStatusViewFrame.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCStatus,DCStatusOriginalFrame,DCStatusDetailViewFrame;
@interface DCStatusViewFrame : NSObject

// originalFrame
@property (strong, nonatomic) DCStatusOriginalFrame  *originalFrame;

// retweetedFrame
@property (strong, nonatomic) DCStatusDetailViewFrame  *retweetedFrame;

// 自己的frame
@property(assign, nonatomic) CGRect frame;

// 根据数据计算子控件的frame
@property (strong, nonatomic) DCStatus *status;

@end
