//
//  DCStatusOriginalFrame.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCStatus;
@interface DCStatusOriginalFrame : NSObject

// name
@property(assign, nonatomic) CGRect nameFrame;
// time
//@property(assign, nonatomic) CGRect timeFrame;
// source
//@property(assign, nonatomic) CGRect sourceFrame;
// text
@property(assign, nonatomic) CGRect textFrame;
// icon
@property(assign, nonatomic) CGRect iconFrame;
// picturesView
@property(assign, nonatomic) CGRect picturesFrame;

// 自己的frame
@property(assign, nonatomic) CGRect frame;

// 根据数据计算子控件的frame
@property (strong, nonatomic) DCStatus *status;
@end
