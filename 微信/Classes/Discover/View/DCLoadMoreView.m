//
//  DCLoadMoreView.m
//  微信
//
//  Created by 尚承教育 on 15/8/4.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCLoadMoreView.h"

@interface DCLoadMoreView()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadMoreView;


@end
@implementation DCLoadMoreView

+(instancetype)loadMoreView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"DCLoadMoreView" owner:nil options:nil]lastObject];
    
}

-(void)startRefresh
{
    self.messageLabel.text = @"大成哥正在拼命为你加载...";
    [self.loadMoreView startAnimating];
    
    self.refreshing = YES;
}

-(void)endRefresh
{
    self.messageLabel.text = @"上拉可以加载更多数据";
    [self.loadMoreView stopAnimating];
    
    self.refreshing = NO;
}

@end
