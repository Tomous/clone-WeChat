//
//  DCLoadMoreView.h
//  微信
//
//  Created by 尚承教育 on 15/8/4.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCLoadMoreView : UIView

@property(assign, nonatomic,getter=isRefreshing) BOOL refreshing;

+(instancetype)loadMoreView;

-(void)startRefresh;
-(void)endRefresh;
@end
