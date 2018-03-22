//
//  DCStatusView.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusView.h"
#import "DCStatusOriginalFrame.h"
#import "DCStatusDetailViewFrame.h"
#import "DCStatusOriginalView.h"
#import "DCStatusDetailView.h"
#import "DCStatusViewFrame.h"
#import "DCStatusFrame.h"
#import "DCStatus.h"
@interface DCStatusView()

@property(weak,nonatomic)DCStatusOriginalView *originalView;

@property(weak,nonatomic)DCStatusDetailView *retweetedView;

@end
@implementation DCStatusView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        // 背景
        self.image = [UIImage resizableImage:@"timeline_card_top_background"];
        
        // originalView
        DCStatusOriginalView *originalView = [[DCStatusOriginalView alloc]init];
        [self addSubview:originalView];
        self.originalView = originalView;
        
        // retweetedView
        DCStatusDetailView *retweetedView = [[DCStatusDetailView alloc]init];
        [self addSubview:retweetedView];
        self.retweetedView = retweetedView;

    }
    return self;
}

-(void)setStatusViewFrame:(DCStatusViewFrame *)statusViewFrame
{
    _statusViewFrame = statusViewFrame;
    
    // original
    self.originalView.frame = statusViewFrame.originalFrame.frame;
    
    // 传originalFrame给originalView，里面设置小控件的frame
    self.originalView.originalFrame = statusViewFrame.originalFrame;
    
    // retweeted
    self.retweetedView.frame = statusViewFrame.retweetedFrame.frame;
    // 传retweetedFrame给retweetedView，里面设置小控件的frame
    self.retweetedView.retweetedFrame = statusViewFrame.retweetedFrame;
    
}

@end
