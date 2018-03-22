//
//  DCStatusDetailViewFrame.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCStatus;
@interface DCStatusDetailViewFrame : NSObject

// name
@property(assign, nonatomic) CGRect nameFrame;
// text
@property(assign, nonatomic) CGRect textFrame;
// picturesView
@property(assign, nonatomic) CGRect picturesFrame;

// toolbar
@property(assign, nonatomic) CGRect toolbarFrame;


// 自己的frame
@property(assign, nonatomic) CGRect frame;

// 根据数据计算子控件的frame
@property (strong, nonatomic) DCStatus *retweeted_status;

@end
