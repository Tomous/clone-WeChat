//
//  DCLittleImgClickViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/25.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCLittleImgClickViewController.h"

@interface DCLittleImgClickViewController ()

@end

@implementation DCLittleImgClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"bottleReceiverVoiceNodePlaying" higImageName:nil action:@selector(xiangxiziliao) target:self];
    
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)xiangxiziliao
{
    NSLog(@"-------xiangxiziliao-------");
}
@end
