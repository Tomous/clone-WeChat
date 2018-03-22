//
//  DCShakeSettingViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/30.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCShakeSettingViewController.h"
#import "DCCellArrowModel.h"
#import "DCCellSwitchModel.h"
#import "DCGroup.h"
@interface DCShakeSettingViewController ()

@end

@implementation DCShakeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
    
    [self setupShakeSetting];
}

-(void)setupShakeSetting
{
    DCGroup *g0 = [[DCGroup alloc]init];
    [self.groupDatas addObject:g0];
    DCCellArrowModel *cell0 = [DCCellArrowModel cellWithIcon:nil title:@"使用默认的背景图片" destVC:nil];
    DCCellArrowModel *cell1 = [DCCellArrowModel cellWithIcon:nil title:@"换张背景图片" destVC:nil];
    DCCellSwitchModel *cell2 = [DCCellSwitchModel cellWithIcon:nil title:@"音效" destVC:nil];
    g0.cells = @[cell0,cell1,cell2];
    
    DCGroup *g1 = [[DCGroup alloc]init];
    [self.groupDatas addObject:g1];
    DCCellArrowModel *cell3 = [DCCellArrowModel cellWithIcon:nil title:@"打招呼的人" destVC:nil];
    DCCellArrowModel *cell4 = [DCCellArrowModel cellWithIcon:nil title:@"摇到的历史" destVC:nil];
    g1.cells = @[cell3,cell4];

    DCGroup *g2 = [[DCGroup alloc]init];
    [self.groupDatas addObject:g2];
    DCCellArrowModel *cell5 = [DCCellArrowModel cellWithIcon:nil title:@"摇一摇消息" destVC:nil];
    g2.cells = @[cell5];

    
    
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
